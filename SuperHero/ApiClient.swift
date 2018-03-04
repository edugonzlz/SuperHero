import Alamofire
import RxSwift

struct APIClientConstants {
    static let retries = 3
}

class ApiClient: ApiClientType {
    
    // MARK: - Init
    private init() {}
    static let shared = ApiClient()
    
    // MARK: - Methods
    
    // GET
    func getEntity<T:JSONDecodable>(forResource resource: ResourceType) -> Observable<T?> {
        return request(forResource: resource, method: .get)
            .map { data in
                guard let entity: T = decode(data) else {
                    return nil
                }
                return entity
        }
    }
    
    func getEntitiyList<T:JSONDecodable>(forResource resource: ResourceType) -> Observable<[T]>{
        return request(forResource: resource, method: .get)
            .map { data in
                guard let entities: [T] = decode(data) else {
                    return []
                }
                return entities
        }
    }
    
    // MARK: - Request
    private func request(forResource resource: ResourceType, method: HTTPMethod) -> Observable<Data> {
        return Observable.create { observer in
            let request = Alamofire.request(resource.url,
                                            method: method,
                                            parameters: resource.parameters,
                                            encoding: URLEncoding.default,
                                            headers: self.headers())
                .validate()
                .responseData(completionHandler: { response in
                    
                    if response.result.isSuccess, let data = response.result.value {
                        observer.onNext(data)
                        return observer.onCompleted()
                    } else {
                        return observer.onError(ApiError.networkException)
                    }
                })
            return Disposables.create(with: {
                request.cancel()
            })
            }
            .retry(APIClientConstants.retries)
    }
}

extension ApiClient {
    fileprivate func headers()-> HTTPHeaders {
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        return headers
    }
}
