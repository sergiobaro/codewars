import Foundation

func tongues(_ code: String) -> String {
  let vowels = ["a", "i", "y", "e", "o", "u"]
  let consonants = ["b", "k", "x", "z", "n", "h", "d", "c", "w", "g", "p", "v", "j", "q", "t", "s", "r", "l", "m", "f"]
  
  func mapCharacter(_ character: Character, from characters: [String], offset: Int) -> String? {
    guard let index = characters.firstIndex(of: character.lowercased()) else {
      return nil
    }
    let newIndex = (index + offset) % characters.count
    let newChar = characters[newIndex]
    return character.isLowercase ? newChar : newChar.uppercased()
  }
  
  let result = code.map { character -> String in
    if let newCharacter = mapCharacter(character, from: vowels, offset: 3) {
      return newCharacter
    }
    if let newCharacter = mapCharacter(character, from: consonants, offset: 10) {
      return newCharacter
    }
    return String(character)
  }

  return result.joined()
}
