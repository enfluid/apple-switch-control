import UIKit

final class SwitchControlLabel: UILabel {

    // MARK: Initialization

    init() {
        super.init(frame: .zero)
        layer.masksToBounds = true
        layer.cornerRadius = 4
        textColor = tintColor
        textAlignment = .center
        font = SwitchControlLabel.preferredFont
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: Selection

    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? tintColor : .clear
            textColor = isSelected ? .white : tintColor
        }
    }

    // MARK: Tint color

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if isSelected {
            backgroundColor = tintColor
        } else {
            textColor = tintColor
        }
    }

    // MARK: Preferred font

    static let preferredFont: UIFont = .systemFont(ofSize: 15)

}
