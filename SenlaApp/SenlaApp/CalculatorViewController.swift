import UIKit

class CalculatorViewController: UIViewController {
    
    lazy var firstNumber: Double = 0
    lazy var secondNumber: Double = 0
    lazy var resultNumberInteger: Int = 0
    lazy var currentOperation: Operations = .nothing
    
    enum Operations {
        case nothing, plus, minus, multi, divide
    }
    
    lazy var arrayOfNumbers = [buttonZero, buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine]
    
    lazy var textForCalculating: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.boldSystemFont(ofSize: 54)
        textView.text = "0"
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.textAlignment = .right
        textView.adjustsFontSizeToFitWidth = true
        textView.minimumScaleFactor = 0.2
        
        return textView
    } ()
    
    lazy var stackViewGeneral: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [textForCalculating, stackViewFirstLine, stackViewSecondLine, stackViewThirdLine, stackViewFourthLine, stackViewFifthLine])
        return stack
    } ()
    
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
    
    lazy var buttonZero: UIButton = setDefaultButtonNumbers("0")
    lazy var buttonOne: UIButton = setDefaultButtonNumbers("1")
    lazy var buttonTwo: UIButton = setDefaultButtonNumbers("2")
    lazy var buttonThree: UIButton = setDefaultButtonNumbers("3")
    lazy var buttonFour: UIButton = setDefaultButtonNumbers("4")
    lazy var buttonFive: UIButton = setDefaultButtonNumbers("5")
    lazy var buttonSix: UIButton = setDefaultButtonNumbers("6")
    lazy var buttonSeven: UIButton = setDefaultButtonNumbers("7")
    lazy var buttonEight: UIButton = setDefaultButtonNumbers("8")
    lazy var buttonNine: UIButton = setDefaultButtonNumbers("9")
    
    lazy var buttonDelete: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("C", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionDelete(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonInversion: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.forwardslash.minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionInversion(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonPercent: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "percent", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionProcent(_:)), for: .touchUpInside)

        return button
    } ()
    
    lazy var buttonDivide: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "divide", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionDivide(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonMultiply: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionMultiply(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonMinus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionMinus(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonPlus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionPlus(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonComma: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(",", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionComma(_:)), for: .touchUpInside)
        return button
    } ()
    
    lazy var buttonEqually: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "equal", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: UIImage.SymbolWeight.bold)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionEqually(_:)), for: .touchUpInside)
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
        view.addSubview(stackViewGeneral)
    }
    
    func makeConstraints() {

        stackViewGeneral.translatesAutoresizingMaskIntoConstraints = false
        stackViewGeneral.axis = .vertical
        stackViewGeneral.spacing = 10
        stackViewGeneral.distribution = .fillEqually
        
        setDefaultSettingsForStackView([stackViewFifthLine,stackViewFourthLine, stackViewThirdLine, stackViewSecondLine, stackViewFirstLine])
   
        NSLayoutConstraint.activate([
            stackViewGeneral.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewGeneral.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            textForCalculating.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
            textForCalculating.trailingAnchor.constraint(equalTo: stackViewGeneral.trailingAnchor),
            
            stackViewFifthLine.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            stackViewFifthLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonZero.widthAnchor.constraint(equalTo: stackViewFifthLine.widthAnchor, multiplier: 0.485),
            buttonComma.widthAnchor.constraint(equalTo: stackViewFifthLine.widthAnchor, multiplier: 0.23),
            buttonEqually.widthAnchor.constraint(equalTo: stackViewFifthLine.widthAnchor, multiplier: 0.23)
        ])
    }
    
    func setDefaultSettingsForStackView(_ stacks: [UIStackView?]) {
        for stack in stacks {
            stack!.translatesAutoresizingMaskIntoConstraints = false
            stack!.axis = .horizontal
            stack!.spacing = 10
            stack!.distribution = .fillEqually
        }
    }
    
    func setDefaultButtonNumbers(_ name: String) -> UIButton! {
        let button = UIButton(type: .system)
        button.setTitle(name, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 37
        button.addTarget(self, action: #selector(buttonActionNumber(_:)), for: .touchUpInside)
        return button
    }
    
    func operationDefinition() {
        switch currentOperation {
        case .plus:
            firstNumber += secondNumber
        case .minus:
            firstNumber -= secondNumber
        case .multi:
            firstNumber *= secondNumber
        case .divide:
            firstNumber /= secondNumber
        default:
            break
        }
        textForCalculating.text = String(firstNumber)
    }
    
    @objc func buttonActionDelete(_ sender: UIButton!) {
        textForCalculating.text = "0"
        firstNumber = 0
        secondNumber = 0
        currentOperation = .nothing
    }
    
    @objc func buttonActionNumber(_ sender: UIButton!) {
        let number = arrayOfNumbers.firstIndex(of: sender)!
        
        if textForCalculating.text == "0" {
            textForCalculating.text = String(number)
        } else {
            textForCalculating.text! += String(number)
        }
        
        if currentOperation == .nothing {
            firstNumber = Double(textForCalculating.text!)!
        } else {
            secondNumber = Double(textForCalculating.text!)!
        }
    }
    
    @objc func buttonActionPlus(_ sender: UIButton!) {
        operationDefinition()
        textForCalculating.text = "0"
        currentOperation = .plus
    }
    
    @objc func buttonActionMinus(_ sender: UIButton!) {
        operationDefinition()
        textForCalculating.text = "0"
        currentOperation = .minus
    }
    
    @objc func buttonActionMultiply(_ sender: UIButton!) {
        operationDefinition()
        textForCalculating.text = "0"
        currentOperation = .multi
    }
    
    @objc func buttonActionDivide(_ sender: UIButton!) {
        operationDefinition()
        textForCalculating.text = "0"
        currentOperation = .divide
    }
    
    @objc func buttonActionInversion(_ sender: UIButton!) {
        firstNumber = -firstNumber
        if firstNumber.truncatingRemainder(dividingBy: 1) == 0.0 {
            resultNumberInteger = Int(floor(firstNumber))
            textForCalculating.text = String(resultNumberInteger)
        } else {
            textForCalculating.text = String(firstNumber)
        }
    }
    
    @objc func buttonActionProcent(_ sender: UIButton!) {
        firstNumber = firstNumber / 100
        if firstNumber.truncatingRemainder(dividingBy: 1) == 0.0 {
            resultNumberInteger = Int(floor(firstNumber))
            textForCalculating.text = String(resultNumberInteger)
        } else {
            textForCalculating.text = String(firstNumber)
        }
    }
    
    @objc func buttonActionComma(_ sender: UIButton!) {
        if textForCalculating.text!.contains(".") == false {
            textForCalculating.text! += "."
        }
    }
    
    @objc func buttonActionEqually(_ sender: UIButton!) {
        operationDefinition()
        currentOperation = .nothing
        if firstNumber.truncatingRemainder(dividingBy: 1) == 0.0 {
            resultNumberInteger = Int(floor(firstNumber))
            textForCalculating.text = String(resultNumberInteger)
        } else {
            textForCalculating.text = String(firstNumber)
        }
        secondNumber = 0
    }
}
