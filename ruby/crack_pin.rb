#!/usr/bin/ruby

require 'digest'

def crack(hash)
    (0..99999).each do |pin| 
        pin = pin.to_s[0...5].rjust(5, '0')
        
        digest = Digest::MD5.hexdigest pin
        if digest == hash then 
            return pin
        end
    end

    return ""
end

def test(hash, pin) 
    result = crack(hash)
    if result == pin 
        print("OK, expected: '#{pin}', actual: '#{result}'\n")
    else 
        print("KO, expected: '#{pin}', actual: '#{result}'\n")
    end
end


test("827ccb0eea8a706c4c34a16891f84e7b", "12345")
test("86aa400b65433b608a9db30070ec60cd", "00078")