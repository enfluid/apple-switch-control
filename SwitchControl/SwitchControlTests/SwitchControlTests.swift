import XCTest
@testable import SwitchControl

class SwitchControlTests: XCTestCase {

    lazy var switchControl = SwitchControl(topTitle: "A", bottomTitle: "B")

    // MARK: Main

    func testSuperclass() {
        XCTAssertTrue(switchControl as Any is UIControl)
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

    func testFontType() {
        XCTAssertTrue(switchControl.font as Any is UIFont)
    }

    func testFontDefault() {
        XCTAssertEqual(switchControl.font, SwitchControlLabel.preferredFont)
    }

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

    // MARK: Accessibility

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
