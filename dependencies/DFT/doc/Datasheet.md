
## 1.1 Block Identification
* Block Name: Design-For-Testability
* Version / Revision: 1.0.0
* Designers: Fatima Boudali 

## 1.2 Function & Purpose
Analog DFT (Design For Test) adds **extra circuits (not used in normal operation)** to enable post-manufacturing testing.


### Block ID: SEL_LOGIC_01 (The Demultiplexer)

- **Role:** Receives a numeric address (e.g., 4 bits for 8 channels) and activates a single output.
- **Inputs:** Address `[0000;0001;0010;0011;0100;0101;0110;1111]`, Enable
- **Outputs:** S0, S1, S2, S3, S4, S5, S6, S7 (Digital control signals)
<!---
---

### Block ID: TG_ARRAY_01 (The Switching Matrix)

- Contains several instances of the **TG_CELL** sub-block.
- Each TG_CELL consists of an **NMOS and a PMOS in parallel**.
- **Role:** Pass the analogue signal with minimal distortion when selected.

---

### Block ID: BUFF_OUT_01 (Optional)

- **Role:** Follower amplifier to isolate the signal under test from probe capacitance.

---

## 2. Block Identification Details: TG_CELL

| Element        | Value / Name       | Description |
|---------------|------------------|------------|
| Instance Name | I_TG_CH0         | Instance 0 of the transmission port |
| Cell Name     | TG_ANLG_SWITCH   | Base model in library |
| Input Pins    | IN_SIG / CTRL_P / CTRL_N | Signal + control inputs |
| Output Pin    | OUT_ATB          | Connection to test bus |

---

## B. Function and Purpose


---

### 1. Function (How it works)

- **Accessibility:** Adds internal test points
- **Signal multiplexing:** Uses ATB (Analog Test Bus) to route signals
- **Isolation:** Prevents interference with normal operation
- **Stimulation:** Allows injection of test signals

---

### 2. Purpose (Why use it)

#### A. Improve Testability
- Converts chip from "black box" → observable system

#### B. Reduce Test Time
- Automated testing via ATE (Automatic Test Equipment)

#### C. Improve Yield
- Helps identify failure causes → improve future designs

#### D. BIST (Built-In Self-Test)
- Chip can self-test and output pass/fail

---

### Comparison: Without DFT vs With DFT

| Feature      | Without DFT        | With DFT                     |
|-------------|------------------|------------------------------|
| Visibility  | External pins only | Internal nodes accessible    |
| Diagnosis   | Guesswork         | Precise fault localization   |
| Silicon cost| Minimal           | +2% to 5% area              |
| Reliability | Uncertain         | Verified by measurements     |

---

## C. Operating Principle

1. **Digital Selection:** Address sent to demux  
2. **Decoding:** Activates one control line  
3. **TG Activation:** Selected gate closes  
4. **Signal Transfer:** Signal goes to ATB  

---

## 2. Detailed Operation

### A. Transmission Gate

- NMOS + PMOS in parallel

| Transistor | Behavior |
|-----------|--------|
| NMOS | Good near 0V, weak near VDD |
| PMOS | Good near VDD, weak near 0V |

👉 Combined → constant resistance across full range

---

### B. Demultiplexer

- Ensures only one signal connects to bus
- Uses **break-before-make** logic to avoid short circuits

---
-->
## 3. Key Equations

### Gate Resistance
