import XCTest
@testable import brainluck

final class BrainLuckTests: XCTestCase {
  
  let brainluck = BrainLuck()
  
  func test() {
//    XCTAssertEqual(self.brainluck.execute(code: "", input: ""), "")
//    XCTAssertEqual(self.brainluck.execute(code: ",.,.,.", input: "Hei"), "Hei")
//    XCTAssertEqual(self.brainluck.execute(code: ",+[-.,+]", input: "Codewars\(UnicodeScalar(255)!)"), "Codewars")
    XCTAssertEqual(self.brainluck.execute(code: ",[.[-],]", input: "Codewars\(UnicodeScalar(0)!)"), "Codewars")
//    XCTAssertEqual(self.brainluck.execute(code: ",>,<[>[->+>+<<]>>[-<<+>>]<<<-]>>.", input: "\(UnicodeScalar(8)!)\(UnicodeScalar(9)!)"), "\(UnicodeScalar(72)!)")
  }
  
}
