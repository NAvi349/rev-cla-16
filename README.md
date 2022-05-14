# Table of contents

- [Table of contents](#table-of-contents)
  - [Theory](#theory)
  - [Reversible Logic Gates](#reversible-logic-gates)
  - [1 - bit Adder](#1---bit-adder)
  - [Tools Used](#tools-used)
  - [RTL View of a single 4 - bit Reversible CLA](#rtl-view-of-a-single-4---bit-reversible-cla)
  - [RTL View of the Entire 16 - bit Reversible Logic CLA](#rtl-view-of-the-entire-16---bit-reversible-logic-cla)
  - [Logical Verification Using ModelSim - Altera](#logical-verification-using-modelsim---altera)
  - [Compilation Result](#compilation-result)

## Theory

- Energy is dissipated whenever a bit of information is destroyed.
- Today's Digital Systems are based on irreversible logic wherein the input cannot be determined from the output.
- As a consequence there is a loss of information.
- This loss of information corresponds to dissipation of energy.
- Reversible Computers have a one-to-one and onto mapping between the input and output logic.
- This means that each of the input is mapped to a unique output.
- Therefore, the operations can be un-computed.
- In a reversible system, overwriting operations are avoided.

In this Mini-Project I have designed and simulated a 16 - bit Logically Reversible Carry Look Ahead Adder using Intel Quartus Prime.

## Reversible Logic Gates

![image](https://user-images.githubusercontent.com/66086031/168436970-009374df-cd2f-46c4-b07f-db44756897ae.png)

![image](https://user-images.githubusercontent.com/66086031/168436996-b6fc2e97-9b60-4192-8225-1901abfa8d33.png)

## 1 - bit Adder

![image](https://user-images.githubusercontent.com/66086031/168439660-d8d7b353-0d6b-4f12-b575-7d676d74ac58.png)


## Tools Used

- Intel Quartus Prime Lite

## RTL View of a single 4 - bit Reversible CLA

![image](https://user-images.githubusercontent.com/66086031/166683137-22aa4522-a1f2-42d3-aa83-443b9efb6005.png)

## RTL View of the Entire 16 - bit Reversible Logic CLA

![image](https://user-images.githubusercontent.com/66086031/166683173-5906603d-f65c-402c-ada9-2f43af4d21f9.png)

## Logical Verification Using ModelSim - Altera

- If we connect the gates in reverse manner, we can obtain back the inputs.

![image](https://user-images.githubusercontent.com/66086031/166683231-7e6f150a-66d8-497d-a339-232035f122d9.png)

## Compilation Result

![image](https://user-images.githubusercontent.com/66086031/166683350-2fad1f02-0d6f-47a1-8348-f5139af99842.png)
