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

class DatumTableViewCell: UITableViewCell {

    fileprivate let disposeBag = DisposeBag()
    lazy var config: UIListContentConfiguration = {
        var config = self.defaultContentConfiguration()
        config.image = UIImage(named: "placeholder")
        config.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        config.imageProperties.reservedLayoutSize = CGSize(width: 60, height: 60)
        return config
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewModel.asDriver().drive(onNext: {[weak self] viewModel in
            guard let viewModel = viewModel else {return}

            // image
            if let url = viewModel.imageURl() {
                DispatchQueue.main.async {
                    if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                        self?.config.image = cachedImage as? UIImage
                        return
                    }
                }
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    guard let data = data else {
                        return
                    }
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        self?.config.attributedText = self?.viewModel.value?.text()
                        self?.config.secondaryAttributedText = self?.viewModel.value?.secondaryText()
                        self?.config.image = image
                        DispatchQueue.main.async {
                            self?.layoutSubviews()
                        }
                    }
                }
                task.resume()
            }

            self?.config.attributedText = viewModel.text()
            self?.config.secondaryAttributedText = viewModel.secondaryText()

            self?.contentConfiguration = self?.config
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
