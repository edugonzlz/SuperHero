import RxSwift

class GetSuperHeroListUseCase {
    
    let container = DependencyInjection.shared.container
    let repository: SuperHeroApiRepository
    
    init(repository: SuperHeroApiRepository) {
        self.repository = repository
    }
    
    func execute() -> Observable<SuperHeroListEntity?> {
        return repository.getSuperHeros()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
    }
}


