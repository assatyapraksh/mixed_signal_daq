module tb_dac;

    logic clk;
    logic rst_n;

    logic [9:0] digital_in;

    real analog_out;

    real expected_voltage;

    integer pass_count;
    integer fail_count;

    integer low_cov;
    integer mid_cov;
    integer high_cov;

    dac_model dut (
        .clk(clk),
        .rst_n(rst_n),
        .digital_in(digital_in),
        .analog_out(analog_out)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform
    initial begin
        $dumpfile("waves/dac_wave.vcd");
        $dumpvars(0, tb_dac);
    end

    // Scoreboard
    task check_output;
    begin

        expected_voltage = (digital_in * 1.0) / 1023.0;

        if ((analog_out > expected_voltage - 0.001) &&
            (analog_out < expected_voltage + 0.001))
        begin

            pass_count = pass_count + 1;

            $display(
                "[PASS] Code=%0d Expected=%0f Actual=%0f",
                digital_in,
                expected_voltage,
                analog_out
            );

        end
        else begin

            fail_count = fail_count + 1;

            $display(
                "[FAIL] Code=%0d Expected=%0f Actual=%0f",
                digital_in,
                expected_voltage,
                analog_out
            );

        end

        // Coverage

        if (digital_in < 341)
            low_cov = 1;

        else if (digital_in < 682)
            mid_cov = 1;

        else
            high_cov = 1;

    end
    endtask

    initial begin

        pass_count = 0;
        fail_count = 0;

        low_cov = 0;
        mid_cov = 0;
        high_cov = 0;

        rst_n = 0;
        digital_in = 0;

        #20;
        rst_n = 1;

        digital_in = 0;
        #15;
        check_output();

        digital_in = 255;
        #15;
        check_output();

        digital_in = 511;
        #15;
        check_output();

        digital_in = 767;
        #15;
        check_output();

        digital_in = 1023;
        #15;
        check_output();

        $display("");
        $display("=================================");
        $display("DAC TEST SUMMARY");
        $display("PASS COUNT = %0d", pass_count);
        $display("FAIL COUNT = %0d", fail_count);
        $display("=================================");

        $display("");
        $display("FUNCTIONAL COVERAGE");
        $display("LOW RANGE HIT  = %0d", low_cov);
        $display("MID RANGE HIT  = %0d", mid_cov);
        $display("HIGH RANGE HIT = %0d", high_cov);

        if (low_cov && mid_cov && high_cov)
            $display("COVERAGE STATUS = PASS");
        else
            $display("COVERAGE STATUS = FAIL");

        $finish;

    end

endmodule
