import XCTest
@testable import SwitchControl

class SwitchControlTests: XCTestCase {

    lazy var switchControl = SwitchControl(topTitle: "A", bottomTitle: "B")

    // MARK: Main

    func testSuperclass() {
        XCTAssertTrue(switchControl as Any is UIControl)
    }

    func testUnarchiving() {
        let switchControl = SwitchControl(coder: .empty)
        XCTAssertNil(switchControl)
    }

    func testFrame() {
        XCTAssertEqual(switchControl.frame, .zero)
    }

    func testSubviews() {
        XCTAssertEqual(switchControl.subviews, [switchControl.stackView])
    }

    func testFontType() {
        XCTAssertTrue(switchControl.font as Any is UIFont)
    }

    func testFontDefault() {
        XCTAssertEqual(switchControl.font, SwitchControlLabel.preferredFont)
    }

}
