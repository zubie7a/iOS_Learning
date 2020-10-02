import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {

        super.awakeFromNib()
        // This can't be done on interface builder so need to
        // do this programatically.
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
}
