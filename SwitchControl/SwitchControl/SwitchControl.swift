import UIKit

public class SwitchControl: UIControl {

    // MARK: Initialization

    public init(topTitle: String, bottomTitle: String) {
        super.init(frame: .zero)
        initStackView()
        initLabels(topTitle: topTitle, bottomTitle: bottomTitle)
        initTouchHandling()
        initAccessibility()
    }

    required public init?(coder: NSCoder) {
        return nil
    }

    // MARK: Selected segment

    public enum SelectedSegment { case top, bottom }

    public var selectedSegment: SelectedSegment = .top {
        didSet {
            selectDeselectLabels()
            updateAccessibilityValue()
        }
    }

    // MARK: Stack view

    let stackView = UIStackView()

    private func initStackView() {
        addSubview(stackView)
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        NSLayoutConstraint.activate(stackViewConstraints)
    }

    private var stackViewConstraints: [NSLayoutConstraint] {
        return [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
    }

    // MARK: Labels

    let topLabel = SwitchControlLabel()
    let bottomLabel = SwitchControlLabel()

    private func initLabels(topTitle: String, bottomTitle: String) {
        topLabel.isSelected = true
        topLabel.text = topTitle
        bottomLabel.text = bottomTitle
    }

    private func selectDeselectLabels() {
        selectedLabel.isSelected = true
        deselectedLabel.isSelected = false
    }

    private var selectedLabel: SwitchControlLabel {
        switch selectedSegment {
        case .top: return topLabel
        case .bottom: return bottomLabel
        }
    }

    private var deselectedLabel: SwitchControlLabel {
        switch selectedSegment {
        case .top: return bottomLabel
        case .bottom: return topLabel
        }
    }

    // MARK: Font

    public var font = SwitchControlLabel.preferredFont {
        didSet {
            topLabel.font = font
            bottomLabel.font = font
        }
    }

    // MARK: Highlighting

    public override var isHighlighted: Bool {
        didSet {
            stackView.alpha = isHighlighted ? 0.5 : 1
        }
    }

    // MARK: Touch interaction

    func initTouchHandling() {
        addTarget(self, action: #selector(SwitchControl.didTouchUpInside), for: .touchUpInside)
    }

    @IBAction func didTouchUpInside() {
        switch selectedSegment {
        case .top: selectedSegment = .bottom
        case .bottom: selectedSegment = .top
        }
    }

    // MARK: Accessibility

    private func initAccessibility() {
        accessibilityTraits = UIAccessibilityTraitButton
        updateAccessibilityValue()
        accessibilityHint = NSLocalizedString("Double tap to toggle", comment: "")
    }

    private func updateAccessibilityValue() {
        accessibilityValue = selectedLabel.text
    }

}
