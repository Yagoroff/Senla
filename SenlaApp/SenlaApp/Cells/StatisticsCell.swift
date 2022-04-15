import Foundation
import UIKit

final class StatisticsTicTacToeCell: UICollectionViewCell {
    
    static var reuseId: String = "StatisticsCell"
    
    var winningPercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    var playerImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)))
        image.tintColor = .black
        return image
    }()
    
    var nameOfGame: UILabel = {
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
        
        [nameOfGame, winningPercentage, playerImage].forEach({
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            nameOfGame.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameOfGame.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            playerImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playerImage.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant: 10),
            
            winningPercentage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            winningPercentage.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10)
        ])
    }

    func configure(name: String, percent: String) {
        nameOfGame.text = name
        winningPercentage.text = percent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class StatisticsRockPaperScissorsCell: UICollectionViewCell {
    
    static var reuseId: String = "StatisticsRockPaperScissorsCell"
    
    var winByRock: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    var winByPaper: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    var winByScissors: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    var imageRock: UIImageView = {
        let image = UIImageView(image: UIImage(named: "rock"))
        return image
    }()
    
    var imagePaper: UIImageView = {
        let image = UIImageView(image: UIImage(named: "paper"))
        return image
    }()
    
    var imageScissors: UIImageView = {
        let image = UIImageView(image: UIImage(named: "scissors"))
        return image
    }()
    
    var nameOfGame: UILabel = {
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
        
        [nameOfGame, imageRock, imagePaper, imageScissors, winByRock, winByPaper, winByScissors].forEach({
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            nameOfGame.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameOfGame.topAnchor.constraint(equalTo: contentView.topAnchor),
        
            imageRock.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            imageRock.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant:  10),
            winByRock.topAnchor.constraint(equalTo: imageRock.bottomAnchor, constant: 10),
            winByRock.centerXAnchor.constraint(equalTo: imageRock.centerXAnchor),
            
            imagePaper.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagePaper.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant: 10),
            winByPaper.topAnchor.constraint(equalTo: imagePaper.bottomAnchor, constant: 10),
            winByPaper.centerXAnchor.constraint(equalTo: imagePaper.centerXAnchor),
            
            imageScissors.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            imageScissors.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant: 10),
            winByScissors.topAnchor.constraint(equalTo: imageScissors.bottomAnchor, constant: 10),
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

