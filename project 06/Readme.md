# Lab 06
## 실습 내용
### **7 – Segment Display Decoder (개별)**
#### **Submodule 1** : 0~9의 값을 갖는 4bit 입력 신호를 받아 7bit FND  segment  값 출력
#### **Submodule 2** : 0~59의 값을 갖는 6bit 입력 신호를 받아 십의 자리 수와 일의 자리 수를 각각 4bit으로 출력
#### **Top Module** : 저번 시간에 만든 second counter  및 Submodule 1/2를 이용하여 실습 장비의 LED에 맞는 Display Module 설계
### FPGA 실습 (팀) : 6개의 LED 중 가장 오른쪽 2개의 LED에 1초간격으로 0~59까지 증가하는 Counter 값 Display
: NCO(Numerical Controlled Oscillator) 입력 바꿔서 4초 간격으로 증가하는 코드 테스트

## 퀴즈 
### 아래 코드 일부를 수정하여 다음을 구하시오 
```
verilog 
wire  [41:0] six_digit_seg; 
assign       six_digit_seg = { 4{7'b0000000}, seg_left, seg_right } 
``` 
> Q1 - 고정 LED (왼쪽 4개) AAAA 출력 : `AA_AA_00`, `AA_AA_01`, `AA_AA_02`, … 순으로 LED 변경
```
verilog
wire	[41:0]	six_digit_seg;
assign			  six_digit_seg = { 4{7'b1110111}, seg_left, seg_right };
```
> Q2 - 고정 LED 없이 2개의 LED 단위로 1초 Counter 값 표시 : `00_00_00`, `01_01_01`, `02_02_02`, … 순으로 LED 변경
```
verilog
wire	[41:0]	six_digit_seg;
assign			  six_digit_seg = { 3{seg_left, seg_right} };
``` 



