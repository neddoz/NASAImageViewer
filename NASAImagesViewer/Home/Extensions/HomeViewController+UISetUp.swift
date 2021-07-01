//
//  HomeViewController+UISetUp.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import UIKit

extension HomeViewController {
    
    func setUpUI() {
        view.backgroundColor = .white
        title = "The Milky Way"
        view.addSubview(tableView)
        tableView.backgroundView = activityIndicator
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(DatumTableViewCell.self, forCellReuseIdentifier: DatumTableViewCell.reuseIdentifier)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: DatumTableViewCell.reuseIdentifier,
                                     for: indexPath) as? DatumTableViewCell, let viewModel = viewModel else {
            return UITableViewCell()
        }
        let datumViewModel = DatumCellViewModel(datum: viewModel.item(for: indexPath.row))
        cell.configure(with: datumViewModel)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {return}
        let item = viewModel.item(for: indexPath.row)
        if let datum = item.data.first,
           let urString = item.links.first?.href.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urString) {
            AppRouter.shared.presentImageDetailViewController(for: datum, imageURL: url)
        }
    }
}
