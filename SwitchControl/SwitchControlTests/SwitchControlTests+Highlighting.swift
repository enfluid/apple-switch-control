import XCTest
@testable import SwitchControl

extension SwitchControlTests {

    // MARK: Highlighting

    func testHighlighted1() {
        switchControl.isHighlighted = true
        XCTAssertEqual(switchControl.stackView.alpha, 0.5)
    }

    func testHighlighted2() {
        switchControl.stackView.alpha = 0.5
        switchControl.isHighlighted = false
        XCTAssertEqual(switchControl.stackView.alpha, 1)
    }

}
