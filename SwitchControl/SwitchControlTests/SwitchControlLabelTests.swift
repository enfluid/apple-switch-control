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

    // MARK: Background color

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
        switchControlLabel.tintColorDidChange()
        XCTAssertEqual(switchControlLabel.backgroundColor, backgroundColor)
    }

    // MARK: Text color

    func testTextColor1() {
        XCTAssertEqual(switchControlLabel.textColor, switchControlLabel.tintColor)
    }

    func testTextColorWhenTintColorDidChange1() {
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    func testTextColorWhenTintColorDidChange2() {
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    func testTextColorWhenSelected() {
        switchControlLabel.isSelected = true
        XCTAssertEqual(switchControlLabel.textColor, .white)
    }

    func testTextColorWhenDeselected1() {
        let tintColor: UIColor = .red
        switchControlLabel.tintColor = tintColor
        switchControlLabel.textColor = .black
        switchControlLabel.isSelected = false
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    func testTextColorWhenDeselected2() {
        let tintColor: UIColor = .green
        switchControlLabel.tintColor = tintColor
        switchControlLabel.textColor = .black
        switchControlLabel.isSelected = false
        XCTAssertEqual(switchControlLabel.textColor, tintColor)
    }

    func testSelectedTextColorWhenTintColorDidChange() {
        switchControlLabel.isSelected = true
        switchControlLabel.tintColorDidChange()
        XCTAssertEqual(switchControlLabel.textColor, .white)
    }

}
