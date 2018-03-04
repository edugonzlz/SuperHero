import UIKit
import RxSwift

protocol RouterType: class {
    func start()
}

class Router: NSObject, RouterType {
    let container = DependencyInjection.shared.container
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init()
    }
    
    deinit {
        print("DEINIT: \(self)")
    }
    
    func start() {
        fatalError("not implemented")
    }
}
