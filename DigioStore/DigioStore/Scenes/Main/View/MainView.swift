//
//  MainView.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import UIKit

class MainView: UIView {

    private var appLogo: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "AppLogo"))
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

}

extension MainView: ViewCode {
    func buildHierarchy() {
        addSubview(appLogo)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.appLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.appLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.appLogo.heightAnchor.constraint(equalToConstant: 200),
            self.appLogo.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func setupStyles() {
        self.backgroundColor = .white
    }
}
