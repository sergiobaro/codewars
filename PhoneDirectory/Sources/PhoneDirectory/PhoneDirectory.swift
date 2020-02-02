
import Foundation

func phone(_ string: String, _ num: String) -> String {
  let directory = PhoneDirectory(string: string)
  
  let records = directory[num]
  
  if records.count > 1 {
    return "Error => Too many people: \(num)"
  }
  if records.isEmpty {
    return "Error => Not found: \(num)"
  }
  
  let record = records.first!
  return "Phone => \(record.phone), Name => \(record.name), Address => \(record.address)"
}

class PhoneDirectory {
  
  struct Record {
    let phone: String
    let name: String
    let address: String
  }
  
  private let directory: [Record]
  
  init(string: String) {
    self.directory = PhoneDirectory.records(from: string)
  }
  
  subscript(phone: String) -> [Record] {
    return self.directory.filter { $0.phone == phone }
  }
  
  private static func records(from string: String) -> [Record] {
    let records = string.split(separator: "\n")
      .map { PhoneDirectory.record(from: String($0)) }
    
    return records
  }

  private static func record(from string: String) -> Record {
    let phone = findPattern("\\+(\\d{1,2}-\\d{3}-\\d{3}-\\d{4})", in: string)
    let name = findPattern("<(.+)>", in: string)
    let address = findAddress(in: string, remove: [phone, name])
    
    return Record(phone: phone, name: name, address: address)
  }

  private static func findAddress(in string: String, remove: [String]) -> String {
    let allowedCharacters = CharacterSet.alphanumerics
      .union(CharacterSet.whitespaces)
      .union(CharacterSet(charactersIn: "_-,."))
    
    let result = remove
      .reduce(string) { $0.replacingOccurrences(of: $1, with: "") }
      .components(separatedBy: allowedCharacters.inverted)
      .joined()
      .replacingOccurrences(of: "_", with: " ")
      .replacingOccurrences(of: ",", with: " ")
      .trimmingCharacters(in: CharacterSet.whitespaces)
      .replacingOccurrences(of: "  ", with: " ")
    
    return result
  }

  private static func findPattern(_ pattern: String, in string: String) -> String {
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
    
    var result = ""
    if let match = matches.first {
      let matchRange = match.range(at: match.numberOfRanges - 1)
      let startIndex = string.index(string.startIndex, offsetBy: matchRange.location)
      let endIndex = string.index(startIndex, offsetBy: matchRange.length)
      
      result = String(string[startIndex..<endIndex])
    }
    
    return result
  }
}
