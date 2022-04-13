//
//  HistoryCell.swift
//  SenlaApp
//
//  Created by Игорь Ходжгоров on 13.04.2022.
//

import UIKit

class RockPaperScissorsCell: UICollectionViewCell {
    
    static let identifier = "HistoryCell"
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    var playerImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var computerImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [resultLabel, playerImage, computerImage].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            playerImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -15),
            playerImage.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -15),
            playerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            playerImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            computerImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -15),
            computerImage.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -15),
            computerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            computerImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resultLabel.text = nil
        playerImage.image = nil
        computerImage.image = nil
    }
    
    func configure(result: String, playerImage: UIImage, computerImage: UIImage) {
        resultLabel.text = result
        self.playerImage.image = playerImage
        self.computerImage.image = computerImage
    }
}
