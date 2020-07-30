#!/usr/bin/ruby

class Num
    @value = ""

    def initialize(value) 
        @value = value
    end
    
    def to_i
        @value.to_i
    end

    %i(zero one two three four five six seven eight nine).each_with_index do |symbol, value|
        define_method symbol do 
            Num.new(@value + value.to_s)
        end
        define_singleton_method symbol do
            Num.new(@value + value.to_s)
        end
    end
end

def test(number, expected)
    puts "#{number == expected}, expected: #{expected}, actual: #{number}" 
end

test(Num.one.to_i, 1)
test(Num.one.two.three.to_i, 123)