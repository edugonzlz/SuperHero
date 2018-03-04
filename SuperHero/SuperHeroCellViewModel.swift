import RxSwift

protocol SuperHeroCellViewModelType {
    var name: Observable<String> {get}
    var image: Observable<String> {get}
}

class SuperHeroCellViewModel: SuperHeroCellViewModelType {
    
    // MARK: - output
    lazy var name: Observable<String> = self.nameVariable.asObservable()
    lazy var image: Observable<String> = self.imageVariable.asObservable()
    
    // MARK: - input
    private var nameVariable: Variable<String> = Variable("")
    private var imageVariable: Variable<String> = Variable("")

    // MARK: - private
    private let bag = DisposeBag()
    
    init(superHero: SuperHeroEntity) {
        self.nameVariable.value = superHero.name
        self.imageVariable.value = superHero.photo
    }
}
