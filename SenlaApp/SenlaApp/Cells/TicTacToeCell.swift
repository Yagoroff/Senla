import Foundation
import UIKit

class TicTacToeCell: UICollectionViewCell {
    
    static var reuseId: String = "TicTacToeCell"
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    var playerImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)))
        return image
    }()
    
    var computerImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)))
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
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
    
    
    func configure(result: String) {
        resultLabel.text = result
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
