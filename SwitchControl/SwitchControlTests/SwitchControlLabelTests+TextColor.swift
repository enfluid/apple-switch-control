import XCTest
@testable import SwitchControl

extension SwitchControlLabelTests {

    // MARK: Default text color

    func testDefaultTextColor() {
        XCTAssertEqual(switchControlLabel.textColor, switchControlLabel.tintColor)
    }

    func testDefaultTextColorWhenTintColorDidChange1() {
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    func testDefaultTextColorWhenTintColorDidChange2() {
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    // MARK: Selected text color

    func testSelectedTextColor() {
        switchControlLabel.isSelected = true
        XCTAssertEqual(switchControlLabel.textColor, .white)
    }

    func testSelectedTextColorWhenTintColorDidChange() {
        switchControlLabel.isSelected = true
        switchControlLabel.tintColorDidChange()
        XCTAssertEqual(switchControlLabel.textColor, .white)
    }

    // MARK: Deselected text color

    func testDeselectedTextColorWhenTintColorDidChange1() {
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        switchControlLabel.textColor = .black
        switchControlLabel.isSelected = false
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    func testDeselectedTextColorWhenTintColorDidChange2() {
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        switchControlLabel.textColor = .black
        switchControlLabel.isSelected = false
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

}
