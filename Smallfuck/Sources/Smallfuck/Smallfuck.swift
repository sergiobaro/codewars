
func interpreter(_ code: String, _ tape: String) -> String {
  return Smallfuck().execute(code: code, tape: tape)
}

class Smallfuck {
  
  func execute(code: String, tape: String) -> String {
    print("code: \(code)")
    print("tape: \(tape)")
    
    let code = code.map(String.init)
    var data = tape.compactMap { Int(String($0)) }
    
    var codePointer = 0
    var dataPointer = 0
    
    while code.indices.contains(codePointer) && data.indices.contains(dataPointer) {
      let op = code[codePointer]
      
      switch op {
      case ">": dataPointer += 1
      case "<": dataPointer -= 1
      case "*": data[dataPointer] = (data[dataPointer] == 1 ? 0 : 1)
      case "[":
        if data[dataPointer] == 0 {
          var current = op
          var brackets = 1
          while current != "]" || brackets != 0 {
            codePointer += 1
            current = code[codePointer]
            if current == "]" { brackets -= 1 }
            else if current == "[" { brackets += 1 }
          }
        }
      case "]":
        if data[dataPointer] != 0 {
          var current = op
          var brackets = 1
          while current != "[" || brackets != 0 {
            codePointer -= 1
            current = code[codePointer]
            if current == "[" { brackets -= 1 }
            else if current == "]" { brackets += 1 }
          }
        }
      default: break
      }
      
      codePointer += 1
    }
    
    return data.map(String.init).joined()
  }
}
