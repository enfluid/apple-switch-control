import XCTest
@testable import SwitchControl

extension SwitchControlTests {

    // MARK: Top label

    func testTopLabelType() {
        XCTAssertTrue(switchControl.topLabel as Any is SwitchControlLabel)
    }

    func testTopLabelFont1() {
        let font: UIFont = .systemFont(ofSize: 1)
        switchControl.font = font
        XCTAssertEqual(switchControl.topLabel.font, font)
    }

    func testTopLabelFont2() {
        let font: UIFont = .systemFont(ofSize: 2)
        switchControl.font = font
        XCTAssertEqual(switchControl.topLabel.font, font)
    }

    func testTopLabelText1() {
        let topTitle = "A"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        XCTAssertEqual(switchControl.topLabel.text, topTitle)
    }

    func testTopLabelText2() {
        let topTitle = "B"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        XCTAssertEqual(switchControl.topLabel.text, topTitle)
    }

    func testTopLabelSelectedDefault() {
        XCTAssertTrue(switchControl.topLabel.isSelected)
    }

    func testTopLabelSelectedForSelectedSegment1() {
        switchControl.selectedSegment = .bottom
        XCTAssertFalse(switchControl.topLabel.isSelected)
    }

    func testTopLabelSelectedForSelectedSegment2() {
        switchControl.selectedSegment = .top
        XCTAssertTrue(switchControl.topLabel.isSelected)
    }

    // MARK: Bottom label

    func testBottomLabelFont1() {
        let font: UIFont = .systemFont(ofSize: 1)
        switchControl.font = font
        XCTAssertEqual(switchControl.bottomLabel.font, font)
    }

    func testBottomLabelFont2() {
        let font: UIFont = .systemFont(ofSize: 2)
        switchControl.font = font
        XCTAssertEqual(switchControl.bottomLabel.font, font)
    }

    func testBottomLabelType() {
        XCTAssertTrue(switchControl.bottomLabel as Any is SwitchControlLabel)
    }

    func testBottomLabelText1() {
        let bottomTitle = "A"
        let switchControl = SwitchControl(topTitle: "", bottomTitle: bottomTitle)
        XCTAssertEqual(switchControl.bottomLabel.text, bottomTitle)
    }

    func testBottomLabelText2() {
        let bottomTitle = "B"
        let switchControl = SwitchControl(topTitle: "", bottomTitle: bottomTitle)
        XCTAssertEqual(switchControl.bottomLabel.text, bottomTitle)
    }

    func testBottomLabelForSelectedSegment1() {
        switchControl.bottomLabel.isSelected = true
        switchControl.selectedSegment = .top
        XCTAssertFalse(switchControl.bottomLabel.isSelected)
    }

    func testBottomLabelForSelectedSegment2() {
        switchControl.selectedSegment = .bottom
        XCTAssertTrue(switchControl.bottomLabel.isSelected)
    }

}
