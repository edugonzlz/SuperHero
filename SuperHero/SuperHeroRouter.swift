import UIKit

typealias SuperHeroRouterType = RouterType

class SuperHeroRouter: Router {
    
    private let superHero: SuperHeroEntity
    
    required init(navigationController: UINavigationController?, superHero: SuperHeroEntity) {
        self.superHero = superHero
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let viewModel = container.resolve(SuperHeroViewModel.self,
                                          arguments: self as SuperHeroRouterType, superHero)!
        let viewController = SuperHeroViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
