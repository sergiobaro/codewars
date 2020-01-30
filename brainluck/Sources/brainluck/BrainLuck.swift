
func brainLuck(_ code: String, input: String) -> String {
  return BrainLuck().execute(code: code, input: input)
}

class BrainLuck {

  private var data = [Int]()
  private var dataPointer = 0

  private var code = ""
  private var codeIndex = "".startIndex

  private var input = ""
  private var inputIndex = "".startIndex

  private var output = ""
  private var outputIndex = "".startIndex

  func execute(code: String, input: String) -> String {
    guard !code.isEmpty else {
      return ""
    }
    
    self.data = [Int]()
    self.dataPointer = 0

    self.code = code
    self.codeIndex = code.startIndex

    self.input = input
    self.inputIndex = input.startIndex

    self.output = ""
    self.outputIndex = self.output.startIndex

    start()

    return self.output
  }

  // PRIVATE

  private func start() {
    while self.codeIndex != self.code.endIndex {
      let operation = self.code[self.codeIndex]
      print("op: \(operation)")
      
      self.updateDataSizeIfNeeded()
      
      switch operation {
        case ">": dataPointer += 1
        case "<": dataPointer -= 1
        case "+": updateData(+)
        case "-": updateData(-)
        case ",": inputToData()
        case ".": dataToOutput()

        case "[": jumpForwardIfZero()
        case "]": jumpBackwardIfNotZero()

        case "d": debug()

        default: break
      }

      self.codeIndex = self.code.index(self.codeIndex, offsetBy: 1)
    }
  }

  // OPERATIONS

  private func updateData(_ block: (Int, Int) -> Int) {
    var value = self.data[self.dataPointer]
    value = block(value + 256, 1) % 256
    
    self.data[self.dataPointer] = value
  }

  private func inputToData() {
    let input = self.input.unicodeScalars[self.inputIndex]
    self.inputIndex = self.input.index(self.inputIndex, offsetBy: 1)

    self.data[self.dataPointer] = Int(input.value)
  }

  private func dataToOutput() {
    let output = self.data[self.dataPointer]
    let char = Character(UnicodeScalar(output)!)

    self.output.append(char)
  }

  private func jumpForwardIfZero() {
    let data = self.data[self.dataPointer]
    if data == 0 {
      self.codeIndex = self.findNextBracket()
    }
  }

  private func jumpBackwardIfNotZero() {
    let data = self.data[self.dataPointer]
    if data != 0 {
      self.codeIndex = self.findPreviousBracket()
    }
  }

  private func debug() {
    print("input: \(self.input)")
    print("data: \(self.data)")
    print("output: \(self.output)")
  }

  // HELPERS

  private func updateDataSizeIfNeeded() {
    guard !self.data.indices.contains(self.dataPointer) else {
      return
    }

    (self.data.count ... self.dataPointer).forEach { _ in
      self.data.append(0)
    }
  }

  private func findNextBracket() -> String.Index {
    var index = self.codeIndex
    var currentOperation = self.code[index]
    var bracketCount = 1

    while currentOperation != "]" && bracketCount != 0 {
      index = self.code.index(index, offsetBy: 1)
      currentOperation = self.code[index]
      
      if currentOperation == "[" {
        bracketCount += 1
      } else if currentOperation == "]" {
        bracketCount -= 1
      }
    }

    return index
  }

  private func findPreviousBracket() -> String.Index {
    var index = self.codeIndex
    var currentOperation = self.code[index]
    var bracketCount = 1

    while currentOperation != "[" && bracketCount != 0 {
      index = self.code.index(index, offsetBy: -1)
      currentOperation = self.code[index]
      
      if currentOperation == "]" {
        bracketCount += 1
      } else if currentOperation == "[" {
        bracketCount -= 1
      }
    }

    return index
  }
}
