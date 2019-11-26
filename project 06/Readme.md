# Lab 10
## 실습 내용
### **적외선 컨트롤러 리모콘을 통한 조종**
#### **Module nco** :   
#### **Fnd_dec** : 
#### **Double_fig_sep** : 
#### **Led_disp** : 
#### **Ir_rx**:
#### **Top Module** : 저번 시간에 만든 second counter  및 Submodule 1/2를 이용하여 실습 장비의 LED에 맞는 Display Module 설계
### FPGA 실습  : 리모콘의 버튼을 눌러 각각 다른  display가 나오도록 설
## 퀴즈 
### 아래 코드 일부를 수정하여 다음을 구하시오 
```verilog 
wire  [41:0] six_digit_seg; 
assign       six_digit_seg = { 4{7'b0000000}, seg_left, seg_right } 
``` 
> Q1 - 고정 LED (왼쪽 4개) AAAA 출력 : `AA_AA_00`, `AA_AA_01`, `AA_AA_02`, … 순으로 LED 변경
```verilog
wire  [41:0] six_digit_seg; 
assign       six_digit_seg = { 4{7'b1110111}, seg_left, seg_right } 
```
> Q2 - 고정 LED 없이 2개의 LED 단위로 1초 Counter 값 표시 : `00_00_00`, `01_01_01`, `02_02_02`, … 순으로 LED 변경
```verilog
wire  [41:0] six_digit_seg; 
assign       six_digit_seg = { 3{seg_left, seg_right} } 
``` 

## 결과 
### **Top Module 의 DUT/TestBench Code 및 Waveform 검증**
### **FPGA 동작 사진 (3개- 일반, Q1, Q2)**

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/12312321213213.PNG)

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/result.jpg)

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/q2.jpg)

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/q3.jpgcommit/00f628e9730e4566201f842117c394973bc47b59)
<!--stackedit_data:
eyJoaXN0b3J5IjpbODMzMTIxNjY3LC04NzUzNjYwOF19
-->