import Foundation

protocol Stylable {
	associatedtype Style
    func style(_ style: Style)
}
