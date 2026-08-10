# 🎲 Digital Dice Using Verilog

## 📌 Project Overview

This project implements a simple **Digital Dice** using Verilog HDL.

The system generates a number between **1 and 6** and displays the result on a 7-segment display.

The user presses a `roll` button to generate a new dice value.

---

## 📁 Project Structure

```text
digital-dice-verilog/
│
├── digital_dice.v
├── digital_dice_tb.v
└── README.md
```

### Files

| File                | Description           |
| ------------------- | --------------------- |
| `digital_dice.v`    | Main Verilog design   |
| `digital_dice_tb.v` | Verilog testbench     |
| `README.md`         | Project documentation |

---

## ⚙️ Working Principle

The design contains three main sections:

### 1. Random Counter

A 3-bit counter continuously cycles through:

```text
1 → 2 → 3 → 4 → 5 → 6 → 1 → 2 → ...
```

### 2. Roll Control

When the `roll` input becomes high, the current counter value is stored as the dice result.

For example:

```text
roll = 1
random_count = 4
```

The dice result becomes:

```text
dice_value = 4
```

### 3. 7-Segment Decoder

The dice value is converted into the appropriate 7-segment pattern.

```text
Dice Value     SEG
-------------------------
1              1111001
2              0100100
3              0110000
4              0011001
5              0010010
6              0000010
```

The design assumes a **common-anode 7-segment display**, where `0` turns a segment ON.

---

## 🔌 Inputs

| Input   | Description     |
| ------- | --------------- |
| `clk`   | System clock    |
| `reset` | Resets the dice |
| `roll`  | Rolls the dice  |

---

## 💡 Output

| Output     | Description                    |
| ---------- | ------------------------------ |
| `seg[6:0]` | Controls the 7-segment display |

---

## 🎮 How to Use

1. Apply the clock.
2. Release reset.
3. Press the `roll` button.
4. The circuit captures the current counter value.
5. A number from `1` to `6` appears on the 7-segment display.
6. Press `roll` again to generate another result.

---

## 🧪 Estimated Simulation Output

A typical simulation may produce output similar to:

```text
Time=0 ns   | Reset=1 | Roll=0 | Random=1 | Dice=1 | SEG=1111001
Time=20 ns  | Reset=0 | Roll=0 | Random=3 | Dice=1 | SEG=1111001
Time=50 ns  | Reset=0 | Roll=1 | Random=6 | Dice=6 | SEG=0000010
Time=60 ns  | Reset=0 | Roll=0 | Random=1 | Dice=6 | SEG=0000010
Time=110 ns | Reset=0 | Roll=1 | Random=5 | Dice=5 | SEG=0010010
Time=120 ns | Reset=0 | Roll=0 | Random=6 | Dice=5 | SEG=0010010
Time=170 ns | Reset=0 | Roll=1 | Random=4 | Dice=4 | SEG=0011001
```

The exact values depend on the clock and the moment when the `roll` signal is asserted.

---

## 📊 Expected Result

The 7-segment display should show only valid dice values:

```text
1
2
3
4
5
6
```

For example:

```text
        ┌───────┐
        │       │
        │   5   │
        │       │
        └───────┘
```

After pressing the roll button again:

```text
        ┌───────┐
        │       │
        │   2   │
        │       │
        └───────┘
```

Another roll could produce:

```text
1
```

or

```text
3
```

or

```text
4
```

or any other value from `1` to `6`.

---

## 🎯 Learning Objectives

This project helps demonstrate:

* Verilog HDL basics
* Sequential logic
* Counters
* Registers
* Push-button control
* 7-segment display decoding
* Testbench creation
* RTL simulation

---

## 🚀 Future Improvements

The project can be improved by adding:

* Two-player dice
* Two 7-segment displays
* Dice rolling animation
* Push-button debouncing
* Pseudo-random number generation
* LED dice representation
* Score counter
* Automatic rolling animation

---

## 🏁 Conclusion

The Digital Dice project is a simple FPGA/Verilog project that generates values from 1 to 6 and displays the result on a 7-segment display.

It is suitable for beginners learning **Verilog, RTL design, FPGA programming, and digital logic**.
