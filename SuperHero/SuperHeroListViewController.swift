import UIKit
import RxSwift
import RxCocoa

class SuperHeroListViewController: ViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            collectionView.register(UINib.init(nibName: SuperHeroCollectionViewCell.cellId, bundle: nil), forCellWithReuseIdentifier: SuperHeroCollectionViewCell.cellId)
            
            collectionView.backgroundColor = UIColor.white
            
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: SuperHeroCollectionViewCell.width, height: SuperHeroCollectionViewCell.height)
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = StyleConstant.generalMargin
            layout.minimumInteritemSpacing = StyleConstant.generalMargin
            
            layout.sectionInset = UIEdgeInsetsMake(StyleConstant.generalMargin,
                                                   StyleConstant.generalMargin,
                                                   StyleConstant.generalMargin,
                                                   StyleConstant.generalMargin)
            collectionView.collectionViewLayout = layout
        }
    }
    
    // MARK: - Private
    private let viewModel: SuperHeroListViewModelType
    
    // MARK: - Init
    
    init(viewModel: SuperHeroListViewModelType) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit SuperHeroListViewController")
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
        title = "Super Hero"
    }
    
    private func setupRx() {
        collectionView.rx
            .setDelegate(self)
            .disposed(by:bag)
        
        viewModel.items
            .bind(to: collectionView.rx
                .items(cellIdentifier: SuperHeroCollectionViewCell.cellId,
                       cellType: UICollectionViewCell.self)) { [weak self] row , category, cell in
                        guard let strongSelf = self,
                            let cell = cell as? SuperHeroCollectionViewCell else { return }
                        
                        let indexPath = IndexPath(item: row, section: 0)
                        cell.configure(viewModel: (strongSelf.viewModel.getViewModelForCell(indexPath:indexPath)))
            }
            .disposed(by:bag)
        
        collectionView.rx.itemSelected
            .throttle(1.0, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard let strongSelf = self else { return }
                
                strongSelf.viewModel.didSelectItem(indexPath: indexPath)
            }).disposed(by:bag)
    }
}

extension SuperHeroListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((collectionView.frame.size.width - (2.0 * 16)) - 16.0) / 2.0
        
        return CGSize(width: width, height: SuperHeroCollectionViewCell.height)
    }
}
