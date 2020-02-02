import Foundation

func interpreter(_ prog: String) -> String {
  return MiniStringFuck().execute(prog)
}

class MiniStringFuck {
  
  func execute(_ prog: String) -> String {
    var result = ""
    var cell = 0
    
    prog.forEach { op in
      switch op {
      case "+":
        cell = (cell + 1) % 256
      case ".":
        let value = Character(UnicodeScalar(cell)!)
        result.append(value)
      default:
        break
      }
    }
    
    return result
  }
  
}
