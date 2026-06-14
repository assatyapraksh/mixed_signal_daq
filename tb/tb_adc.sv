module tb_adc;

    logic clk;
    logic rst_n;

    real analog_in;

    logic [9:0] digital_out;

    integer expected_code;
    integer pass_count;
    integer fail_count;

    // Functional Coverage Counters
    integer low_cov;
    integer mid_cov;
    integer high_cov;

    adc_model dut (
        .clk(clk),
        .rst_n(rst_n),
        .analog_in(analog_in),
        .digital_out(digital_out)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform Dump
    initial begin
        $dumpfile("waves/adc_wave.vcd");
        $dumpvars(0, tb_adc);
    end

    // Scoreboard + Coverage
    task check_output;

        begin

            // Coverage Collection
            if ((analog_in >= 0.0) && (analog_in < 0.33))
                low_cov = 1;

            else if ((analog_in >= 0.33) && (analog_in < 0.66))
                mid_cov = 1;

            else if ((analog_in >= 0.66) && (analog_in <= 1.0))
                high_cov = 1;

            // Reference Model
            if (analog_in <= 0.0)
                expected_code = 0;

            else if (analog_in >= 1.0)
                expected_code = 1023;

            else
                expected_code = integer'(analog_in * 1023.0);

            // Scoreboard Comparison
            if (digital_out == expected_code) begin

                pass_count = pass_count + 1;

                $display(
                    "[PASS] Vin=%0f Expected=%0d Actual=%0d",
                    analog_in,
                    expected_code,
                    digital_out
                );

            end
            else begin

                fail_count = fail_count + 1;

                $display(
                    "[FAIL] Vin=%0f Expected=%0d Actual=%0d",
                    analog_in,
                    expected_code,
                    digital_out
                );

            end

        end

    endtask

    // Test Stimulus
    initial begin

        pass_count = 0;
        fail_count = 0;

        low_cov  = 0;
        mid_cov  = 0;
        high_cov = 0;

        rst_n = 0;
        analog_in = 0.0;

        #20;
        rst_n = 1;

        analog_in = 0.00;
        #15;
        check_output();

        analog_in = 0.25;
        #15;
        check_output();

        analog_in = 0.50;
        #15;
        check_output();

        analog_in = 0.75;
        #15;
        check_output();

        analog_in = 1.00;
        #15;
        check_output();

        analog_in = 1.20;
        #15;
        check_output();

        analog_in = -0.20;
        #15;
        check_output();

        $display("");
        $display("=================================");
        $display("TEST SUMMARY");
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

        $display("=================================");

        $finish;

    end

endmodule
