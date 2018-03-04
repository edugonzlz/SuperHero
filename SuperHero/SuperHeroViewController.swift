import UIKit
import RxSwift
import RxCocoa

class SuperHeroViewController: ViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dataStackView: UIStackView!

    // MARK: - Private
    private let viewModel: SuperHeroViewModelType
    
    // MARK: - Init
    
    init(viewModel: SuperHeroViewModelType) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit SuperHeroViewController")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
        setupViews()
        viewModel.reload()
    }
    
    // MARK: Setup
    
    private func setupViews() {
        
    }
    
    private func setupRx() {
        viewModel.image
            .subscribe(onNext: {[weak self] urlString in
                guard let strongSelf = self else  { return }
                
                if let url = URL(string: urlString) {
                    strongSelf.imageView.setImage(withURL: url)
                }
            })
            .disposed(by:self.bag)
    }
}

