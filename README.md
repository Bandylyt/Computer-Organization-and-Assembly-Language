
# 🖥️ COAL 8086 Assembly Language Repository

Welcome to the complete and organized repository for the **Computer Organization and Assembly Language (COAL)** course using **8086 architecture**. This repo provides structured lab tasks, practice material, debugging tools, MASM/TASM setups, and theory references essential for mastering low-level programming and computer systems architecture.

---

## 📂 Repository Structure

### 🔧 8086 Tools & Assemblers

Includes all essential tools required to assemble, debug, and execute 8086 assembly language programs:

* `MASM.EXE`, `TASM.EXE`, `ML.EXE`, `LINK.EXE` – Microsoft & Turbo assemblers/linkers
* `DEBUG.EXE`, `EDIT.COM` – DOS-based debugging and editing utilities
* `BIN2HEX.EXE`, `EXE2BIN.EXE`, `TD.EXE` – format conversion and debugging tools

> ✅ Fully compatible for running in DOSBox or legacy virtual environments.

---

### 🧪 Lab Work

All lab folders (Lab 01–Lab 07) are named and organized with:

* `.ASM` files (assembly source)
* `.EXE` & `.OBJ` files (compiled outputs)
* `.PDF` lab handouts and `.PNG` screenshots of handwritten solutions

Each lab builds on core 8086 concepts including:

* Data movement & arithmetic instructions
* Loops, conditional branching
* String operations
* Procedures and stack
* I/O operations (IN/OUT)
* Hardware interaction via INTs

---

### 📁 Lab Final & Practice

* **Lab-Final** folder includes all cumulative final exam code samples like `Allout.asm`, `Din.asm`, `Binin.asm`, `Hexin.asm`
* **Mids Practice** includes foundational programs like:

  * `addsum.asm` – summation routines
  * `chrtobin.asm`, `chrtohex.asm` – character conversion utilities
  * `string.asm`, `test.asm` – string handling & testing programs

---

### 📚 COAL Materials

Contains detailed references and solution manuals:

* `Computer Systems Architecture.pdf`
* `Ytha Yu & Charles Marut - Assembly Language Programming`
* `M. Morris Mano - Computer System Architecture (Solution Manual)`
* Solutions to quizzes and lab book exercises

---

### 📝 Debugging & Modern MASM

* `DEBUGGER Document/` – PDF guides on using DOS debug tools
* `Masm solution for 64-bit/` – modern MASM support for 64-bit Windows setups (rare in academia)

---

## 📘 Highlights

| Topic                | Covered in             |
| -------------------- | ---------------------- |
| Basic Instructions   | Lab 1, Lab 2           |
| Loops & Conditional  | Lab 2, Lab 3           |
| Procedures           | Lab 4                  |
| String Operations    | Lab 5                  |
| I/O with IN/OUT      | Lab 6                  |
| Advanced Programming | Lab 7, Lab Final       |
| Midterm Prep         | Mids Practice          |
| Final Revision       | Lab-Final, Generic.asm |
| Architecture Theory  | COAL Materials (PDFs)  |

---

## 📂 How to Run

1. Install **DOSBox** or use a 16-bit DOS VM.
2. Place all `.ASM` and tools in a common working directory.
3. Assemble:

   ```bash
   MASM TASK1.ASM;
   LINK TASK1.OBJ;
   ```
4. Run in DOS:

   ```bash
   TASK1.EXE
   ```

---

## 📎 License

This repository is licensed under the [MIT License](./LICENSE).

---

## 🙌 Contributions

This lab was compiled with the help of official lab instructions, faculty support, and self-practice routines for 8086 programming.
