//
//  ImageDetailViewController+UI+Extension.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 29/06/2021.
//

import UIKit

extension ImageDetailViewController {
    
    func setUpUI() {
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill

        // Imageview
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        titlesContainerView.addArrangedSubview(titleLabel)
        titlesContainerView.addArrangedSubview(subTitleLabelLabel)
        titlesContainerView.addBackground(color: .white)
        view.addSubview(titlesContainerView)
        titlesContainerView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titlesContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        titlesContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        titlesContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        contentContainerView.addArrangedSubview(contentLabel)
        contentContainerView.addBackground(color: .white)
        view.addSubview(contentContainerView)
        contentContainerView.topAnchor.constraint(equalTo: titlesContainerView.bottomAnchor).isActive = true
        contentContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        contentContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
