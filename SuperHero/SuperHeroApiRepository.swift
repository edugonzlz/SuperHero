import RxSwift

class SuperHeroApiRepository {

    private let apiClient: ApiClientType
    private let baseURL: URL = URL(string: URLConstants.baseURL)!
    
    required public init(apiClient: ApiClientType) {
        self.apiClient = apiClient
    }
    
    public func getSuperHeros() -> Observable<SuperHeroListEntity?> {
        
        let url = baseURL.appendingPathComponent(ApiPaths.bvyob.rawValue)
        
        let resource = Resource(url: url, parameters: nil)
        
        return apiClient.getEntity(forResource: resource)
    }
}
