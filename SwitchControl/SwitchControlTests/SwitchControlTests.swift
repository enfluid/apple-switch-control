import XCTest
@testable import SwitchControl

class SwitchControlTests: XCTestCase {

    lazy var switchControl = SwitchControl(topTitle: "A", bottomTitle: "B")

    // MARK: Main

    func testSuperclass() {
        // TODO: Use XCTAssertSuperclass
        XCTAssert(switchControl as Any is UIControl)
    }

    func testUnarchiving() {
        let switchControl = SwitchControl(coder: .empty)
        XCTAssertNil(switchControl)
    }

    func testFrame() {
        XCTAssertEqual(switchControl.frame, .zero)
    }

    func testSubviews() {
        XCTAssertEqual(switchControl.subviews, [switchControl.stackView])
    }

    // MARK: Labels

    func testLabelsType() {
        XCTAssertType((SwitchControlLabel, SwitchControlLabel).self, of: switchControl.labels)
    }

    // MARK: Top label

    func testTopLabelText1() {
        let topTitle = "A"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        XCTAssertEqual(switchControl.labels.top.text, topTitle)
    }

    func testTopLabelText2() {
        let topTitle = "B"
        let switchControl = SwitchControl(topTitle: topTitle, bottomTitle: "")
        XCTAssertEqual(switchControl.labels.top.text, topTitle)
    }

    func testTopLabelSelectedDefault() {
        XCTAssert(switchControl.labels.top.isSelected)
    }

    func testTopLabelSelectedForSelectedSegment1() {
        switchControl.selectedSegment = .bottom
        XCTAssertFalse(switchControl.labels.top.isSelected)
    }

    func testTopLabelSelectedForSelectedSegment2() {
        switchControl.selectedSegment = .top
        XCTAssert(switchControl.labels.top.isSelected)
    }

    // MARK: Bottom label

    func testBottomLabelText1() {
        let bottomTitle = "A"
        let switchControl = SwitchControl(topTitle: "", bottomTitle: bottomTitle)
        XCTAssertEqual(switchControl.labels.bottom.text, bottomTitle)
    }

    func testBottomLabelText2() {
        let bottomTitle = "B"
        let switchControl = SwitchControl(topTitle: "", bottomTitle: bottomTitle)
        XCTAssertEqual(switchControl.labels.bottom.text, bottomTitle)
    }

    func testBottomLabelForSelectedSegment1() {
        switchControl.labels.bottom.isSelected = true
        switchControl.selectedSegment = .top
        XCTAssertFalse(switchControl.labels.bottom.isSelected)
    }

    func testBottomLabelForSelectedSegment2() {
        switchControl.selectedSegment = .bottom
        XCTAssert(switchControl.labels.bottom.isSelected)
    }

    // MARK: Stack view

    func testStackViewType() {
        XCTAssertType(UIStackView.self, of: switchControl.stackView)
    }

    func testStackViewArrangedSubviews() {
        XCTAssertEqual(switchControl.stackView.arrangedSubviews, [switchControl.labels.top, switchControl.labels.bottom])
    }

    func testStackViewIgnoreAutoresizingMask() {
        XCTAssertFalse(switchControl.stackView.translatesAutoresizingMaskIntoConstraints)
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
        XCTAssertType(SwitchControl.SelectedSegment.self, of: switchControl.selectedSegment)
    }

    func testSelectedSegmentDefault() {
        XCTAssertEqual(switchControl.selectedSegment, .top)
    }

}
