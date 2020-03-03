import XCTest
@testable import tongues

final class tonguesTests: XCTestCase {
  
  func test_vowels() {
    XCTAssertEqual(tongues("a"), "e")
  }
  
  func test_uppercase() {
    XCTAssertEqual(tongues("A"), "E")
  }
  
  func test_consonants() {
    XCTAssertEqual(tongues("t"), "n")
  }
  
  func testSamples() {
    XCTAssertEqual(tongues("Ita dotf ni dyca nsaw ecc."), "One ring to rule them all.")
    XCTAssertEqual(tongues("Tim oh nsa nowa gid ecc fiir wat ni liwa ni nsa eor ig nsaod liytndu."), "Now is the time for all good men to come to the aid of their country.")
    XCTAssertEqual(tongues("Giydhlida etr hakat uaedh efi iyd gidagensadh pdiyfsn ytni nsoh"), "Fourscore and seven years ago our forefathers brought unto this")
    XCTAssertEqual(tongues("litnotatn e tam tenoit."), "continent a new nation.")
    XCTAssertEqual(tongues("Nsa zyolv pdimt gij xywbar ikad nsa cequ rifh."), "The quick brown fox jumped over the lazy dogs.")
  }
}
