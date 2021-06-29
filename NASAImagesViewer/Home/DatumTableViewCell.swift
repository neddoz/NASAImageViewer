//
//  DatumTableViewCell.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - TODO build a good caching mechanism
var imageCache = NSCache<AnyObject, AnyObject>()

protocol DatumDelegateCell {
    func reload(at path: IndexPath)
}

class DatumTableViewCell: UITableViewCell {

    fileprivate let disposeBag = DisposeBag()
    var delegate: DatumDelegateCell?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewModel.asDriver().drive(onNext: {[weak self] viewModel in
            guard let viewModel = viewModel else {return}
            var config = self?.defaultContentConfiguration()
            config?.image = UIImage(named: "placeholder")
            config?.imageProperties.maximumSize = CGSize(width: 60, height: 60)
            config?.imageProperties.reservedLayoutSize = CGSize(width: 60, height: 60)

            // image
            if let url = viewModel.imageURl() {
                if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                    config?.image = cachedImage as? UIImage
                }
                DispatchQueue.global().async {
                    guard let data = try? Data(contentsOf: url),
                          let image = UIImage(data: data) else {return}
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        // TODO refactor to get rid of this delegate and make it self reload
                        self?.delegate?.reload(at: viewModel.indexPath)
                    }
                }
            }

            config?.text = viewModel.text()
            config?.secondaryText = viewModel.secondaryText()

            self?.contentConfiguration = config
        }).disposed(by: disposeBag)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: DatumCellViewModel) {
        self.viewModel.accept(viewModel)
    }

    // MARK: - Fileprivate methods

    fileprivate var viewModel = BehaviorRelay<DatumCellViewModel?>(value: nil)
}
