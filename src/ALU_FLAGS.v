module ALU_FLAGS (
  input wire a7,b7,sumrest7,
  input wire [7:0] result,
  input wire carry,
  input wire [2:0] ALU,
  output wire [3:0] ALU_Flags
);
    
    wire Negative, Zero, Carry_flag, oVerflow;    // indicadores de la ALU
    wire z0,z1;    // variables para comparar bits de salidas y determinar si la salida es cero
    
    assign oVerflow = (~((ALU[0])^a7^b7)) & (a7^sumrest7) & (~ALU[1]) & (~ALU[2]);
    
    assign Carry_flag = (~ALU[1]) & (~ALU[2]) & ( carry );
    
    assign z0 = (~result[0])&(~result[1])&(~result[2])&(~result[3]);
    assign z1 = (~result[4])&(~result[5])&(~result[6])&(~result[7]);
    assign Zero = z0 & z1;
    
    assign Negative = result[7];
    
    assign ALU_Flags[0] = oVerflow;
    assign ALU_Flags[1] = Carry_flag;
    assign ALU_Flags[2] = Zero;
    assign ALU_Flags[3] = Negative;
endmodule
