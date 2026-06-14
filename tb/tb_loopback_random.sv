module tb_loopback_random;

    logic clk;
    logic rst_n;

    real analog_in;
    real analog_out;

    logic [9:0] digital_code;

    integer pass_count;
    integer fail_count;

    integer i;
    integer rand_code;

    real error;

    adc_dac_top dut (
        .clk(clk),
        .rst_n(rst_n),
        .analog_in(analog_in),
        .digital_code(digital_code),
        .analog_out(analog_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task check_loopback;
    begin

        error = analog_in - analog_out;

        if (error < 0)
            error = -error;

        if (error < 0.002)
            pass_count = pass_count + 1;
        else
            fail_count = fail_count + 1;

    end
    endtask

    initial begin

        pass_count = 0;
        fail_count = 0;

        rst_n = 0;
        analog_in = 0.0;

        #20;
        rst_n = 1;

        for (i = 0; i < 100; i = i + 1) begin

            rand_code = $random % 1024;

            if (rand_code < 0)
                rand_code = -rand_code;

            analog_in = rand_code / 1023.0;

            #25;

            check_loopback();

        end

        $display("");
        $display("==============================");
        $display("RANDOM TEST SUMMARY");
        $display("TOTAL TESTS = 100");
        $display("PASS COUNT  = %0d", pass_count);
        $display("FAIL COUNT  = %0d", fail_count);
        $display("==============================");

        $finish;

    end

endmodule
