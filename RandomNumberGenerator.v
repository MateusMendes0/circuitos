module RandomNumberGenerator(
  input wire clk,
  input wire reset,
  output reg [3:0] random_number
);

  reg [3:0] seed;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      seed <= 4'b0000; // Valor inicial do seed
      random_number <= 4'b0000; // Valor inicial do número aleatório
    end else begin
      seed <= seed + 1; // Atualiza o seed a cada ciclo de clock
      if (seed > 10) begin
        // Se o seed ultrapassar 10, reinicializa para 0
        seed <= 4'b0000;
      end
      // Gera o número aleatório de 4 bits
      random_number <= seed;
    end
  end

endmodule