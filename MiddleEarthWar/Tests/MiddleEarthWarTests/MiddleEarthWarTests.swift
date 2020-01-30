import XCTest
@testable import MiddleEarthWar

final class MiddleEarthWarTests: XCTestCase {
  
    func testEvilShouldWin() {
      XCTAssertEqual("Battle Result: Evil eradicates all trace of Good", evaluate(good: "1 1 1 1 1 1", vsEvil: "1 1 1 1 1 1 1"))
    }
  
    func testGoodShouldTriumph() {
      XCTAssertEqual("Battle Result: Good triumphs over Evil", evaluate(good: "0 0 0 0 0 10", vsEvil: "0 1 1 1 1 0 0"))
    }
  
    func testShouldBeATie() {
      XCTAssertEqual("Battle Result: No victor on this battle field", evaluate(good: "1 0 0 0 0 0", vsEvil: "1 0 0 0 0 0 0"))
    }
  
}
