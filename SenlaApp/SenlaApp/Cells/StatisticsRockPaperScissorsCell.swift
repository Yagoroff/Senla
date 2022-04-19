import Foundation
import UIKit


final class StatisticsRockPaperScissorsCell: UICollectionViewCell {
    
    static let reuseId: String = "StatisticsRockPaperScissorsCell"
    
    private let winByRock: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    private let winByPaper: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    private let winByScissors: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    private let imageRock: UIImageView = {
        let image = UIImageView(image: UIImage(named: "rock"))
        return image
    }()
    
    private let imagePaper: UIImageView = {
        let image = UIImageView(image: UIImage(named: "paper"))
        return image
    }()
    
    private let imageScissors: UIImageView = {
        let image = UIImageView(image: UIImage(named: "scissors"))
        return image
    }()
    
    private let nameOfGame: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    private func setupCell() {
        contentView.addSubview(nameOfGame)
        contentView.addSubview(imageRock)
        contentView.addSubview(imagePaper)
        contentView.addSubview(imageScissors)
        contentView.addSubview(winByRock)
        contentView.addSubview(winByPaper)
        contentView.addSubview(winByScissors)
        
        nameOfGame.translatesAutoresizingMaskIntoConstraints = false
        imageRock.translatesAutoresizingMaskIntoConstraints = false
        imagePaper.translatesAutoresizingMaskIntoConstraints = false
        imageScissors.translatesAutoresizingMaskIntoConstraints = false
        winByRock.translatesAutoresizingMaskIntoConstraints = false
        winByPaper.translatesAutoresizingMaskIntoConstraints = false
        winByScissors.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameOfGame.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameOfGame.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        
            imageRock.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            imageRock.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant:  15),
            winByRock.topAnchor.constraint(equalTo: imageRock.bottomAnchor, constant: 20),
            winByRock.centerXAnchor.constraint(equalTo: imageRock.centerXAnchor),
            
            imagePaper.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagePaper.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant: 15),
            winByPaper.topAnchor.constraint(equalTo: imagePaper.bottomAnchor, constant: 20),
            winByPaper.centerXAnchor.constraint(equalTo: imagePaper.centerXAnchor),
            
            imageScissors.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            imageScissors.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant: 15),
            winByScissors.topAnchor.constraint(equalTo: imageScissors.bottomAnchor, constant: 20),
            winByScissors.centerXAnchor.constraint(equalTo: imageScissors.centerXAnchor)
        ])
    }

    func configure(name: String, percentForRock: String, percentForPaper: String, pecentForScissors: String) {
        nameOfGame.text = name
        winByRock.text = percentForRock
        winByPaper.text = percentForPaper
        winByScissors.text = pecentForScissors
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

