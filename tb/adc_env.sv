class adc_env;

    adc_generator  gen;
    adc_scoreboard scb;

    function new();
        gen = new();
        scb = new();
    endfunction

    task run();

        gen.run();

    endtask

endclass
