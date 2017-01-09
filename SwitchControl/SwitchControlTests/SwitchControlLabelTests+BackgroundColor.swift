import XCTest
@testable import SwitchControl

extension SwitchControlLabelTests {

    // MARK: Selected background color

    func testSelectedBackgroundColor1() {
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        switchControlLabel.isSelected = true
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testSelectedBackgroundColor2() {
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        switchControlLabel.isSelected = true
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testSelectedBackgroundColorWhenTintColorDidChange1() {
        switchControlLabel.isSelected = true
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    func testSelectedBackgroundColorWhenTintColorDidChange2() {
        switchControlLabel.isSelected = true
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.backgroundColor, tintColor)
    }

    // MARK: Deselected background color

    func testDeselectedBackgroundColor() {
        switchControlLabel.backgroundColor = .red
        switchControlLabel.isSelected = false
        XCTAssertEqual(switchControlLabel.backgroundColor, .clear)
    }

    func testDeselectedBackgroundColorWhenTintColorDidChange() {
        let backgroundColor: UIColor = .red
        switchControlLabel.backgroundColor = backgroundColor
        switchControlLabel.tintColorDidChange()
        XCTAssertEqual(switchControlLabel.backgroundColor, backgroundColor)
    }

}
