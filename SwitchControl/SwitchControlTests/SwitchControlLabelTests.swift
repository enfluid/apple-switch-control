import XCTest
@testable import SwitchControl

class SwitchControlLabelTests: XCTestCase {

    let switchControlLabel = SwitchControlLabel()

    func testSuperclass() {
        XCTAssert(switchControlLabel as Any is UILabel)
    }

    func testSelectedType() {
        XCTAssertType(Bool.self, of: switchControlLabel.isSelected)
    }

    func testSelectedDefault() {
        XCTAssertFalse(switchControlLabel.isSelected)
    }

    func testBackgroundColorWhenSelected1() {
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        switchControlLabel.isSelected = true
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testBackgroundColorWhenSelected2() {
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        switchControlLabel.isSelected = true
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testBackgroundColorWhenDeselected() {
        switchControlLabel.backgroundColor = .red
        switchControlLabel.isSelected = false
        XCTAssertNil(switchControlLabel.backgroundColor)
    }

    func testBackgroundColorWhenTintColorDidChange1() {
        switchControlLabel.isSelected = true
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testBackgroundColorWhenTintColorDidChange2() {
        switchControlLabel.isSelected = true
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testBackgroundColorWhenTintColorDidChange3() {
        let backgroundColor: UIColor = .red
        switchControlLabel.backgroundColor = backgroundColor
        switchControlLabel.tintColor = .green
        XCTAssertEqual(switchControlLabel.backgroundColor, backgroundColor)
    }

}
