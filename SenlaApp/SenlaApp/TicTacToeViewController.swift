import UIKit

class TicTacToeViewController: UIViewController {
        
    lazy var arrayForCoordinates: [UIButton] = [buttonWithCoordsOneOne, buttonWithCoordsOneTwo, buttonWithCoordsOneThree, buttonWithCoordsTwoOne, buttonWithCoordsTwoTwo, buttonWithCoordsTwoThree, buttonWithCoordsThreeOne, buttonWithCoordsThreeTwo, buttonWithCoordsThreeThree]
    
    var matrix = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    var winningVersions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var playersFields: Array<Int> = []

    var computerFields: Array<Int> = []
    
    lazy var textResult: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.text = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    } ()
    
    lazy var buttonRetry: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RETRY", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(buttonActionRetry(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var stackViewFirstLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonWithCoordsOneOne, buttonWithCoordsOneTwo, buttonWithCoordsOneThree])
        return stack
    } ()
    
    lazy var stackViewSecondLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonWithCoordsTwoOne, buttonWithCoordsTwoTwo, buttonWithCoordsTwoThree])
        return stack
    } ()
    
    lazy var stackViewThirdLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonWithCoordsThreeOne, buttonWithCoordsThreeTwo, buttonWithCoordsThreeThree])
        return stack
    } ()
    
    lazy var buttonWithCoordsOneOne: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsOneTwo: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsOneThree: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsTwoOne: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsTwoTwo: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsTwoThree: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsThreeOne: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsThreeTwo: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonWithCoordsThreeThree: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
    }
}

extension TicTacToeViewController {
    
    func setupView() {
        title = "TicTacToe"
        view.backgroundColor = .white
        view.addSubview(stackViewFirstLine)
        view.addSubview(stackViewSecondLine)
        view.addSubview(stackViewThirdLine)
        view.addSubview(textResult)
        view.addSubview(buttonRetry)
        textResult.isHidden = true
        buttonRetry.isHidden = true
    }
    
    func makeConstraints() {
        stackViewFirstLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewFirstLine.axis = .horizontal
        stackViewFirstLine.distribution = .fillEqually

        stackViewSecondLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewSecondLine.axis = .horizontal
        stackViewSecondLine.distribution = .fillEqually
        
        stackViewThirdLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewThirdLine.axis = .horizontal
        stackViewThirdLine.distribution = .fillEqually
        
        textResult.translatesAutoresizingMaskIntoConstraints = false
        buttonRetry.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonWithCoordsOneOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsOneTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsOneThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsTwoOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsTwoTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsTwoThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsThreeOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsThreeTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            buttonWithCoordsThreeThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
            buttonWithCoordsOneOne.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsOneTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsOneThree.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsTwoOne.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsTwoTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsTwoThree.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsThreeOne.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsThreeTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            buttonWithCoordsThreeThree.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),

            stackViewFirstLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewFirstLine.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackViewSecondLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewSecondLine.topAnchor.constraint(equalTo: stackViewFirstLine.bottomAnchor),
            stackViewThirdLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewThirdLine.topAnchor.constraint(equalTo: stackViewSecondLine.bottomAnchor),
            
            textResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textResult.topAnchor.constraint(equalTo: stackViewThirdLine.bottomAnchor, constant: 20),
            
            buttonRetry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRetry.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonRetry.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            buttonRetry.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
    }
    
    @objc func buttonActionRetry(_ sender: UIButton!){
        textResult.text = nil
        textResult.isHidden = true
        buttonRetry.isHidden = true
        matrix = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        playersFields = []
        computerFields = []

        for buttons in arrayForCoordinates {
            resetButtons(button: buttons)
            buttons.isEnabled = true
        }
    }
    
    @objc func buttonActionCoords(_ sender: UIButton!) {
        let coords = arrayForCoordinates.firstIndex(of: sender)
        playersFields.append(coords!)
        matrix.remove(at: matrix.firstIndex(of: coords!)!)
        sender.isEnabled = false
        setCross(button: sender)
        if checkingForTheWinnerPlayer() == true {
            return
        }

        guard matrix.isEmpty == false else {
            if textResult.text.isEmpty {
                isDraw()
            }
            return
        }
        
        computerChoice()
    }
    
    func computerChoice() {
        let randCoords = matrix.randomElement()
        computerFields.append(randCoords!)
        matrix.remove(at: matrix.firstIndex(of: randCoords!)!)
        arrayForCoordinates[randCoords!].isEnabled = false
        setZero(button: arrayForCoordinates[randCoords!])
        checkingForTheWinnerComputer()
        
    }
    
    func checkingForTheWinnerPlayer()  -> Bool {
        var findWinVersionPlayer = false
        
        for vers in winningVersions {
            for coords in vers {
                if playersFields.contains(coords) {
                    findWinVersionPlayer = true
                } else {
                    findWinVersionPlayer = false
                    break
                }
            }
            if findWinVersionPlayer {
                textResult.text = "PLAYER WIN"
                textResult.isHidden = false
                buttonRetry.isHidden = false
                for buttons in arrayForCoordinates {
                    buttons.isEnabled = false
                }
                return true
            }
        }
        return false
    }
    
    func checkingForTheWinnerComputer(){
        var findWinVersionComputer = false

        for vers in winningVersions {
            for coords in vers {
                if computerFields.contains(coords) {
                    findWinVersionComputer = true
                } else {
                    findWinVersionComputer = false
                    break
                }
            }
            if findWinVersionComputer {
                textResult.text = "COMPUTER WIN"
                textResult.isHidden = false
                buttonRetry.isHidden = false
                for buttons in arrayForCoordinates {
                    buttons.isEnabled = false
                }
                return
            }
        }
        
        return
    }
    
    func isDraw() {
        textResult.text = "DRAW"
        textResult.isHidden = false
        buttonRetry.isHidden = false
    }
    
    func setCross(button: UIButton) {
        button.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        button.imageView?.tintColor = .black
    }
    
    func setZero(button: UIButton) {
        button.setImage(UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        button.imageView?.tintColor = .black
    }
    
    func resetButtons(button: UIButton) {
        button.setImage(nil, for: .normal)
    }
}
