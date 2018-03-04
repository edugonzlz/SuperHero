import Foundation

protocol ResourceType {
    var url: URL { get }
    var parameters: [String: Any]? { get }
    init(url: URL, parameters: [String: Any]?)
}
