import XCTest
@testable import SwitchControl

extension SwitchControlTests {

    // MARK: Touch interaction

    func testTouchTarget() {
        let actions = switchControl.actions(forTarget: switchControl, forControlEvent: .touchUpInside) ?? []
        let expectedAction = String(describing: #selector(SwitchControl.didTouchUpInside))
        XCTAssertEqual(actions, [expectedAction])
    }

    func testTouchAction1() {
        switchControl.didTouchUpInside()
        XCTAssertEqual(switchControl.selectedSegment, .bottom)
    }

    func testTouchAction2() {
        switchControl.selectedSegment = .bottom
        switchControl.didTouchUpInside()
        XCTAssertEqual(switchControl.selectedSegment, .top)
    }

}
