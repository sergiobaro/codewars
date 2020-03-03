import Foundation

// dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

func digPow(for number: Int, using power: Int) -> Int {
  var digits = [Int]()
  var numberDigits = number
  while numberDigits > 0 {
    digits.append(numberDigits % 10)
    numberDigits = numberDigits / 10
  }
  digits.reverse()
  
  var power = power
  let total = digits.reduce(0) { result, digit in
    power += 1
    return result + Int(pow(Float(digit), Float(power - 1)))
  }
  
  return total % number == 0 ? total / number : -1
}

digPow(for: 89, using: 1) // == 1
digPow(for: 92, using: 1) // -1
digPow(for: 46288, using: 3) // == 51
digPow(for: 235, using: 3) // == -1
digPow(for: 46288, using: 5) // == -1
