import UIKit

struct ViewStyle {
    var shadowColor: UIColor
    var shadowOffset: CGSize
    var shadowOpacity: Float
    var shadowRadius: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: UIColor
    
    private init(borderColor: UIColor = UIColor.clear,
                 borderWidth: CGFloat = 0.0,
                 shadowColor: UIColor = UIColor.clear,
                 shadowOffset: CGSize = CGSize.zero,
                 shadowOpacity: Float = 0.0,
                 shadowRadius: CGFloat = 0.0,
                 cornerRadius: CGFloat = 0.0,
                 backgroundColor: UIColor = UIColor.white) {
        
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
    
    static var shadowCromoView: ViewStyle {
        return ViewStyle(shadowColor: StyleConstant.shadowColorCommon,
                         shadowOffset: StyleConstant.shadowOffsetCommon,
                         shadowOpacity: StyleConstant.shadowOpacityCommon,
                         shadowRadius: StyleConstant.shadowRadiusCommon,
                         cornerRadius: StyleConstant.cornerRadiusCommon)
    }
}
