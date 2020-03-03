
func dec2FactString(_ nb: Int) -> String {
  var remainders = ["0"]
  var currentQuotient = nb
  var divisor = 1
  
  while currentQuotient != 0 {
    divisor += 1
    let quotient = currentQuotient / divisor
    let remainder = currentQuotient % divisor
    
    if remainder > 9 {
      let asciiDecimal = 65 + remainder - 10
      let asciiCharacter = Character(UnicodeScalar(asciiDecimal)!)
      remainders.append(String(asciiCharacter))
    } else {
      remainders.append(String(remainder))
    }
    
    currentQuotient = quotient
  }
  
  return remainders.reversed().joined()
}

func factString2dDec(_ s: String) -> Int {
  let numbers = s.compactMap { char -> Int? in
    if char >= "A", let ascii = char.asciiValue {
      return Int(ascii) - 65 + 10
    }
    return Int(String(char))
  }
  
  var count = s.count - 1
  var result = 0
  
  for number in numbers {
    result += number * fact(count)
    count -= 1
  }
  
  return result
}

func fact(_ n: Int) -> Int {
  guard n > 1 else { return 1 }
  
  return (2...n).reduce(1, *)
}
