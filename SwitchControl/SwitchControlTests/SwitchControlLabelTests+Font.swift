import XCTest
@testable import SwitchControl

extension SwitchControlLabelTests {

    // MARK: Font

    func testPreferredFont() {
        let expectedFont: UIFont = .systemFont(ofSize: 15)
        XCTAssertEqual(SwitchControlLabel.preferredFont, expectedFont)
    }

    func testFont() {
        XCTAssertEqual(switchControlLabel.font, SwitchControlLabel.preferredFont)
    }

}
