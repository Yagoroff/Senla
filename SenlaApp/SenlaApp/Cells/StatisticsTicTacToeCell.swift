import Foundation
import UIKit

final class StatisticsTicTacToeCell: UICollectionViewCell {
    
    static let reuseId: String = "StatisticsCell"
    
    private let winningPercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    private let playerImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)))
        image.tintColor = .black
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
        contentView.addSubview(winningPercentage)
        contentView.addSubview(playerImage)
        
        nameOfGame.translatesAutoresizingMaskIntoConstraints = false
        winningPercentage.translatesAutoresizingMaskIntoConstraints = false
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameOfGame.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameOfGame.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            playerImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playerImage.topAnchor.constraint(equalTo: nameOfGame.bottomAnchor, constant: 20),
            
            winningPercentage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            winningPercentage.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 20)
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
