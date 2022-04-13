import UIKit

class HistoryViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case RockPaperScissors, TicTacToe
    }
    
    var buttonUpdate: UIButton = {
        let button = UIButton()
        button.setTitle("Обновить", for: .normal)
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(updateDataSource(_:)), for: .touchUpInside)
        return button
    }()
    
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupView()
    }
}


extension HistoryViewController {
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.register(RockPaperScissorsCell.self, forCellWithReuseIdentifier: RockPaperScissorsCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupView() {
        view.addSubview(collectionView)
        view.addSubview(buttonUpdate)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        buttonUpdate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            buttonUpdate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonUpdate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonUpdate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    @objc func updateDataSource(_ sender: UIButton) {
        collectionView.reloadData()
    }
}

extension HistoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyOfRockPaperScissors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RockPaperScissorsCell.identifier, for: indexPath) as? RockPaperScissorsCell else { fatalError() }
        cell.configure(result: historyOfRockPaperScissors[indexPath.row].result, playerImage: historyOfRockPaperScissors[indexPath.row].imagePlayer, computerImage: historyOfRockPaperScissors[indexPath.row].imageComputer)
        
        return cell
    }
}
