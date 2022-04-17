//
//  SectionBackgroundDecorationView.swift
//  SenlaApp
//
//  Created by Игорь Ходжгоров on 17.04.2022.
//

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension SectionBackgroundDecorationView {
    func configure() {
        backgroundColor = .white
        layer.cornerRadius = 12
    }
}
