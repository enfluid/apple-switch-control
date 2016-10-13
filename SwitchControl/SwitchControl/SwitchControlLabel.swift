import UIKit

final class SwitchControlLabel: UILabel {

    // MARK: Initialization

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 4
        textColor = tintColor
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: Selection

    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? tintColor : nil
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

}
