import UIKit

class CalculatorViewController: UIViewController {
    
    lazy var stackViewFirstLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonDelete, buttonInversion, buttonPercent, buttonDivide])
        return stack
    } ()
    
    lazy var stackViewSecondLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonSeven, buttonEight, buttonNine, buttonMultiply])
        return stack
    } ()
    
    lazy var stackViewThirdLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonFour, buttonFive, buttonSix, buttonMinus])
        return stack
    } ()
    
    lazy var stackViewFourthLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonOne, buttonTwo, buttonThree, buttonPlus])
        return stack
    } ()
    
    lazy var stackViewFifthLine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonZero, buttonComma, buttonEqually])
        return stack
    } ()
    
    lazy var buttonDelete: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("C", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonInversion: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.forwardslash.minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonPercent: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "percent", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonDivide: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "divide", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonSeven: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("7", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonEight: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("8", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonNine: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("9", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonMultiply: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonFour: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("4", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonFive: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("5", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonSix: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("6", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonMinus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("3", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonPlus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonZero: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonComma: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(",", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        return button
    } ()
    
    lazy var buttonEqually: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "equal", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
    }
}

extension CalculatorViewController {
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(stackViewFirstLine)
        view.addSubview(stackViewSecondLine)
        view.addSubview(stackViewThirdLine)
        view.addSubview(stackViewFourthLine)
        view.addSubview(stackViewFifthLine)
    }
    
    func makeConstraints() {
        stackViewFirstLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewFirstLine.axis = .horizontal
        stackViewFirstLine.spacing = 10
        stackViewFirstLine.distribution = .fillEqually
        
        stackViewSecondLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewSecondLine.axis = .horizontal
        stackViewSecondLine.spacing = 10
        stackViewSecondLine.distribution = .fillEqually
        
        stackViewThirdLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewThirdLine.axis = .horizontal
        stackViewThirdLine.spacing = 10
        stackViewThirdLine.distribution = .fillEqually
        
        stackViewFourthLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewFourthLine.axis = .horizontal
        stackViewFourthLine.spacing = 10
        stackViewFourthLine.distribution = .fillEqually
        
        stackViewFifthLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewFifthLine.axis = .horizontal
        stackViewFifthLine.spacing = 10
        stackViewFifthLine.distribution = .fillEqually
    
        NSLayoutConstraint.activate([
            stackViewFifthLine.widthAnchor.constraint(equalTo: view.widthAnchor, constant:  -50),
            stackViewFifthLine.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackViewFifthLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewFifthLine.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonZero.widthAnchor.constraint(equalTo: stackViewFifthLine.widthAnchor, multiplier: 0.485),
            buttonComma.widthAnchor.constraint(equalTo: stackViewFifthLine.widthAnchor, multiplier: 0.23),
            buttonEqually.widthAnchor.constraint(equalTo: stackViewFifthLine.widthAnchor, multiplier: 0.23),

            
            stackViewFourthLine.widthAnchor.constraint(equalTo: view.widthAnchor, constant:  -50),
            stackViewFourthLine.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackViewFourthLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewFourthLine.bottomAnchor.constraint(equalTo: stackViewFifthLine.topAnchor, constant: -10),
            
            stackViewThirdLine.widthAnchor.constraint(equalTo: view.widthAnchor, constant:  -50),
            stackViewThirdLine.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackViewThirdLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewThirdLine.bottomAnchor.constraint(equalTo: stackViewFourthLine.topAnchor, constant: -10),
            
            stackViewSecondLine.widthAnchor.constraint(equalTo: view.widthAnchor, constant:  -50),
            stackViewSecondLine.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackViewSecondLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewSecondLine.bottomAnchor.constraint(equalTo: stackViewThirdLine.topAnchor, constant: -10),
            
            stackViewFirstLine.widthAnchor.constraint(equalTo: view.widthAnchor, constant:  -50),
            stackViewFirstLine.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackViewFirstLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewFirstLine.bottomAnchor.constraint(equalTo: stackViewSecondLine.topAnchor, constant: -10)
        ])
    }
}
