class adc_generator;

    adc_transaction tr;

    function new();
    endfunction

    task run();

        tr = new();
        tr.analog_in = 0.00;
        tr.expected_code = 0;
        tr.display();

        tr = new();
        tr.analog_in = 0.25;
        tr.expected_code = 255;
        tr.display();

        tr = new();
        tr.analog_in = 0.50;
        tr.expected_code = 511;
        tr.display();

        tr = new();
        tr.analog_in = 0.75;
        tr.expected_code = 767;
        tr.display();

        tr = new();
        tr.analog_in = 1.00;
        tr.expected_code = 1023;
        tr.display();

    endtask

endclass
