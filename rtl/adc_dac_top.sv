module adc_dac_top (

    input  logic clk,
    input  logic rst_n,

    input  real  analog_in,

    output logic [9:0] digital_code,
    output real analog_out

);

    adc_model u_adc (

        .clk(clk),
        .rst_n(rst_n),

        .analog_in(analog_in),

        .digital_out(digital_code)

    );

    dac_model u_dac (

        .clk(clk),
        .rst_n(rst_n),

        .digital_in(digital_code),

        .analog_out(analog_out)

    );

endmodule
