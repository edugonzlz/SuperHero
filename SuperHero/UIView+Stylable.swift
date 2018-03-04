import UIKit

extension UIView: Stylable {
    func style(_ style: ViewStyle) {
        self.backgroundColor = style.backgroundColor
        self.layer.cornerRadius = style.cornerRadius
        self.layer.shadowColor = style.shadowColor.cgColor
        self.layer.shadowOffset = style.shadowOffset
        self.layer.shadowOpacity = style.shadowOpacity
        self.layer.shadowRadius = style.shadowRadius
    }
}
