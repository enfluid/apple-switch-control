import XCTest
@testable import SwitchControl

extension SwitchControlTests {

    func testIsAccessibilityElement() {
        XCTAssertTrue(switchControl.isAccessibilityElement)
    }

    func testAccessibilityTraits() {
        XCTAssertEqual(switchControl.accessibilityTraits, UIAccessibilityTraitButton)
    }

    func testDefaultAccessibilityValue1() {
        let topTitle = "A"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        XCTAssertEqual(switchControl.accessibilityValue, topTitle)
    }

    func testDefaultAccessibilityValue2() {
        let topTitle = "B"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        XCTAssertEqual(switchControl.accessibilityValue, topTitle)
    }

    func testBottomAccessibilityValue1() {
        let bottomTitle = "A"
        let switchControl = SwitchControl(topTitle: "", bottomTitle: bottomTitle)
        switchControl.selectedSegment = .bottom
        XCTAssertEqual(switchControl.accessibilityValue, bottomTitle)
    }

    func testBottomAccessibilityValue2() {
        let bottomTitle = "B"
        let switchControl = SwitchControl(topTitle: "", bottomTitle: bottomTitle)
        switchControl.selectedSegment = .bottom
        XCTAssertEqual(switchControl.accessibilityValue, bottomTitle)
    }

    func testTopAccessibilityValue1() {
        let topTitle = "A"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        switchControl.accessibilityValue = "X"
        switchControl.selectedSegment = .top
        XCTAssertEqual(switchControl.accessibilityValue, topTitle)
    }

    func testTopAccessibilityValue2() {
        let topTitle = "B"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        switchControl.accessibilityValue = "X"
        switchControl.selectedSegment = .top
        XCTAssertEqual(switchControl.accessibilityValue, topTitle)
    }

    func testAccessibilityHint() {
        let expectedHint = NSLocalizedString("Double tap to toggle", comment: "")
        XCTAssertEqual(switchControl.accessibilityHint, expectedHint)
    }

}
