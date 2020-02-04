import XCTest
@testable import GiveMeADiamond

final class GiveMeADiamondTests: XCTestCase {
  
  func test_diamond1() {
    let expected = """
    *
    
    """
    XCTAssertEqual(diamond(1), expected)
  }
  
  func test_diamond3() {
    let expected = """
     *
    ***
     *
    
    """
    XCTAssertEqual(diamond(3), expected)
  }
  
  func test_diamond5() {
    let expected = """
      *
     ***
    *****
     ***
      *
    
    """
    XCTAssertEqual(diamond(5), expected)
  }
  
  func test_diamond7() {
    let expected = """
       *
      ***
     *****
    *******
     *****
      ***
       *

    """
    
    XCTAssertEqual(diamond(7), expected)
  }
  
  func test_evenNumber() {
    XCTAssertEqual(diamond(2), nil)
  }
  
  func test_negativeNumber() {
    XCTAssertEqual(diamond(-3), nil)
  }
  
  func test_zero() {
    XCTAssertEqual(diamond(0), nil)
  }
}
