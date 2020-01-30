
func evaluate(good: String, vsEvil evil: String) -> String {
  let goodStrength = [1, 2, 3, 3, 4, 10]
  let evilStrength = [1, 2, 2, 2, 3, 5, 10]
  
  func totalValue(values: String, strength: [Int]) -> Int {
    let values = values
      .split(separator: " ")
      .map(String.init)
      .compactMap(Int.init)
    
    return zip(values, strength)
      .reduce(0) { $0 + $1.0 * $1.1 }
  }
  
  let goodTotalValue = totalValue(values: good, strength: goodStrength)
  let evilTotalValue = totalValue(values: evil, strength: evilStrength)
  
  if goodTotalValue > evilTotalValue {
    return "Battle Result: Good triumphs over Evil"
  }
  if evilTotalValue > goodTotalValue {
    return "Battle Result: Evil eradicates all trace of Good"
  }
  
  return "Battle Result: No victor on this battle field"
}
