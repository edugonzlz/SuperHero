import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private var viewModel: ViewModelType
    let bag = DisposeBag()
    
    // MARK: - Init
    
    init(viewModel: ViewModelType){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("INIT: \(self)")
    }
    
    deinit {
        print("DEINIT: \(self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
