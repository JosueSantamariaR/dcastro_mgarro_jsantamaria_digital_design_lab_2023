module MovimientoMatriz(
  input logic clock, // Reloj de la FPGA
  input logic reset, key0, key1, key2,key3, // Señal de reinicio
  input logic [9:0] x, // Posición actual en X
  input logic [9:0] y, // Posición actual en Y
  output logic [9:0] new_x, // Nueva posición en X
  output logic [9:0] new_y // Nueva posición en Y
);

  // Parámetros de la matriz
  parameter MATRIX_WIDTH = 8; // Ancho de la matriz
  parameter MATRIX_HEIGHT = 8; // Alto de la matriz

  // Botones de control de movimiento
  

  // Registros para almacenar la posición actual
  logic [9:0] current_x;
  logic [9:0] current_y;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      current_x <= 0; // Inicializa la posición en X a 0
      current_y <= 0; // Inicializa la posición en Y a 0
    end else begin
      // Actualiza la posición en función de los botones de control
      if (key0 && current_y < MATRIX_HEIGHT - 1) // Mover hacia abajo
        current_y <= current_y + 1;
      else if (key1 && current_y > 0) // Mover hacia arriba
        current_y <= current_y - 1;
      else if (key2 && current_x < MATRIX_WIDTH - 1) // Mover hacia la derecha
        current_x <= current_x + 1;
      else if (key3 && current_x > 0) // Mover hacia la izquierda
        current_x <= current_x - 1;
    end
  end

  // Salida de las nuevas coordenadas
  assign new_x = current_x;
  assign new_y = current_y;

endmodule
