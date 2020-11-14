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
Contains documentation required for the report.

# 3. Quartus Files
To test the processor locally, follow the following procedure.

**1.** Clone the repository.
```sh
$ git clone https://github.com/jula97/CCSS-Processor-Design.git
```

**2.** Open the **`CCSS_PROCESSOR.qpf`** project file to open the project in quartus.

**3.** Compile the project
```sh
Processing ⇒ Start Compilation
```

**4.** Upload the **`CCSS_PROCESSOR.sof`** found in the **`output_files`** folder.
```sh
Tools ⇒ Programmer
```

**5.** Upload the data for **IRAM** and **DRAM** using **`In-System Memory Content Editor`**.
```sh
Tools ⇒ In-System Memory Content Editor
```
*Note : Needed* `.mif` *files can be found at* `DRAM` *and* `IRAM` *folders*.  

**6.** Clock enable switch is **`SW[16]`**.

**7.** After the processing is completed, Read **`IRAM`** and **`DRAM`** for results.
&nbsp;  
&nbsp;
## Followings are the **`Verilog HDL`** files used in the project.

| File | Description |
| --- | --- |
| `multicore1.v` | Instantiates 4 cores and Memory modules |
| `scaledclock.v` | Module to generate a slower clock form 50M |
| `phase6.v` | Integrates all the modules needed for a core |
| `memory_control.v` | Contains the registers and DRAM needed for multicore memory |
| `mem_state.v` | Contains the state machine needed to control the DRAM |
| `memandFSM.v` | Instantiates mem_control and mem_state for testing |
| `data_memory.v` | DRAM initiated from IP block |
| `instruction_memory.v` | IRAM initiated from IP block |
| `outputmux.v` | Multiplexer to select the core for LEDs and 7 segment displays |
| `bin27.v` | Module to convert binary data to format displayed on 7 segment display |
| `control.v` | Control unit of the core |
| `alu.v` | Arithmatic and logic unit of the core |
| `BUS.v` | Data bus of the core |
| `INC_Decoder.v` | Decoder to generate increment control signals for registers |
| `RESET_Decoder.v` | Decoder to generate reset control signals for registers |
| `WTR_Decoder.v` | Decoder to generate write enable control signals for registers |
| `OPR_demux.v` | Demultiplexer to send selection controls for combinational units |
| `WTA_mux.v` | Multiplexer to select the register to be written to the bus |
| `reg_type1_16bit.v` | 16 bit regiter with write enable control signal |
| `reg_type2_16bit.v` | 16 bit regiter with write enable and increment control signals |
| `reg_type3_16bit.v` | 16 bit regiter with write enable, increment and reset control signals |
| `reg_ac.v` | 16 bit regiter for accumilator |
| `reg_SUM.v` | 16 bit regiter with write enable and reset control signals |
| `reg_z.v` | 1 bit regiter with for ALU flag |
| `read_buffer_16bit.v` | 16 bit buffer for register read enable control signal |

# 4. Compiler
Converts the text file to a `.mif` file which can be written to the `DRAM`.

# 5. DRAMs
Contains `.mif` files genereated from the compiler. DRAMs required for different test cases are available.
```sh
EX: DRAM3-4.mif ⇒ .mif for 3-row matrix to be computed using 4 cores.
```
# 6. IRAMs
Contains `.mif` file with the assembly code written to IRAM. (Manually produced by using opcodes for every instruction).
# 7. Results

![Performance](https://github.com/jula97/CCSS-Processor-Design/blob/Devel-arrange/7.Results/Results.png).

For a more interactive respresentation, use this [link](https://infogram.com/line-chart-1hmr6g7d7djoz6n?live).

# ISA.pdf
![ISA](https://github.com/jula97/CCSS-Processor-Design/blob/Devel-arrange/2.Editable%20Documentation/ISA-1.jpg).

# Datapaths.pdf
![Datapaths](https://github.com/jula97/CCSS-Processor-Design/blob/Devel-arrange/2.Editable%20Documentation/Datapaths-1.jpg).

# Microsequencing.pdf
![Microsequencing](https://github.com/jula97/CCSS-Processor-Design/blob/Devel-arrange/2.Editable%20Documentation/Microsequencing-1.jpg).

# Statemachine.pdf
![Statemachine](https://github.com/jula97/CCSS-Processor-Design/blob/Devel-arrange/2.Editable%20Documentation/Statemachine.jpg).

