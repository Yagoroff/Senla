import UIKit

class RockPaperScissorsViewController: UIViewController {    
    
    let settingViewController = SettingsViewController()
    
    lazy var randChoice = Int.random(in: 0...2)
    
    lazy var buttonRock: UIButton = createButton("rock")
    lazy var buttonPaper: UIButton = createButton("paper")
    lazy var buttonScissors: UIButton = createButton("scissors")

    lazy var imageRockUsers: UIImageView = createImage("rock")
    lazy var imagePaperUsers: UIImageView = createImage("paper")
    lazy var imageScissorsUsers: UIImageView = createImage("scissors")
    lazy var imageRockRandom: UIImageView = createImage("rock")
    lazy var imagePaperRandom: UIImageView = createImage("paper")
    lazy var imageScissorsRandom: UIImageView = createImage("scissors")
    
    private lazy var textResult: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    } ()
    
    lazy var stackViewItems: UIStackView = {
        let stack = UIStackView()
        stack.layer.opacity = 0

        return stack
    } ()
    
    private let buttonRetry: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("RETRY", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionRetry(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    private let buttonSettings: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gearshape", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)), for: .normal)
        button.imageView?.tintColor = .black
        button.tintColor = .black

        button.addTarget(self, action: #selector(buttonActionSettings(_:)), for: .touchUpInside)
        
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
        UIView.animate(withDuration: 1.2, delay: 0.6, options: .curveEaseInOut, animations: { [self] in
            self.stackViewItems.layer.opacity = 1
            self.buttonSettings.transform.tx = -70
        })
    }
}

private extension RockPaperScissorsViewController {
    func setupView() {
        view.backgroundColor = .white
        appendArrangedSubviews()
        view.addSubview(stackViewItems)
        view.addSubview(buttonSettings)
        view.addSubview(textResult)
        view.addSubview(buttonRetry)
        view.addSubview(imageRockRandom)
        view.addSubview(imagePaperRandom)
        view.addSubview(imageScissorsRandom)
        view.addSubview(imageRockUsers)
        view.addSubview(imagePaperUsers)
        view.addSubview(imageScissorsUsers)
        buttonRetry.isHidden = true
        imageRockRandom.isHidden = true
        imagePaperRandom.isHidden = true
        imageScissorsRandom.isHidden = true
        imageRockUsers.isHidden = true
        imagePaperUsers.isHidden = true
        imageScissorsUsers.isHidden = true
    }
    
    func appendArrangedSubviews() {
        stackViewItems.addArrangedSubview(buttonRock)
        stackViewItems.addArrangedSubview(buttonPaper)
        stackViewItems.addArrangedSubview(buttonScissors)
    }
    
    func makeConstraints() {
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        stackViewItems.translatesAutoresizingMaskIntoConstraints = false
        textResult.translatesAutoresizingMaskIntoConstraints = false
        buttonRetry.translatesAutoresizingMaskIntoConstraints = false
        imageRockRandom.translatesAutoresizingMaskIntoConstraints = false
        imagePaperRandom.translatesAutoresizingMaskIntoConstraints = false
        imageScissorsRandom.translatesAutoresizingMaskIntoConstraints = false
        imageScissorsUsers.translatesAutoresizingMaskIntoConstraints = false
        imagePaperUsers.translatesAutoresizingMaskIntoConstraints = false
        imageRockUsers.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewItems.axis = .horizontal
        stackViewItems.spacing = 50
        stackViewItems.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            buttonSettings.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50),
            buttonSettings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            stackViewItems.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewItems.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -150),
            
            textResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textResult.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            
            buttonRetry.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            buttonRetry.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            buttonRetry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRetry.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            imageRockRandom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageRockRandom.bottomAnchor.constraint(equalTo: textResult.topAnchor, constant: -140),
            imageRockRandom.widthAnchor.constraint(equalToConstant: 50),
            imageRockRandom.heightAnchor.constraint(equalToConstant: 50),
            
            imagePaperRandom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePaperRandom.bottomAnchor.constraint(equalTo: textResult.topAnchor, constant: -140),
            imagePaperRandom.widthAnchor.constraint(equalToConstant: 50),
            imagePaperRandom.heightAnchor.constraint(equalToConstant: 50),
            
            imageScissorsRandom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageScissorsRandom.bottomAnchor.constraint(equalTo: textResult.topAnchor, constant: -140),
            imageScissorsRandom.widthAnchor.constraint(equalToConstant: 50),
            imageScissorsRandom.heightAnchor.constraint(equalToConstant: 50),
            
            imageRockUsers.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageRockUsers.topAnchor.constraint(equalTo: textResult.bottomAnchor, constant: 140),
            imageRockUsers.widthAnchor.constraint(equalToConstant: 50),
            imageRockUsers.heightAnchor.constraint(equalToConstant: 50),
            
            imagePaperUsers.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePaperUsers.topAnchor.constraint(equalTo: textResult.bottomAnchor, constant: 140),
            imagePaperUsers.widthAnchor.constraint(equalToConstant: 50),
            imagePaperUsers.heightAnchor.constraint(equalToConstant: 50),
            
            imageScissorsUsers.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageScissorsUsers.topAnchor.constraint(equalTo: textResult.bottomAnchor, constant: 140),
            imageScissorsUsers.widthAnchor.constraint(equalToConstant: 50),
            imageScissorsUsers.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

    func createImage(_ name: String) -> UIImageView {
        let imageForReturn = UIImageView(image: UIImage(named: name))
        return imageForReturn
    }
    
    func createButton(_ name: String) -> UIButton {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: name), for: .normal)
        buttonForReturn.tintColor = .black

        buttonForReturn.addTarget(self, action: #selector(buttonActionPlay(_:)), for: .touchUpInside)
                
        return buttonForReturn
    }
    
    func switchLanguage() -> Array<String> {
        guard settingViewController.currentLanguage == "english" else {
            buttonRetry.setTitle("ПОВТОР", for: .normal)
            return ["НИЧЬЯ", "ПОБЕДА", "ПРОИГРЫШ"]
        }
        
        buttonRetry.setTitle("RETRY", for: .normal)
        return ["DRAW", "WIN", "LOSE"]
    }

    @objc private func buttonActionSettings(_ sender: Any) {
        navigationController?.pushViewController(settingViewController, animated: true)
    }
        
    @objc private func buttonActionRetry(_ sender: UIButton!) {
        textResult.text = ""
        stackViewItems.isHidden = false
        buttonRetry.isHidden = true
        imageRockRandom.isHidden = true
        imagePaperRandom.isHidden = true
        imageScissorsRandom.isHidden = true
        imagePaperUsers.isHidden = true
        imageScissorsUsers.isHidden = true
        imageRockUsers.isHidden = true
    }
    
    @objc private func buttonActionPlay(_ sender: UIButton!) {
        let language = switchLanguage()
        
        if sender == buttonRock {
            if settingViewController.statusDrawMode {
                randChoice = Int.random(in: 0...2)
            } else {
                randChoice = Int.random(in: 1...2)
            }
            
            switch randChoice {
            case 0:
                textResult.text = language[0]
                imageRockRandom.isHidden = false
                imagePaperRandom.isHidden = true
                imageScissorsRandom.isHidden = true
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "rock")!, imageComputer: UIImage(named: "rock")!, result: textResult.text))
            case 1:
                textResult.text = language[2]
                imageRockRandom.isHidden = true
                imagePaperRandom.isHidden = false
                imageScissorsRandom.isHidden = true
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "rock")!, imageComputer: UIImage(named: "paper")!, result: textResult.text))
            case 2:
                textResult.text = language[1]
                imageRockRandom.isHidden = true
                imagePaperRandom.isHidden = true
                imageScissorsRandom.isHidden = false
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "rock")!, imageComputer: UIImage(named: "scissors")!, result: textResult.text))
            default:
                break
            }

            imageRockUsers.isHidden = false
            imagePaperUsers.isHidden = true
            imageScissorsUsers.isHidden = true
            stackViewItems.isHidden = true
            buttonRetry.isHidden = false
                    
        } else if sender == buttonPaper {
            let arrayForModeWithoutDraw: Array<Int> = [0, 2]
            
            if settingViewController.statusDrawMode {
                randChoice = Int.random(in: 0...2)
            } else {
                randChoice = arrayForModeWithoutDraw.randomElement()!
            }
            
            switch randChoice {
            case 1:
                textResult.text = language[0]
                imageRockRandom.isHidden = true
                imagePaperRandom.isHidden = false
                imageScissorsRandom.isHidden = true
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "paper")!, imageComputer: UIImage(named: "paper")!, result: textResult.text))
            case 2:
                textResult.text = language[2]
                imageRockRandom.isHidden = true
                imagePaperRandom.isHidden = true
                imageScissorsRandom.isHidden = false
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "paper")!, imageComputer: UIImage(named: "scissors")!, result: textResult.text))
            case 0 :
                textResult.text = language[1]
                imageRockRandom.isHidden = false
                imagePaperRandom.isHidden = true
                imageScissorsRandom.isHidden = true
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "paper")!, imageComputer: UIImage(named: "rock")!, result: textResult.text))
            default:
                break
            }
            
            imagePaperUsers.isHidden = false
            imageRockUsers.isHidden = true
            imageScissorsUsers.isHidden = true
            stackViewItems.isHidden = true
            buttonRetry.isHidden = false
                        
        } else if sender == buttonScissors {
            if settingViewController.statusDrawMode {
                randChoice = Int.random(in: 0...2)
            } else {
                randChoice = Int.random(in: 0...1)
            }

            switch randChoice {
            case 2:
                textResult.text = language[0]
                imageRockRandom.isHidden = true
                imagePaperRandom.isHidden = true
                imageScissorsRandom.isHidden = false
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "scissors")!, imageComputer: UIImage(named: "scissors")!, result: textResult.text))
            case 0:
                textResult.text = language[2]
                imageRockRandom.isHidden = false
                imagePaperRandom.isHidden = true
                imageScissorsRandom.isHidden = true
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "scissors")!, imageComputer: UIImage(named: "rock")!, result: textResult.text))
            case 1:
                textResult.text = language[1]
                imageRockRandom.isHidden = true
                imagePaperRandom.isHidden = false
                imageScissorsRandom.isHidden = true
                historyOfRockPaperScissors.append(RockPaperScissors(imagePlayer: UIImage(named: "scissors")!, imageComputer: UIImage(named: "paper")!, result: textResult.text))
            default:
                break
            }
            
            imageScissorsUsers.isHidden = false
            imageRockUsers.isHidden = true
            imagePaperUsers.isHidden = true
            stackViewItems.isHidden = true
            buttonRetry.isHidden = false
        }
    }
}
