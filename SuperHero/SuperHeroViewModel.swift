import RxSwift

protocol SuperHeroViewModelType: ViewModelType {
    var image: Observable<String> {get}
}

class SuperHeroViewModel: ViewModel,  SuperHeroViewModelType {

    lazy var image: Observable<String> = self.imageVariable.asObservable()
    private var imageVariable: Variable<String> = Variable("")

    // MARK: - Private
    private let bag = DisposeBag()
    private let router: SuperHeroRouterType
    private let superHero: SuperHeroEntity

    // MARK: - Init
    
    init(router: SuperHeroRouterType, superHero: SuperHeroEntity) {
        self.router = router
        self.superHero = superHero
        self.imageVariable.value = superHero.photo
        super.init(router: router)
    }
    
    // MARK: - Setup
    
    override func reload() {
        super.reload()
    }
}
