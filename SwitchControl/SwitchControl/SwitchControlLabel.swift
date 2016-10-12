import UIKit

final class SwitchControlLabel: UILabel {

    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? tintColor : nil
            textColor = isSelected ? .white : tintColor
        }
    }

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 4
        textColor = tintColor
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if isSelected {
            backgroundColor = tintColor
        } else {
            textColor = tintColor
        }
    }

}
