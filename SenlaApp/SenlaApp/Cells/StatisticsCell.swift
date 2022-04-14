import Foundation
import UIKit

class StatisticsCell: UICollectionViewCell {
    
    static var reuseId: String = "StatisticsCell"
    
    var winningPercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    private func setupCell() {
        contentView.addSubview(winningPercentage)
        winningPercentage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            winningPercentage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            winningPercentage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(percent: String) {
        winningPercentage.text = percent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

