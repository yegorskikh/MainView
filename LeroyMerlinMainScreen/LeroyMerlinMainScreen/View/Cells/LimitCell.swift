//
//  LimitCell.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 20.04.2021.
//

import UIKit

final class LimitCell: UICollectionViewCell {
    
    var dataLimit: CustomDataLimit? {
        didSet {
            guard let data = dataLimit  else { return }
            imageView.backgroundColor = data.imageView
            saleLabel.attributedText = NSMutableAttributedString().bold(data.titleSale)
            //saleLabel.text = data.titleSale
            nameLabel.text = data.titleName
        }
    }
    
    fileprivate var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate var saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    fileprivate var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupAddSubview()
        setupCellConstraint()
        setupImageViewConstraint()
        setupLabelSaleConstraint()
        setupLabelNameConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddSubview() {
        contentView.addSubview(view)
        view.addSubview(imageView)
        view.addSubview(saleLabel)
        view.addSubview(nameLabel)
    }
    
    private func setupCellConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupImageViewConstraint() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupLabelSaleConstraint() {
        NSLayoutConstraint.activate([
            saleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant:5),
            saleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            saleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
        ])
    }
    
    private func setupLabelNameConstraint() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: saleLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
        ])
    }
    
}
