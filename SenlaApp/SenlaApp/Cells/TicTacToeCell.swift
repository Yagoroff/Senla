import Foundation
import UIKit

final class TicTacToeCell: UICollectionViewCell {
    
    static let reuseId: String = "TicTacToeCell"
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .thin)
        return label
    }()
    
    private let playerImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)))
        image.tintColor = .black
        return image
    }()
    
    private let computerImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)))
        image.tintColor = .black
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    private func setupCell() {
        contentView.addSubview(resultLabel)
        contentView.addSubview(playerImage)
        contentView.addSubview(computerImage)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        computerImage.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    
    func configure(result: String) {
        resultLabel.text = result
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
