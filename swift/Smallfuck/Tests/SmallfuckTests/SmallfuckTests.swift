import XCTest
@testable import Smallfuck

final class SmallfuckTests: XCTestCase {
  
  func test_empty() {
    XCTAssertEqual(interpreter("", "1"), "1")
  }
  
  func test_bracketsNotNested() {
    XCTAssertEqual(interpreter("*[>*]", "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"), "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111")
  }
  
  func test_bracketsNested() {
    XCTAssertEqual(interpreter("*>[[]*>]<*", "100"), "100")
    XCTAssertEqual(interpreter("[*>[>*>]>]", "11001"), "01100")
  }
  
  func test_pointerOutOfBounds() {
    XCTAssertEqual(interpreter("*>>>*>*>>*>>>>>>>*>*>*>*>>>**>>**", "0000000000000000"), "1001101000000111")
  }

  func test_examples() {
      var (code, tape) = ("*", "00101100")
      XCTAssertEqual(interpreter(code,tape), "10101100")
      (code,tape) = (">*>*", "00101100")
      XCTAssertEqual(interpreter(code,tape), "01001100")
      (code,tape) = ("*>*>*>*>*>*>*>*", "00101100")
      XCTAssertEqual(interpreter(code,tape), "11010011")
      (code,tape) = ("*>*>>*>>>*>*", "00101100")
      XCTAssertEqual(interpreter(code,tape), "11111111")
      (code,tape) = (">>>>>*<*<<*", "00101100")
      XCTAssertEqual(interpreter(code,tape), "00000000")
  }
}
