import UIKit

class TicTacToeViewController: UIViewController {
            
    lazy var stackViewFirstLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonWithCoordsOneOne, buttonWithCoordsOneTwo, buttonWithCoordsOneThree])
        stack.layer.opacity = 0
        return stack
    } ()
    
    lazy var stackViewSecondLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonWithCoordsTwoOne, buttonWithCoordsTwoTwo, buttonWithCoordsTwoThree])
        stack.layer.opacity = 0
        return stack
    } ()
    
    lazy var stackViewThirdLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonWithCoordsThreeOne, buttonWithCoordsThreeTwo, buttonWithCoordsThreeThree])
        stack.layer.opacity = 0
        return stack
    } ()
    
    lazy var arrayForCoordinates: [UIButton] = [buttonWithCoordsOneOne, buttonWithCoordsOneTwo, buttonWithCoordsOneThree, buttonWithCoordsTwoOne, buttonWithCoordsTwoTwo, buttonWithCoordsTwoThree, buttonWithCoordsThreeOne, buttonWithCoordsThreeTwo, buttonWithCoordsThreeThree]
    
    lazy var titleGame: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 60)
        textView.text = "TicTacToe"
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.layer.opacity = 0
        return textView
    } ()
    
    lazy var matrix = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    lazy var winningVersions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    lazy var playersFields: Array<Int> = []

    lazy var computerFields: Array<Int> = []
    
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
    
    lazy var buttonWithCoordsOneOne: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsOneTwo: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsOneThree: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsTwoOne: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsTwoTwo: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsTwoThree: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsThreeOne: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsThreeTwo: UIButton = createButtonsWithDefaultSetings()
    lazy var buttonWithCoordsThreeThree: UIButton = createButtonsWithDefaultSetings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
        animation()
    }
}

extension TicTacToeViewController {
    
    func setupView() {
        title = "TicTacToe"
        view.backgroundColor = .white
        view.addSubview(titleGame)
        view.addSubview(stackViewFirstLine)
        view.addSubview(stackViewSecondLine)
        view.addSubview(stackViewThirdLine)
        view.addSubview(textResult)
        view.addSubview(buttonRetry)
        textResult.isHidden = true
        buttonRetry.isHidden = true
    }
    
    func makeConstraints() {
        titleGame.translatesAutoresizingMaskIntoConstraints = false
        
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
            titleGame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleGame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            stackViewFirstLine.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackViewFirstLine.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            stackViewFirstLine.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 300),
            stackViewFirstLine.topAnchor.constraint(equalTo: titleGame.bottomAnchor),
            
            stackViewSecondLine.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackViewSecondLine.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            stackViewSecondLine.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -300),
            stackViewSecondLine.topAnchor.constraint(equalTo: stackViewFirstLine.bottomAnchor),
            
            stackViewThirdLine.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackViewThirdLine.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            stackViewThirdLine.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 300),
            stackViewThirdLine.topAnchor.constraint(equalTo: stackViewSecondLine.bottomAnchor),
            
            textResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textResult.topAnchor.constraint(equalTo: stackViewThirdLine.bottomAnchor, constant: 20),
            
            buttonRetry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRetry.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonRetry.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            buttonRetry.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
    }
    
    func createButtonsWithDefaultSetings() -> UIButton! {
        let button = UIButton()
        
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonActionCoords(_:)), for: .touchUpInside)
        
        return button
    }
    
    func animation() {
        UIView.animate(withDuration: 2, delay: 0.3, options: .curveEaseInOut, animations: { [self] in
            self.titleGame.layer.opacity = 1
            self.stackViewFirstLine.layer.opacity = 1
            self.stackViewSecondLine.layer.opacity = 1
            self.stackViewThirdLine.layer.opacity = 1
            self.stackViewFirstLine.transform.tx = -300
            self.stackViewSecondLine.transform.tx = 300
            self.stackViewThirdLine.transform.tx = -300
        })
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
