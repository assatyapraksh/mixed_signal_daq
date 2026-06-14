module adc_model (
    input logic clk,
    input logic rst_n,
    input real analog_in,

    output logic [9:0] digital_out
);

    localparam real VREF = 1.0;

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) begin
            digital_out <= 10'd0;
        end
        else begin

            if (analog_in <= 0.0)
                digital_out <= 10'd0;

            else if (analog_in >= VREF)
                digital_out <= 10'd1023;

            else
                digital_out <= int'(analog_in * 1023.0 / VREF);

        end
    end

endmodule
