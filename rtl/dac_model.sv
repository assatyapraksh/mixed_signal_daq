module dac_model (

    input  logic        clk,
    input  logic        rst_n,

    input  logic [9:0]  digital_in,

    output real         analog_out

);

    real analog_reg;

    assign analog_out = analog_reg;

    localparam real VREF = 1.0;

    always  @(posedge clk or negedge rst_n) begin

        if (!rst_n)
            analog_reg <= 0.0;

        else
            analog_reg <= (digital_in * VREF) / 1023.0;

    end

endmodule
