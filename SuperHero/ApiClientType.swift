import RxSwift

protocol ApiClientType {
    func getEntity<T:JSONDecodable>(forResource resource: ResourceType) -> Observable<T?>
    func getEntitiyList<T:JSONDecodable>(forResource resource: ResourceType) -> Observable<[T]>
}
