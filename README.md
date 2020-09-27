# Hazard-Detection-Unit
A Hazard Detection Unit for RISC V Base Integer ISA

A data hazard occurs in a pipeline when an instruction requires data to be read from a register but the data in the register has not yet been made available. Such hazards arise due to the dependencies among subsequent instructions. For example, consider an add instruction which adds the contents of the registers R1 and R2 and stores the data in R3. This operation will be completed in 5 clock cycles, with the result of R1+R2 available at the end of the 3rd clock cycle and the result available in R3 at the end of the 5th clock cycle. Let us assume this instruction is followed by another add instruction which adds the data of R3 to R4. In this situation, the data must be available in R3 in the 3rd clock cycle. However, since the previous instruction writes the data in R3 only by the 5th clock cycle, this results in a data hazard. Several types of data hazards, including the one seen above, can be eliminated by forwarding the results of the previous instructions to the subsequent instructions. This is known as forwarding. However, in certain cases, forwarding will not be sufficient and the pipeline must be stalled by one clock cycle in order to ensure the correct data is available for the next instruction. This is achieved by the hazard detection unit. This unit is responsible of identifying the set of instructions which might incur a data hazard and it subsequently stalls the pipeline.

The Hazard Detection Unit Module:

![HDU](/Images/HDU_module.png)

The hazard detection unit receives input from the ID/EX stage. It uses ID/EX.MemRead to determine if the previous instruction was a load instruction and obtains the address of Rd from ID/EX.RegisterRd signal. It compares this Rd to the addresses of Rs1 and Rs2 obtained from the present instruction. According to the output of the above, the necessary output lines are asserted.

Opcodes for RISC-V Base Integer ISA:

![Opcodes](/Images/Opcodes.png)

Schematic of the implemented circuit:

![Schematic](/Images/Schematic.png)

Combination of Instructions Possible in RISC-V:

![Combination of Instructions](/Images/Combination_of_Instructions.png)

Simulation Results of the implemented circuit:

![Simulation](/Images/Simulation.png)
