import RxSwift

protocol SuperHeroListViewModelType: ViewModelType {
    var items: Observable<[SuperHeroEntity]> { get }
    
    func getViewModelForCell(indexPath: IndexPath)-> SuperHeroCellViewModelType
    func didSelectItem(indexPath: IndexPath)
}

class SuperHeroListViewModel: ViewModel,  SuperHeroListViewModelType {

    // MARK: - Input
    private var itemsVariable: Variable<[SuperHeroEntity]> = Variable([])
    
    // MARK: - Output
    lazy var items: Observable<[SuperHeroEntity]> = self.itemsVariable.asObservable()

    // MARK: - Private
    private let bag = DisposeBag()
    private let router: SuperHeroListRouterType
    private let getSuperHerosUseCase: GetSuperHeroListUseCase

    // MARK: - Init
    
    init(router: SuperHeroListRouterType,
         getSuperHerosUseCase: GetSuperHeroListUseCase) {
        
        self.router = router
        self.getSuperHerosUseCase = getSuperHerosUseCase
        super.init(router: router)
    }
    
    // MARK: - Setup
    
    override func reload() {
        super.reload()
        
        getSuperHerosUseCase.execute()
            .subscribe(onNext:{ [weak self] superHeros in
                guard let strongSelf = self, let superHeros = superHeros else { return }
                
                strongSelf.itemsVariable.value = superHeros.items
                },
                       onError: { error in
                        print(error)
            })
            .disposed(by:bag)
    }
    
    func getViewModelForCell(indexPath: IndexPath)-> SuperHeroCellViewModelType {
        let superHero = itemsVariable.value[indexPath.row]
        return SuperHeroCellViewModel(superHero: superHero)
    }

    func didSelectItem(indexPath: IndexPath) {
        let superHero = itemsVariable.value[indexPath.row]
        router.navigateTo(superHero: superHero)
    }
}


