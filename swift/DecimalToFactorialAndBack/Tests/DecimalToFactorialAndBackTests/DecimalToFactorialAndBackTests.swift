import XCTest
@testable import DecimalToFactorialAndBack

final class DecimalToFactorialAndBackTests: XCTestCase {
  
  func test_decimalToFactorial() {
    XCTAssertEqual(dec2FactString(2982), "4041000")
    XCTAssertEqual(dec2FactString(463), "341010")
  }
  
  func test_decimalToFactorial_withCharacters() {
    XCTAssertEqual(dec2FactString(36288000), "A0000000000")
  }
  
  func test_factorialStringToDecimal() {
    XCTAssertEqual(factString2dDec("4041000"), 2982)
    XCTAssertEqual(factString2dDec("341010"), 463)
  }
  
  func test_factorialStringToDecimal_withCharacters() {
    XCTAssertEqual(factString2dDec("27A0533231100"), 1273928000)
    XCTAssertEqual(factString2dDec("2B26614023000"), 1406772786)
  }
  
  func test_fact() {
    XCTAssertEqual(fact(0), 1)
    XCTAssertEqual(fact(1), 1)
    XCTAssertEqual(fact(2), 2)
    XCTAssertEqual(fact(3), 6)
    XCTAssertEqual(fact(4), 24)
  }
  
}
