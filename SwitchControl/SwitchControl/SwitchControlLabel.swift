import UIKit

final class SwitchControlLabel: UILabel {

    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? tintColor : nil
        }
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if isSelected {
            backgroundColor = tintColor
        }
    }

}
