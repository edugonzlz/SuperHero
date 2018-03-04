import UIKit

typealias SuperHeroListRouterType = RouterType & SuperHeroDetailNavigable

class SuperHeroListRouter: Router, SuperHeroDetailNavigable {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init(navigationController: nil)
    }
    
    override func start() {
        let viewModel = container.resolve(SuperHeroListViewModel.self,
                                          argument: self as SuperHeroListRouterType)!
        let viewController = SuperHeroListViewController(viewModel: viewModel)
        
        self.navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    func navigateTo(superHero: SuperHeroEntity) {
        SuperHeroRouter(navigationController: self.navigationController, superHero: superHero).start()
    }
}
