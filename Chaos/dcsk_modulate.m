function modulated_signal = dcsk_modulate(input_bits, chaotic_signal)
    % Asignar valores de +1 o -1 a los bits
    input_bits(input_bits == 0) = -1;

    % Modulación DCSK: multiplicación de la señal caótica de referencia por la secuencia de bits modulada
    modulated_signal = chaotic_signal .* input_bits;
end