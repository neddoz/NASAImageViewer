//
//  HomeViewController.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    // Views
    
    let tableView = UITableView()
    let activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    // viewModel
    
    var viewModel: HomeViewModel? {
        didSet {
            bindViewModel()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModel = HomeViewModel()
    }
    
    fileprivate func bindViewModel() {
        guard isViewLoaded,
              let viewModel = viewModel else { return  }
        
        viewModel
            .isLoading
            .asDriver()
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)

        viewModel
            .items
            .asObservable().subscribe(onNext: { items in
                guard !items.isEmpty else {return}
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
}
