
func diamond(_ size: Int) -> String? {
  guard size > 0, size % 2 != 0 else { return nil }
  
  var result = ""
  
  let middleRow = (size / 2 + 1)
  for row in 1...size {
    let spaces = abs(row - middleRow)
    result += String(repeating: " ", count: spaces)
    result += String(repeating: "*", count: size - spaces * 2)
    result += "\n"
  }
  
//  for i in 1...size where i % 2 != 0 {
//    result += String(repeating: " ", count: (size - i) / 2)
//    result += String(repeating: "*", count: i)
//    result += "\n"
//  }
//
//  for i in (1..<size).reversed() where i % 2 != 0 {
//    result += String(repeating: " ", count: (size - i) / 2)
//    result += String(repeating: "*", count: i)
//    result += "\n"
//  }
  
  return result
}
