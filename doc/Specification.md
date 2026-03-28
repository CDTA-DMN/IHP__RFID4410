# RFID4410 System Specification



## Digital Core Interface

The checked-in synthesizable RTL top exposes the following interface:

| Signal | Dir | Width | Description |
|---|---|---|---|
| `clk` | Input | 1 | Master clock for the digital core |
| `rst_n` | Input | 1 | Active-low synchronous reset |
| `rx_in` | Input | 1 | Serial receive input from the front-end |
| `force_state` | Input | 4 | FSM / test stimulus forcing input |
| `test_mode` | Input | 1 | Enables DFT/test-vector and BIST behavior |
| `tx_out` | Output | 1 | Serialized transmit output |
| `state_dbg` | Output | 4 | Encoded FSM state for observability |
| `clk_out` | Output | 1 | Derived clock output from `digital_block_10` |

## Control-State Requirements

### FSM state encoding

| State | Code |
|---|---|
| `STATE_IDLE` | 0 |
| `STATE_READY1` | 1 |
| `STATE_READY2` | 2 |
| `STATE_ACTIVE` | 3 |
| `STATE_HALT` | 4 |
| `STATE_WAIT_ANTICOLL` | 5 |
| `STATE_WAIT_COMPARATOR` | 6 |
| `STATE_WAIT_CRC` | 7 |
| `STATE_WRITE_SRAM` | 8 |
| `STATE_READ_SRAM` | 9 |

### Implemented command families

The RTL and shipped testbenches implement:

- Request / wake-up entry handling from `IDLE` and `HALT`
- Two cascade levels of anti-collision / selection using the fixed ROM UID
- SRAM write transactions on the `0x66` command path exercised by the benches
- SRAM read transactions on the `0x77` command path exercised by the benches
- Halt handling on the `0x44 0x00` command path exercised by the benches
- Test-mode SRAM BIST access on the `0xB1` / `0xB2` command paths decoded in `digital_block_15`

The exact byte encodings are the LSB-first values driven by `RFID4410-main/testbenches/tb_tasks.v` and decoded by `RFID4410-main/rtl/fsm.v`.

## Response Requirements

| Response / symbol | Value | Notes |
|---|---|---|
| `RESP_OK_4C` | `8'h4C` | Used in the 16-bit `0x4C00` acknowledgment path |
| `RESP_ERROR_00` | `8'hEE` | Parity / invalid-frame error response |
| `RESP_HALT_AA` | `8'hAA` | Acknowledgment used after halt and write completion |
| `RESP_CRC_ERROR_CC` | `8'hCC` | CRC check failure response |
| `RESP_READY1_04` | `8'h04` | 24-bit post-select acknowledgment with CRC append |
| `RESP_READY2_00` | `8'h00` | 24-bit post-select acknowledgment with CRC append |

Transmitted response lengths implemented in the RTL are 8, 16, 24, 40, and 48 bits.

## UID, ROM, and Anti-Collision

### ROM contents

| ROM page | Value |
|---|---|
| 0 | `32'h33221188` |
| 1 | `32'h77665544` |

### Derived UID structure

The fixed two-cascade UID assembled by the anti-collision path is:

- CL1 payload: `40'h8833221188`
- CL2 payload: `40'h0077665544`
- Full 7-byte UID: `11 22 33 44 55 66 77`

The anti-collision logic computes the BCC byte as the XOR of the four preceding bytes in each cascade level.

### Anti-collision outputs

| Signal | Description |
|---|---|
| `valid` | Anti-collision response valid |
| `d_len` | Anti-collision response length in bits |
| `out_16bits_A`, `out_16bits_B`, `out_8bits_A` | Packed anti-collision payload |
| `n_me` | No-match indication on partial compare |

## CRC Requirements

| Parameter | Value |
|---|---|
| Polynomial | `16'h1021` |
| Initial value | `16'h6363` |
| Processing width | 8 bits per cycle of `digital_block_02` |
| Data ordering | LSB-first byte handling, matching the testbench helper |
| Output formatting | Byte-swapped at the `crc_o` output: `{crc[7:0], crc[15:8]}` |
| Check pass criterion | `crc_out == 16'h0000` in `digital_block_03` |

## SRAM and Test Memory Requirements

