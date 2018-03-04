import Swinject

final class DependencyInjection {
    let container: Container
    static let shared = DependencyInjection()
    
    private init() {
        container = Container()
        setup()
    }
    
    private func setup() {
        container.register(SuperHeroApiRepository.self) {_ in
            SuperHeroApiRepository(apiClient: ApiClient.shared)
        }
        container.register(GetSuperHeroListUseCase.self) {r in
            GetSuperHeroListUseCase(repository: r.resolve(SuperHeroApiRepository.self)!)
        }
        container.register(SuperHeroListViewModel.self) {r, router in
            SuperHeroListViewModel(router: router as SuperHeroListRouterType,
                                   getSuperHerosUseCase: r.resolve(GetSuperHeroListUseCase.self)!)
        }
        container.register(SuperHeroViewModel.self) {r, router, superHero in
            SuperHeroViewModel(router: router as SuperHeroRouterType,
                               superHero: superHero)
        }
    }
}
