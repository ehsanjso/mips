module Forward_Unit
  (
    input [4:0] Src1_EXE,
    input [4:0] Src2_EXE,
    input [4:0] Dst_MEM ,
    input [4:0] Dst_WB ,
    input WB_EN_WB_out,
    input WB_EN_MEM_out,

    output reg [1:0]sel_alu_in1,
    output reg [1:0]sel_alu_in2
    );

  always@(*)begin 
      sel_alu_in1 = 2'b0;
      sel_alu_in2 = 2'b0;
      if ((Src1_EXE == Dst_WB  )&& Dst_WB != 5'b0 && WB_EN_WB_out)     
           sel_alu_in1 = 2'b01;
      if ((Src2_EXE == Dst_WB )&& Dst_WB != 5'b0 && WB_EN_WB_out) 
           sel_alu_in2 = 2'b01;  

      /// update data
      if ((Src1_EXE == Dst_MEM  )&& Dst_MEM != 5'b0 && WB_EN_MEM_out  )
        sel_alu_in1 = 2'b10;
      if ( (Src2_EXE == Dst_MEM )&& Dst_MEM != 5'b0 && WB_EN_MEM_out  )  
        sel_alu_in2 = 2'b10; 
  end
  
endmodule