## 결과 
### **Top Module 의 DUT/TestBench Code 및 Waveform 검증**
```
verlilog
//	==================================================
//	Copyright (c) 2019 Sookmyung Women's University.
//	--------------------------------------------------
//	FILE 			: practice03.v
//	DEPARTMENT		: EE
//	AUTHOR			: WOONG CHOI
//	EMAIL			: woongchoi@sookmyung.ac.kr
//	--------------------------------------------------
//	RELEASE HISTORY
//	--------------------------------------------------
//	VERSION			DATE
//	0.0				2019-08-12
//	--------------------------------------------------
//	PURPOSE			: Seven-Segment
//	==================================================

//	--------------------------------------------------

//	0~59 Counter
module cnt60(	o_cnt60,
		clk,
		rst_n);

output	[5:0]	o_cnt60		;
input			clk			;
input			rst_n		;

reg		[5:0]	o_cnt60		;
always @(posedge clk or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		o_cnt60 <= 6'd0;
	end else begin
		if(o_cnt60 >= 6'd59) begin
			o_cnt60 <= 6'd0;
		end else begin
			o_cnt60 <= o_cnt60 + 1'b1;
		end
	end
end

endmodule

//	Numerical Controlled Oscillator
//	Hz of o_gen_clk = Clock Hz / num
module	nco(	o_gen_clk,
				i_nco_num,
				clk,
				rst_n);

output			o_gen_clk	;	// 1Hz CLK

input	[31:0]	i_nco_num	;
input			clk			;	// 50Mhz CLK
input			rst_n		;

reg		[31:0]	cnt			;
reg				o_gen_clk	;
always @(posedge clk or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		cnt		<= 32'd0;
		o_gen_clk	<= 1'd0	;
	end else begin
		if(cnt >= i_nco_num/2-1) begin
			cnt 	<= 32'd0;
			o_gen_clk	<= ~o_gen_clk;
		end else begin
			cnt <= cnt + 1'b1;
		end
	end
end

endmodule

module	nco_cnt(
				o_nco_cnt,
				i_nco_num,
				clk,
				rst_n);

output	[5:0]	o_nco_cnt	;

input	[31:0]	i_nco_num	;
input			clk			;
input			rst_n		;

wire			gen_clk		;
nco		u_nco(	.o_gen_clk	( gen_clk	),
				.i_nco_num	( i_nco_num	),
				.clk		( clk		),
				.rst_n		( rst_n		));

cnt60	u_cnt60(.o_cnt60	( o_nco_cnt	),
				.clk		( gen_clk	),
				.rst_n		( rst_n		));

endmodule

//	Flexible Numerical Display Decoder
module	fnd_dec(o_seg,
				i_num);

output	[6:0]	o_seg		;	// {o_seg_a, o_seg_b, ... , o_seg_g}

input	[3:0]	i_num		;

reg		[6:0]	o_seg		;
always @(i_num) begin
	case (i_num)
		default : o_seg = 7'b000_0000;
		4'b0000 : o_seg = 7'b111_1110;
		4'b0001 : o_seg = 7'b011_0000;
		4'b0010 : o_seg = 7'b110_1101;
		4'b0011 : o_seg = 7'b111_1001;
		4'b0100 : o_seg = 7'b011_0011;
		4'b0101 : o_seg = 7'b101_1011;
		4'b0110 : o_seg = 7'b101_1111;
		4'b0111 : o_seg = 7'b111_0000;
		4'b1000 : o_seg = 7'b111_1111;
		4'b1001 : o_seg = 7'b111_0011;
	endcase
end
 
endmodule

module	double_fig_sep(
				o_left,
				o_right,
				i_double_fig);

output	[3:0]	o_left		;
output	[3:0]	o_right		;

input	[5:0]	i_double_fig;

assign	o_left = i_double_fig / 10;
assign	o_right  = i_double_fig % 10;

endmodule

module	led_disp(
				o_seg,
				o_seg_dp,
				o_seg_enb,
				i_six_digit_seg,
				i_six_dp,
				clk,
				rst_n);

output	[5:0]	o_seg_enb		;
output			o_seg_dp		;
output	[6:0]	o_seg			;

input	[41:0]	i_six_digit_seg	;
input	[5:0]	i_six_dp		;
input			clk				;
input			rst_n			;

wire			gen_clk		;
nco		u_nco(	.o_gen_clk	( gen_clk	),
				.i_nco_num	( 32'd5000	),
				.clk		( clk		),
				.rst_n		( rst_n		));

reg		[3:0]	cnt_common_node	;
always @(posedge gen_clk or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		cnt_common_node		<= 4'd0;
	end else begin
		if(cnt_common_node >= 4'd5) begin
			cnt_common_node 	<= 4'd0;
		end else begin
			cnt_common_node <= cnt_common_node + 1'b1;
		end
	end
end

reg		[5:0]	o_seg_enb		;
always @(cnt_common_node) begin
	case (cnt_common_node)
		4'd0 : o_seg_enb = 6'b111110;
		4'd1 : o_seg_enb = 6'b111101;
		4'd2 : o_seg_enb = 6'b111011;
		4'd3 : o_seg_enb = 6'b110111;
		4'd4 : o_seg_enb = 6'b101111;
		4'd5 : o_seg_enb = 6'b011111;
	endcase
end

reg				o_seg_dp		;
always @(cnt_common_node) begin
	case (cnt_common_node)
		4'd0 : o_seg_dp = i_six_dp[0];
		4'd1 : o_seg_dp = i_six_dp[1];
		4'd2 : o_seg_dp = i_six_dp[2];
		4'd3 : o_seg_dp = i_six_dp[3];
		4'd4 : o_seg_dp = i_six_dp[4];
		4'd5 : o_seg_dp = i_six_dp[5];
	endcase
end

reg		[6:0]	o_seg			;
always @(cnt_common_node) begin
	case (cnt_common_node)
		4'd0 : o_seg = i_six_digit_seg[6:0];
		4'd1 : o_seg = i_six_digit_seg[13:7];
		4'd2 : o_seg = i_six_digit_seg[20:14];
		4'd3 : o_seg = i_six_digit_seg[27:21];
		4'd4 : o_seg = i_six_digit_seg[34:28];
		4'd5 : o_seg = i_six_digit_seg[41:35];
	endcase
end

endmodule

module	top_nco_cnt_disp(
				o_seg_enb,
				o_seg_dp,
				o_seg,
				clk,
				rst_n);

output	[5:0]	o_seg_enb	;
output			o_seg_dp	;
output	[6:0]	o_seg		;

input			clk			;
input			rst_n		;

wire	[5:0]	nco_cnt		;
nco_cnt			u_nco_cnt		(
				.o_nco_cnt		( nco_cnt		),
				.i_nco_num		( 32'd50000000	),
				.clk			( clk			),
				.rst_n			( rst_n			));

wire	[3:0]	unseg_left	;
wire	[3:0]	unseg_right	;
double_fig_sep	u_double_fig_sep(
				.o_left			( unseg_left	),
				.o_right		( unseg_right	),
				.i_double_fig	( nco_cnt		));

wire	[6:0]	seg_left	;
fnd_dec			u0_fnd_dec		(
				.o_seg			( seg_left		),
				.i_num			( unseg_left	));

wire	[6:0]	seg_right	;
fnd_dec			u1_fnd_dec		(
				.o_seg			( seg_right		),
				.i_num			( unseg_right	));

wire	[41:0]	six_digit_seg;
assign			six_digit_seg = { 4{7'b0000000}, seg_left, seg_right };
led_disp		u_led_disp(
				.o_seg			( o_seg				),
				.o_seg_dp		( o_seg_dp			),
				.o_seg_enb		( o_seg_enb			),
				.i_six_digit_seg( six_digit_seg		),
				.i_six_dp		( 6'd0				),
				.clk			( clk				),
				.rst_n			( rst_n				));


endmodule
```
### **FPGA 동작 사진 (3개- 일반, Q1, Q2)**

![](https://github.com/jungeun0/logic_design/blob/master/project%2006/12312321213213.PNG)

