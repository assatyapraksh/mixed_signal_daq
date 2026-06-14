`include "adc_transaction.sv"
`include "adc_generator.sv"
`include "adc_scoreboard.sv"
`include "adc_env.sv"

module tb_env;

    adc_env env;

    initial begin

        env = new();

        env.run();

        #10;
        $finish;

    end

endmodule

