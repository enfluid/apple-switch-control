import XCTest
@testable import SwitchControl

extension SwitchControlTests {

    // MARK: Stack view

    func testStackViewType() {
        XCTAssertTrue(switchControl.stackView as Any is UIStackView)
    }

    func testStackViewArrangedSubviews() {
        XCTAssertEqual(switchControl.stackView.arrangedSubviews, [switchControl.topLabel, switchControl.bottomLabel])
    }

    func testStackViewIgnoreAutoresizingMask() {
        XCTAssertFalse(switchControl.stackView.translatesAutoresizingMaskIntoConstraints)
    }

    func testStackViewIgnoreUserInteraction() {
        XCTAssertFalse(switchControl.stackView.isUserInteractionEnabled)
    }

    func testStackViewAxis() {
        XCTAssertEqual(switchControl.stackView.axis, .vertical)
    }

    func testStackViewTopConstraint() {
        let expectedConstraint = switchControl.stackView.topAnchor.constraint(equalTo: switchControl.topAnchor)
        XCTAssertConstraint(expectedConstraint, inView: switchControl)
    }

    func testStackViewLeadingConstraint() {
        let expectedConstraint = switchControl.stackView.leadingAnchor.constraint(equalTo: switchControl.leadingAnchor)
        XCTAssertConstraint(expectedConstraint, inView: switchControl)
    }

    func testStackViewBottomConstraint() {
        let expectedConstraint = switchControl.stackView.bottomAnchor.constraint(equalTo: switchControl.bottomAnchor)
        XCTAssertConstraint(expectedConstraint, inView: switchControl)
    }

    func testStackViewTrailingConstraint() {
        let expectedConstraint = switchControl.stackView.trailingAnchor.constraint(equalTo: switchControl.trailingAnchor)
        XCTAssertConstraint(expectedConstraint, inView: switchControl)
    }

    func testSelectedSegmentType() {
        XCTAssertTrue(switchControl.selectedSegment as Any is SwitchControl.SelectedSegment)
    }

    func testSelectedSegmentDefault() {
        XCTAssertEqual(switchControl.selectedSegment, .top)
    }

}
