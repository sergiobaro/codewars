#!/usr/bin/ruby

def encoder(data)
    symbols = ['']
    output = ''
    chars = data.chars

    while chars.any? do
        current_symbol = chars.shift
        symbol = current_symbol
        index = 0
        
        current_symbol_index = symbols.find_index current_symbol
        while current_symbol_index and chars.any? do 
            index = current_symbol_index
            symbol = chars.shift
            current_symbol += symbol
            current_symbol_index = symbols.find_index current_symbol
        end

        if symbols.any? current_symbol then
            # last symbol is a match
            output += current_symbol_index.to_s
        else 
            symbols.append current_symbol
            output += index.to_s + symbol
        end
    end

    return output
end

def decoder(data)
    symbols = ['']
    output = ''

    data.split(/([A-Z]+)/).each_slice(2) { |slice|
        index = slice[0].to_i
        symbol = slice[1]

        if symbol.nil? then
            # last symbol is a match
            output += symbols[index]
        else 
            full_symbol = symbols[index] + symbol
            symbols.append full_symbol unless symbols.any? full_symbol
            output += full_symbol
        end
    }
    
    return output
end

require 'test/unit'
extend Test::Unit::Assertions

# 'Encoding'

assert_equal(encoder('ABAABABAABAB'), '0A0B1A2A4A4B')
assert_equal(encoder('ABAABABAABABAA'), '0A0B1A2A4A4B3')
assert_equal(encoder('ABBCBCABABCAABCAABBCAA'), '0A0B2C3A2A4A6B6')
assert_equal(encoder('AAAAAAAAAAAAAAA'), '0A1A2A3A4A')
assert_equal(encoder('ABCABCABCABCABCABC'), '0A0B0C1B3A2C4C7A6')
assert_equal(encoder('ABCDDEFGABCDEDBBDEAAEDAEDCDABC'), '0A0B0C0D4E0F0G1B3D0E4B2D10A1E4A10D9A2C')

# # 'Decoding'
assert_equal(decoder('0A0B1A2A4A4B'), 'ABAABABAABAB')
assert_equal(decoder('0A0B1A2A4A4B3'), 'ABAABABAABABAA')
assert_equal(decoder('0A0B2C3A2A4A6B6'), 'ABBCBCABABCAABCAABBCAA')
assert_equal(decoder('0A1A2A3A4A'), 'AAAAAAAAAAAAAAA')
assert_equal(decoder('0A0B0C1B3A2C4C7A6'), 'ABCABCABCABCABCABC')
assert_equal(decoder('0A0B0C0D4E0F0G1B3D0E4B2D10A1E4A10D9A2C'), 'ABCDDEFGABCDEDBBDEAAEDAEDCDABC')