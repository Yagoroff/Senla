import UIKit

class ViewController: UIViewController {
    
    static let sectionBackground = "background"

    enum Section: Int, CaseIterable {
        case statistics, rockPaperScissors, ticTacToe
    }
    
    var buttonUpdate: UIButton = {
        let button = UIButton()
        button.setTitle("ОБНОВИТЬ", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
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


extension ViewController {
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGray6
        collectionView.register(RockPaperScissorsCell.self, forCellWithReuseIdentifier: RockPaperScissorsCell.reuseId)
        collectionView.register(TicTacToeCell.self, forCellWithReuseIdentifier: TicTacToeCell.reuseId)
        collectionView.register(StatisticsTicTacToeCell.self, forCellWithReuseIdentifier: StatisticsTicTacToeCell.reuseId)
        collectionView.register(StatisticsRockPaperScissorsCell.self, forCellWithReuseIdentifier: StatisticsRockPaperScissorsCell.reuseId)

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
            buttonUpdate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            let section = Section(rawValue: sectionIndex)!
            switch section {
            case .rockPaperScissors:
                return self.createSectionForGames()
            case .ticTacToe:
                return self.createSectionForGames()
            case .statistics:
                return self.createSectionForStatistics()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 25
        layout.configuration = config
        layout.register(
            SectionBackgroundDecorationView.self,
            forDecorationViewOfKind: ViewController.sectionBackground)
        return layout
    }
    
    private func createSectionForGames() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: ViewController.sectionBackground)
        sectionBackground.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.decorationItems = [sectionBackground]
    
        return section
    }
    
    private func createSectionForStatistics() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: ViewController.sectionBackground)
        sectionBackground.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.decorationItems = [sectionBackground]
        
        return section
    }
    
    @objc func updateDataSource(_ sender: UIButton) {
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = Section(rawValue: section)
        switch section {
        case .rockPaperScissors:
            return historyOfRockPaperScissors.count
        case .ticTacToe:
            return historyOfTicTacToe.count
        case .statistics:
            return 2
        case .none:
            print("ZERO")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = Section(rawValue: indexPath.section)
        switch section {
        case .rockPaperScissors:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RockPaperScissorsCell.reuseId, for: indexPath) as? RockPaperScissorsCell else { fatalError() }
            cell.configure(result: historyOfRockPaperScissors[indexPath.row].result, playerImage: historyOfRockPaperScissors[indexPath.row].imagePlayer, computerImage: historyOfRockPaperScissors[indexPath.row].imageComputer)
            
            return cell
        case .ticTacToe:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicTacToeCell.reuseId, for: indexPath) as? TicTacToeCell else { fatalError() }
            cell.configure(result: historyOfTicTacToe[indexPath.row].result)
            
            return cell
        case .statistics:
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatisticsTicTacToeCell.reuseId, for: indexPath) as? StatisticsTicTacToeCell else { fatalError() }

                guard countOfGamesInTicTacToe != 0 else {
                    cell.configure(name: "Крестики-Нолики", percent: "Вы еще не играли в Крестики-Нолики")
                    return cell
                }
                let percent = String(floor((Double(countOfWinInTicTacToe) / Double(countOfGamesInTicTacToe) * 100))) + "% побед"
                
                cell.configure(name: "Крестики-Нолики", percent: percent)
                
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatisticsRockPaperScissorsCell.reuseId, for: indexPath) as? StatisticsRockPaperScissorsCell else { fatalError() }
                
                guard countOfGamesInRockPaperScissors != 0 else {
                    cell.configure(name: "Камень-Ножницы-Бумага", percentForRock: "Не было игр", percentForPaper: "Не было игр", pecentForScissors: "Не было игр")
                    return cell
                }
                
                var percentWinWithRock = String(floor((Double(countOfWinByRock) / Double(countOfPickRock) * 100))) + "% побед"
                var percentWinWithScissors = String(floor((Double(countOfWinByScissors) / Double(countOfPickScissors) * 100))) + "% побед"
                var percentWinWithPaper = String(floor((Double(countOfWinByPaper) / Double(countOfPickPaper) * 100))) + "% побед"
                
                if percentWinWithRock == "nan% побед" {
                    percentWinWithRock = "Не было игр"
                } else if percentWinWithPaper == "nan% побед" {
                    percentWinWithPaper = "Не было игр"
                } else if percentWinWithScissors == "nan% побед" {
                    percentWinWithScissors = "Не было игр"
                }
                
                cell.configure(name: "Камень-Ножницы-Бумага", percentForRock: percentWinWithRock, percentForPaper: percentWinWithPaper, pecentForScissors: percentWinWithScissors)
                
                return cell
            }
        case .none:
            print("error")
            return UICollectionViewCell()
        }
    }
}
