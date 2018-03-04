import Foundation

struct Resource: ResourceType {
    var url: URL
    var parameters: [String: Any]?
    
    init(url: URL, parameters: [String: Any]?) {
        self.url = url
        self.parameters = parameters
    }
}
