import UIKit

public class SwitchControl: UIControl {

    enum SelectedSegment { case top, bottom }

    let labels = (top: SwitchControlLabel(), bottom: SwitchControlLabel())
    let stackView = UIStackView()

    var selectedSegment: SelectedSegment = .top {
        didSet {
            switch selectedSegment {
            case .top:
                labels.top.isSelected = true
                labels.bottom.isSelected = false
            case .bottom:
                labels.top.isSelected = false
                labels.bottom.isSelected = true
            }
        }
    }

    init(topTitle: String, bottomTitle: String) {
        super.init(frame: .zero)
        configureStackView()
        labels.top.isSelected = true
        labels.top.text = topTitle
        labels.bottom.text = bottomTitle
        addTarget(self, action: #selector(SwitchControl.didTouchUpInside), for: .touchUpInside)
    }

    @IBAction func didTouchUpInside() {
        switch selectedSegment {
        case .top:
            selectedSegment = .bottom
        case .bottom:
            selectedSegment = .top
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
