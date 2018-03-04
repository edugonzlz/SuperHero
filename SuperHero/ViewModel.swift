import RxSwift

protocol ViewModelType {
    func reload()
}

class ViewModel: ViewModelType {
    
    // MARK: - Private
    fileprivate let router: RouterType
    fileprivate let bag = DisposeBag()
    
    init(router: RouterType) {
        self.router = router
    }
    
    deinit {
        print("DEINIT: \(self)")
    }
    
    private func setupRx() {
    }
    
    // MARK: - Request Data
    func reload() {
    }
}
