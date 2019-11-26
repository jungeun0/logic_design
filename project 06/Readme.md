# Lab 10
## 실습 내용
### **적외선 컨트롤러 리모콘을 통한  display 조종**
#### **Module nco** :  clock 을 만드는 모듈. 
#### **Fnd_dec** : 7- segment의 모양을 만드는 모듈. 
0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F 총 16개의 문자를 표현할 수 있음.
#### **Led_disp** : DISPLAY를 담당하는 모듈. 동시에 6개의 7-segment가 보일 수 있도록 설계.  
#### **Ir_rx**: 리모콘의 신호에 따라   state를 변경하는 모듈. 
 리모콘의 시그널을  ir_rx로 받은 뒤, seq_rx를 2비트로 설정한 후 직전의  ir_rx와 현재의 ir_rx를 동시에 표현함.
 seq_rx값에 따라 cnt_l과 cnt_h의 값을 설정함. 이후 32비

#### **Top Module** : 시계를 만들 때 이용했던   top module 를 이용하여 7-segment를 보여주고, 리모콘의 시그널에 따라 segment가 바뀌도록 Display Module 설계
### FPGA 실습  : 리모콘의 버튼을 눌러 각각 다른  display가 나오도록 설계
**Top Module 의 DUT/TestBench Code 및 Waveform 검증**
### **FPGA 동작 사진 (3개- 일반, Q1, Q2)**

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/12312321213213.PNG)

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/result.jpg)

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/q2.jpg)

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/q3.jpgcommit/00f628e9730e4566201f842117c394973bc47b59)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTg2ODY0ODY2NSwtMjAyMjIwNjM3MSw4Mz
MxMjE2NjcsLTg3NTM2NjA4XX0=
-->