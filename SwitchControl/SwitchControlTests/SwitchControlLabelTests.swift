import XCTest
@testable import SwitchControl

class SwitchControlLabelTests: XCTestCase {

    lazy var switchControlLabel = SwitchControlLabel()

    // MARK: Main

    func testSuperclass() {
        XCTAssert(switchControlLabel as Any is UILabel)
    }

    func testUnarchiving() {
        let switchControlLabel = SwitchControlLabel(coder: .empty)
        XCTAssertNil(switchControlLabel)
    }

    func testSelectedType() {
        XCTAssertType(Bool.self, of: switchControlLabel.isSelected)
    }

    func testFrame() {
        XCTAssertEqual(switchControlLabel.frame, .zero)
    }

    func testLayerCornerRadius() {
        XCTAssertEqual(switchControlLabel.layer.cornerRadius, 4)
    }

    // MARK: Selected

    func testSelectedDefault() {
        XCTAssertFalse(switchControlLabel.isSelected)
    }

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
        XCTAssertNil(switchControlLabel.backgroundColor)
    }

    func testDeselectedBackgroundColorWhenTintColorDidChange() {
        let backgroundColor: UIColor = .red
        switchControlLabel.backgroundColor = backgroundColor
        switchControlLabel.tintColorDidChange()
        XCTAssertEqual(switchControlLabel.backgroundColor, backgroundColor)
    }

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
