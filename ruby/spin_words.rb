#!/usr/bin/ruby

def spinWords(string)
    string
        .split(" ")
        .map { |word| word.length < 5 ? word : word.reverse }
        .join(" ")
end

def test(string, expected)
    result = spinWords string
    if result == expected then
        puts "OK, expected: '#{expected}', actual: '#{result}'"
    else
        puts "KO, expected: '#{expected}', actual: '#{result}'"
    end
end

test("Hey fellow warriors", "Hey wollef sroirraw")
test("This is a test", "This is a test")
test("This is another test", "This is rehtona test")