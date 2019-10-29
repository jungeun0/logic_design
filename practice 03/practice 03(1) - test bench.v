module tb_prj03;
  
  
  
  
  
  reg sel;
  reg in0;
  reg in1;
  
  wire o1;
  
  wire o2;
  
  wire o3;
  
   mux2to1_cond dut_1( .out (o1),
module tb_prj03;
  
  
  
  
  
  reg sel;
  reg in0;
  reg in1;
  
  wire o1;
  
  wire o2;
  
  wire o3;
  
   mux2to1_cond dut_1( .out (o1),
                     .sel (sel),
                     .in0 (in0),
                     .in1 (in1));
                      
  mux2to1_if dut_2( .out (o2),
                     .sel (sel),
                     .in0 (in0),
                     .in1 (in1));
  
  mux2to1_case dut_3( .out (o3),
                     .sel (sel),
                     .in0 (in0),
                     .in1 (in1));


  initial begin
   $display("using conditional : o1");
   $display("using if : o2 ");
   $display("using case : o3 ");
   
    
   $display(" ========================================== ");
   $display(" sel in0 in1 o1 o2 o3 ");
   $display(" ========================================== ");
  
  
   #(50) {sel,in0,in1} = 3'b_000; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_001; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_010; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_011; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_100; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_101; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_110; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_111; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
  
   #(50) $finish;


  end

endmodule

                     .sel (sel),
                     .in0 (in0),
                     .in1 (in1));
                      
  mux2to1_if dut_2( .out (o2),
                     .sel (sel),
                     .in0 (in0),
                     .in1 (in1));
  
  mux2to1_case dut_3( .out (o3),
                     .sel (sel),
                     .in0 (in0),
                     .in1 (in1));


  initial begin
   $display("using conditional : o1");
   $display("using if : o2 ");
   $display("using case : o3 ");
   
    
   $display(" ========================================== ");
   $display(" sel in0 in1 o1 o2 o3 ");
   $display(" ========================================== ");
  
  
   #(50) {sel,in0,in1} = 3'b_000; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_001; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_010; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_011; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_100; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_101; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_110; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
   #(50) {sel,in0,in1} = 3'b_111; #(50) $display (" %b\t%b\t%b\t%b\t%b\t%b\t",sel,in0,in1,o1,o2,o3);
  
   #(50) $finish;


  end

endmodule
