# RFID4410 Datasheet

## General Description

RFID4410 is a mixed-signal RFID-tag chip project built around:

- A checked-in digital baseband RTL top, `top_module`
- A chip-level LibreLane configuration for `RFID4410`
- One consolidated analog hard macro, `TOP_ANALOG` which include `PMU`, `POR`, `Clock Extractor`, `DFT`
- One IHP single-port SRAM macro, `RM_IHPSG13_1P_256x32_c2_bm_bist`

The digital core implements request/wake-up handling, two-cascade UID anti-collision, CRC-16 processing, SRAM read/write control, serialized transmit framing, and a dedicated test/BIST path. The analog side is delivered to the chip flow as the hard macro `TOP_ANALOG`, whose exported pins match the project's PMU, POR, clock-extractor, and DFT dependency set.

## Key Parameters

| Parameter | Value |
|---|---|
| Process / PDK target | IHP SG13CMOS  |
| Chip-flow design name | `RFID4410` |
| Checked-in RTL top | `top_module` |
| Die size | `1414 um x 1414 um` (`1.414 mm x 1.414 mm`) |
| Core area | `684 um x 684 um` (`0.684 mm x 0.684 mm`) |
| Clock constraint used by chip flow | `73.7 ns` (13.56Mhz) |
| Digital state machine | 10 states |
| UID length | 7 bytes |
| UID ROM | 2 words x 32 bits |
| User SRAM | 256 words x 32 bits |
| License | Apache-2.0 |

## Digital Core Interface

These are the ports of the checked-in RTL top `RFID4410-main/rtl/top_module.v`:

| Signal | Dir | Width | Description |
|---|---|---|---|
| `clk` | Input | 1 | Master clock input |
| `rst_n` | Input | 1 | Active-low synchronous reset |
| `rx_in` | Input | 1 | Serial receive input |
| `force_state` | Input | 4 | State/test forcing input |
| `test_mode` | Input | 1 | Enables DFT and BIST behavior |
| `tx_out` | Output | 1 | Serialized transmit output |
| `state_dbg` | Output | 4 | Current FSM state code |
| `clk_out` | Output | 1 | Derived clock output |

## Chip-Level Pad Plan

The chip-level LibreLane configuration defines 32 pad instances.

### South edge

| Pad instance | Description |
|---|---|
| `iovdd_pad_s` | I/O / analog supply pad |
| `iovss_pad_s` | Ground pad |
| `vdd_pad_s` | Core supply pad |
| `vss_pad_s` | Ground pad |
| `vdd_pad_n` | Additional core supply pad |
| `vss_pad_n` | Additional ground pad |
| `clk_pad` | Clock pad |
| `tx_out_pad` | Transmit-output pad |

### East edge

| Pad instance | Description |
|---|---|
| `DFT_S0_pad` | Analog DFT select input 0 |
| `DFT_S1_pad` | Analog DFT select input 1 |
| `DFT_S2_pad` | Analog DFT select input 2 |
| `DFT_EN_pad` | Analog DFT enable input |
| `analog_CLK_pad` | `TOP_ANALOG` `CLK` pin exposure |
| `analog_RESET_pad` | `TOP_ANALOG` `RESET` pin exposure |
| `analog_VDD_pad` | `TOP_ANALOG` `VDD` pin exposure |
| `analog_V_BGR_pad` | `TOP_ANALOG` `V_BGR` pin exposure |

### North edge

| Pad instance | Description |
|---|---|
| `clk_out_pad` | Derived clock output pad |
| `rx_in_pad` | Receive-input pad |
| `rst_n_pad` | Reset pad |
| `test_mode_pad` | Test-mode pad |
| `analog_ANTENNA1_pad` | `TOP_ANALOG` `ANTENNA1` pin exposure |
| `analog_ANTENNA2_pad` | `TOP_ANALOG` `ANTENNA2` pin exposure |
| `analog_VBIASP_pad` | `TOP_ANALOG` `VBIASP` pin exposure |
| `analog_DFT_pad` | `TOP_ANALOG` `DFT` output / observation pin |

### West edge

| Pad instance | Description |
|---|---|
| `force_state_pads[0]` | Force-state bit 0 |
| `force_state_pads[1]` | Force-state bit 1 |
| `force_state_pads[2]` | Force-state bit 2 |
| `force_state_pads[3]` | Force-state bit 3 |
| `state_dbg_pads[0]` | Debug-state bit 0 |
| `state_dbg_pads[1]` | Debug-state bit 1 |
| `state_dbg_pads[2]` | Debug-state bit 2 |
| `state_dbg_pads[3]` | Debug-state bit 3 |



## Protocol and State Summary

### FSM states

| State | Code |
|---|---|
| IDLE | 0 |
| READY1 | 1 |
| READY2 | 2 |
| ACTIVE | 3 |
| HALT | 4 |
| WAIT_ANTICOLL | 5 |
| WAIT_COMPARATOR | 6 |
| WAIT_CRC | 7 |
| WRITE_SRAM | 8 |
| READ_SRAM | 9 |

### Implemented command families

The checked-in RTL and benches implement these command families:

- Request / wake-up entry handling
- CL1 anti-collision and select
- CL2 anti-collision and select
- SRAM write (`0x66` path in the benches)
- SRAM read (`0x77` path in the benches)
- Halt (`0x44 0x00` path in the benches)
- Test-mode SRAM BIST write/read (`0xB1` / `0xB2`)

The exact transmitted byte order is the LSB-first convention used by `RFID4410-main/testbenches/tb_tasks.v`.

### Response codes

| Response | Value | Length |
|---|---|---|
| Presence / ready acknowledgment | `0x4C00` | 16 bits |
| Error response | `0xEE` | 8 bits |
| CRC error response | `0xCC` | 8 bits |
| Halt / write acknowledgment | `0xAA` | 8 bits |
| READY1 select acknowledgment | `0x04` + CRC | 24 bits |
| READY2 select acknowledgment | `0x00` + CRC | 24 bits |
| SRAM read data | 32-bit word + CRC | 48 bits |

## UID and Memory Map

### Fixed UID ROM contents

| ROM page | Value |
|---|---|
| 0 | `32'h33221188` |
| 1 | `32'h77665544` |

### Derived UID structure

| Portion | Value |
|---|---|
| CL1 payload | `40'h8833221188` |
| CL2 payload | `40'h0077665544` |
| Full 7-byte UID | `11 22 33 44 55 66 77` |

### User memory

| Parameter | Value |
|---|---|
| Macro | `RM_IHPSG13_1P_256x32_c2_bm_bist` |
| Organization | `256 x 32` |
| Address range | `0x00` to `0xFF` |
| Access modes | Normal read/write and BIST read/write |

## CRC

| Parameter | Value |
|---|---|
| Polynomial | `0x1021` |
| Initial value | `0x6363` |
| Processing | 8-bit chunks |
| Residue check | Pass when CRC result is `0x0000` |
| Output formatting | Byte-swapped at `crc_o` |

## Test and BIST Mode

When `test_mode = 1`, `digital_block_15` changes behavior as follows:

- `force_state = 4'b0000`: decode direct SRAM BIST commands
- `force_state != 0`: inject canned decoder outputs used by the verification benches
- `out_str` is pulsed on test-mode entry or on `force_state` change

### Direct BIST commands

| Command path | Effect |
|---|---|
| `0xB1` | Write `{in_16bits_B, in_16bits_A}` to address `{in_4bits_D, in_4bits_B}` |
| `0xB2` | Read from address `{in_4bits_D, in_4bits_B}` and set `sram_dout_len = 32` |


