import UIKit
import RxSwift

class SuperHeroCollectionViewCell: UICollectionViewCell {

    static let cellId = String(describing: SuperHeroCollectionViewCell.self)
    static let height:CGFloat = 240
    static let width:CGFloat = 140.0
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    fileprivate var viewModel: SuperHeroCellViewModelType?
    
    private var bag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
        bag = DisposeBag()
        image.cancelRequest()
        image.image = nil
    }
    
    func configure(viewModel: SuperHeroCellViewModelType) {
        self.viewModel = viewModel
        setupRx()
        applyStyle()
    }

    
    func applyStyle() {
        infoView.style(.shadowCromoView)
    }
    
    func setupRx() {
        guard let viewModel = self.viewModel else { return }
    
        viewModel.name
        .bind(to: name.rx.text)
        .disposed(by: bag)
        
        viewModel.image
            .subscribe(onNext: {[weak self] urlString in
                guard let strongSelf = self else  { return }
                
                if let url = URL(string: urlString) {
                    strongSelf.image.setImage(withURL: url)
                }
            })
            .disposed(by:self.bag)
    }
}
