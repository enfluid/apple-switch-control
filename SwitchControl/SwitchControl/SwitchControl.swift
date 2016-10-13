import UIKit

public class SwitchControl: UIControl {

    enum SelectedSegment { case top, bottom }

    let labels = (top: SwitchControlLabel(), bottom: SwitchControlLabel())
    let stackView = UIStackView()

    var selectedSegment: SelectedSegment = .top {
        didSet {
            selectDeselectLabels()
            accessibilityValue = selectedLabel.text
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            stackView.alpha = isHighlighted ? 0.5 : 1
        }
    }

    init(topTitle: String, bottomTitle: String) {
        super.init(frame: .zero)
        configureStackView()
        labels.top.isSelected = true
        labels.top.text = topTitle
        labels.bottom.text = bottomTitle
        addTarget(self, action: #selector(SwitchControl.didTouchUpInside), for: .touchUpInside)
        accessibilityTraits = UIAccessibilityTraitButton
        accessibilityValue = selectedLabel.text
    }

    @IBAction func didTouchUpInside() {
        switch selectedSegment {
        case .top: selectedSegment = .bottom
        case .bottom: selectedSegment = .top
        }
    }

    private func selectDeselectLabels() {
        selectedLabel.isSelected = true
        deselectedLabel.isSelected = false
    }

    private var selectedLabel: SwitchControlLabel {
        switch selectedSegment {
        case .top: return labels.top
        case .bottom: return labels.bottom
        }
    }

    private var deselectedLabel: SwitchControlLabel {
        switch selectedSegment {
        case .top: return labels.bottom
        case .bottom: return labels.top
        }
    }

    private func configureStackView() {
        addSubview(stackView)
        stackView.addArrangedSubview(labels.top)
        stackView.addArrangedSubview(labels.bottom)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        let constraints = [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required public init?(coder: NSCoder) {
        return nil
    }

}
