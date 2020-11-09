# CCSS-Processor-Design
Custom multicore processor for matrix multiplication

# 1. Algorithms
Two single core algorithms are evaluated.
- **Normal**-(not used)Processing matirces in their original format.
- **Transposed**-A matrix is used as original. B matrix is transposed before processing.

Two multicore algorithms are evaluated.
- **Element**-(not used)An element of the final matrix is calculated by a core.
- **Block**-A block of one or many rows are calculated by a core.

# 2. Editable Documentation

# 3. Quartus Files
To test the processor locally, follow the following procedure.

1. Clone the repository.
```sh
$ git clone https://github.com/jula97/CCSS-Processor-Design.git
```

2. Open the **`CCSS_PROCESSOR.qpf`** project file to open the project in quartus.

3. Compile the project
```sh
Processing ⇒ Start Compilation
```

4. Upload the **`CCSS_PROCESSOR.sof`** found in the **`output_files`** folder.
```sh
Tools ⇒ Programmer
```

5. Upload the data for **IRAM** and **DRAM** using **`In-System Memory Content Editor`**.
```sh
Tools ⇒ In-System Memory Content Editor
```
*Note : Needed* `.mif` *files can be found at* `DRAM` *and* `IRAM` *folders*.  

6. Clock enable switch is **`SW[16]`**.

7. After the processing is completed, Read **`IRAM`** and **`DRAM`** for results.

# 4. Compiler

# 5. DRAMs

# 6. IRAMs

# 7. Results

![Performance](https://github.com/jula97/CCSS-Processor-Design/blob/Devel-arrange/7.Results/Results.png).
