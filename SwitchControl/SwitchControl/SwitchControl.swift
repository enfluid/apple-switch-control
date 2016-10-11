import UIKit

public class SwitchControl: UIControl {

    enum SelectedSegment { case top, bottom }

    let labels = (top: UILabel(), bottom: UILabel())
    let stackView = UIStackView()

    var selectedSegment: SelectedSegment = .top {
        didSet {
            switch selectedSegment {
            case .top:
                labels.top.backgroundColor = tintColor
                labels.bottom.backgroundColor = nil
            case .bottom:
                labels.top.backgroundColor = nil
                labels.bottom.backgroundColor =  tintColor
            }
        }
    }

    init(topTitle: String, bottomTitle: String) {
        super.init(frame: .zero)
        configureStackView()
        labels.top.text = topTitle
        labels.bottom.text = bottomTitle
        labels.top.backgroundColor = tintColor
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
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
