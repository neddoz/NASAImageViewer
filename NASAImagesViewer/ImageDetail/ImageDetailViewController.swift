//
//  ImageDetailViewController.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 29/06/2021.
//

import UIKit

class ImageDetailViewController: UIViewController {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let subTitleLabelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titlesContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let contentLabel: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = .systemFont(ofSize: 40)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let contentContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let viewModel: ImageDetailViewModel

    init(viewModel: ImageDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func bindData() {
        
        // imageView
        if let url = viewModel.url() {
            imageView.loadImage(from: url)
        }

        titleLabel.text = viewModel.title()
        subTitleLabelLabel.text = viewModel.subTitle()
        
        // content view
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        contentLabel.attributedText = NSAttributedString(string: viewModel.content(), attributes: attributes)
    }
}
