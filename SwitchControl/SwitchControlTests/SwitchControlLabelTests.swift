import XCTest
@testable import SwitchControl

class SwitchControlLabelTests: XCTestCase {

    lazy var switchControlLabel = SwitchControlLabel()

    // MARK: Main

    func testSuperclass() {
        XCTAssertTrue(switchControlLabel as Any is UILabel)
    }

    func testUnarchiving() {
        let switchControlLabel = SwitchControlLabel(coder: .empty)
        XCTAssertNil(switchControlLabel)
    }

    func testFrame() {
        XCTAssertEqual(switchControlLabel.frame, .zero)
    }

    func testTextAlignment() {
        XCTAssertEqual(switchControlLabel.textAlignment, .center)
    }

    func testLayerMasksToBounds() {
        XCTAssertTrue(switchControlLabel.layer.masksToBounds)
    }

    func testLayerCornerRadius() {
        XCTAssertEqual(switchControlLabel.layer.cornerRadius, 4)
    }

    // MARK: Selected

    func testSelectedType() {
        XCTAssertTrue(switchControlLabel.isSelected as Any is Bool)
    }

    func testSelectedDefault() {
        XCTAssertFalse(switchControlLabel.isSelected)
    }

}
