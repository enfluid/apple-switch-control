import UIKit

final class SwitchControlLabel: UILabel {

    var isSelected = false {
        didSet {
            backgroundColor = isSelected ? tintColor : nil
        }
    }

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if isSelected {
            backgroundColor = tintColor
        }
    }

}
