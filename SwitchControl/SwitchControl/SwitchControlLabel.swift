import UIKit

final class SwitchControlLabel: UILabel {

    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? tintColor : nil
        }
    }

}