| Item | Value |
|---|---|
| Macro | `RM_IHPSG13_1P_256x32_c2_bm_bist` |
| Organization | 256 words x 32 bits |
| Address width | 8 bits |
| Normal controls | `A_MEN`, `A_WEN`, `A_REN`, `A_ADDR`, `A_DIN` |
| BIST controls | `A_BIST_EN`, `A_BIST_MEN`, `A_BIST_WEN`, `A_BIST_REN`, `A_BIST_ADDR`, `A_BIST_DIN` |
| Write mask | Hard-wired to `32'hFFFFFFFF` in the wrapper |
| Read/write completion flag | `dout_valid`, generated from the wrapper `op_pending` flag |

## Test-Mode Requirements

| Requirement | Description |
|---|---|
| Test enable | `test_mode = 1` enables `digital_block_15` injection behavior |
| Pass-through mode | `test_mode = 0` forwards decoded RX fields unchanged |
| One-shot trigger | `out_str` pulses on test-mode entry or `force_state` change |
| Direct SRAM BIST write | In `test_mode` with `force_state = 4'b0000`, command byte `0xB1` writes `{in_16bits_B, in_16bits_A}` to address `{in_4bits_D, in_4bits_B}` |
| Direct SRAM BIST read | In `test_mode` with `force_state = 4'b0000`, command byte `0xB2` reads from address `{in_4bits_D, in_4bits_B}` and sets `sram_dout_len = 32` |
| Predefined vector injection | Non-zero `force_state` values inject canned decoder outputs used by the verification benches to drive state transitions |

## Chip-Level Integration Requirements

### Hard macro inventory used by the chip flow

| Macro | Source used by flow | Notes |
|---|---|---|
| `TOP_ANALOG` | `dependencies/TOP_ANALOG/TOP_ANALOG-main/layout/lef/TOP_ANALOG.lef` + GDS | Consolidated analog hard macro instantiated at chip level |
| `RM_IHPSG13_1P_256x32_c2_bm_bist` | IHP PDK macro | Instantiated inside the digital core |
| `bondpad_70x70_novias` | External LEF/GDS listed in LibreLane config | Used as the bondpad cell |

Dependency netlists are present for PMU (`pmu_tagwave`), POR (`layout_POR`), clock extraction (`Clock_Extractor_2026`), and DFT (`DFT`), while the chip flow itself instantiates only the consolidated `TOP_ANALOG` macro.

### `TOP_ANALOG` exported pins

The checked-in LEF for `TOP_ANALOG` exports:

- `RESET`
- `CLK`
- `VBIASP`
- `DFT_S2`
- `DFT_S1`
- `DFT_S0`
- `DFT_EN`
- `ANTENNA2`
- `ANTENNA1`
- `DFT`
- `V_BGR`
- `VSS`
- `IOVDD`
- `VDD`

`TOP_ANALOG` LEF size is `280.510 um x 97.585 um`.

### Pad-ring plan from LibreLane config

The chip-level LibreLane configuration defines 32 pad instances:

| Edge | Pads |
|---|---|
| South | `iovdd_pad_s`, `iovss_pad_s`, `vdd_pad_s`, `vss_pad_s`, `vdd_pad_n`, `vss_pad_n`, `clk_pad`, `tx_out_pad` |
| East | `DFT_S0_pad`, `DFT_S1_pad`, `DFT_S2_pad`, `DFT_EN_pad`, `analog_CLK_pad`, `analog_RESET_pad`, `analog_VDD_pad`, `analog_V_BGR_pad` |
| North | `clk_out_pad`, `rx_in_pad`, `rst_n_pad`, `test_mode_pad`, `analog_ANTENNA1_pad`, `analog_ANTENNA2_pad`, `analog_VBIASP_pad`, `analog_DFT_pad` |
| West | `force_state_pads[0..3]`, `state_dbg_pads[0..3]` |

## LibreLane Physical-Implementation Parameters

| Parameter | Value |
|---|---|
| Flow | `Chip` |
| `DESIGN_NAME` | `RFID4410` |
| Clock constraint | `CLOCK_PORT: clk_PAD`, `CLOCK_PERIOD: 73.7 ns` |
| Die area | `1414 um x 1414 um` |
| Core area | `684 um x 684 um` (`[365,365]` to `[1049,1049]`) |
| Placement density target | `18%` |
| Core power nets | `VDD`, `VSS` |
| PDN ring | Enabled (`PDN_CORE_RING: True`) |
| Bondpad cell | `bondpad_70x70_novias` |
| SRAM placement | `u_top_module.u_digital_block_14.u_sram` at `[390, 390]`, orientation `S` |
| Analog macro placement | `u_TOP_ANALOG` at `[749, 928]`, orientation `N` |


