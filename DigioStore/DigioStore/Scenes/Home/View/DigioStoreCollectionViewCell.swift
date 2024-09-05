//
//  ProductCollectionCell.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import UIKit

class DigioStoreCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with urlString: String, isProduct: Bool = false) {
        imageView.loadImage(from: urlString)
        if isProduct {
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
                imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
            ])
        }
    }
}

extension DigioStoreCollectionViewCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func setupStyles() {
        // Add rounded corners and shadow
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0

        // set the cornerRadius of the containerView's layer
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true

    }
}
