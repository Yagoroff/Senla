import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    let settingViewController = SettingsViewController()

    private lazy var randChoice = Int.random(in: 0...2)
    
    private lazy var textResult: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    } ()
    
    private lazy var buttonRetry: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("RETRY", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionRetry(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    private lazy var buttonRock: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: "rock"), for: .normal)
        buttonForReturn.tintColor = .black
        buttonForReturn.alpha = 0

        buttonForReturn.addTarget(self, action: #selector(buttonActionRock(_:)), for: .touchUpInside)
                        
        return buttonForReturn
    } ()
    
    private lazy var buttonPaper: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: "paper"), for: .normal)
        buttonForReturn.tintColor = .black
        buttonForReturn.alpha = 0

        buttonForReturn.addTarget(self, action: #selector(buttonActionPaper(_:)), for: .touchUpInside)
                
        return buttonForReturn
    } ()
    
    private lazy var buttonScissors: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: "scissors"), for: .normal)
        buttonForReturn.tintColor = .black
        buttonForReturn.alpha = 0

        buttonForReturn.addTarget(self, action: #selector(buttonActionScissors(_:)), for: .touchUpInside)
                
        return buttonForReturn
    } ()

    private lazy var imageRockUsers: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "rock"))
        return imageForReturn
    } ()
    
    private lazy var imagePaperUsers: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "paper"))
        return imageForReturn
    } ()
    
    private lazy var imageScissorsUsers: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "scissors"))
        return imageForReturn
    } ()
    
    private lazy var imageRockRandom: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "rock"))
        return imageForReturn
    } ()
    
    private lazy var imagePaperRandom: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "paper"))
        return imageForReturn
    } ()
    
    private lazy var imageScissorsRandom: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "scissors"))
        return imageForReturn
    } ()
    
    private lazy var buttonSettings: UIButton = {
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
            self.buttonRock.alpha = 1
            self.buttonPaper.alpha = 1
            self.buttonScissors.alpha = 1
            self.buttonSettings.transform.tx = -100
        })
    }
}

private extension RockPaperScissorsViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(buttonSettings)
        view.addSubview(buttonRock)
        view.addSubview(buttonPaper)
        view.addSubview(buttonScissors)
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
    
    func makeConstraints() {
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        buttonRock.translatesAutoresizingMaskIntoConstraints = false
        buttonPaper.translatesAutoresizingMaskIntoConstraints = false
        buttonScissors.translatesAutoresizingMaskIntoConstraints = false
        textResult.translatesAutoresizingMaskIntoConstraints = false
        buttonRetry.translatesAutoresizingMaskIntoConstraints = false
        imageRockRandom.translatesAutoresizingMaskIntoConstraints = false
        imagePaperRandom.translatesAutoresizingMaskIntoConstraints = false
        imageScissorsRandom.translatesAutoresizingMaskIntoConstraints = false
        imageScissorsUsers.translatesAutoresizingMaskIntoConstraints = false
        imagePaperUsers.translatesAutoresizingMaskIntoConstraints = false
        imageRockUsers.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonSettings.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50),
            buttonSettings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            buttonPaper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPaper.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            buttonPaper.widthAnchor.constraint(equalToConstant: 50),
            buttonPaper.heightAnchor.constraint(equalToConstant: 50),
            
            buttonRock.trailingAnchor.constraint(equalTo: buttonPaper.leadingAnchor, constant: -60),
            buttonRock.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            buttonRock.widthAnchor.constraint(equalToConstant: 50),
            buttonRock.heightAnchor.constraint(equalToConstant: 50),
            
            buttonScissors.leadingAnchor.constraint(equalTo: buttonPaper.trailingAnchor, constant: 60),
            buttonScissors.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            buttonScissors.widthAnchor.constraint(equalToConstant: 50),
            buttonScissors.heightAnchor.constraint(equalToConstant: 50),

            textResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textResult.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonRetry.widthAnchor.constraint(equalToConstant: 140),
            buttonRetry.heightAnchor.constraint(equalToConstant: 50),
            buttonRetry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRetry.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
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
        buttonRock.isHidden = false
        buttonPaper.isHidden = false
        buttonScissors.isHidden = false
        buttonRetry.isHidden = true
        imageRockRandom.isHidden = true
        imagePaperRandom.isHidden = true
        imageScissorsRandom.isHidden = true
        imagePaperUsers.isHidden = true
        imageScissorsUsers.isHidden = true
        imageRockUsers.isHidden = true
    }
    
    @objc private func buttonActionRock(_ sender: UIButton!) {
        let language = switchLanguage()

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
        case 1:
            textResult.text = language[2]
            imageRockRandom.isHidden = true
            imagePaperRandom.isHidden = false
            imageScissorsRandom.isHidden = true
        case 2:
            textResult.text = language[1]
            imageRockRandom.isHidden = true
            imagePaperRandom.isHidden = true
            imageScissorsRandom.isHidden = false
        default:
            break
        }

        imageRockUsers.isHidden = false
        imagePaperUsers.isHidden = true
        imageScissorsUsers.isHidden = true
        buttonRock.isHidden = true
        buttonPaper.isHidden = true
        buttonScissors.isHidden = true
        buttonRetry.isHidden = false
    }
    
    @objc private func buttonActionPaper(_ sender: UIButton!) {
        let language = switchLanguage()
        let arrayForModeWithoutDraw: Array<Int> = [0, 2]
        
        if settingViewController.statusDrawMode {
            randChoice = Int.random(in: 0...2)
        } else {
            randChoice = arrayForModeWithoutDraw.randomElement()!
        }

        if randChoice == 1 {
            textResult.text = language[0]
            imageRockRandom.isHidden = true
            imagePaperRandom.isHidden = false
            imageScissorsRandom.isHidden = true
        } else if randChoice == 2 {
            textResult.text = language[2]
            imageRockRandom.isHidden = true
            imagePaperRandom.isHidden = true
            imageScissorsRandom.isHidden = false
        } else if randChoice == 0 {
            textResult.text = language[1]
            imageRockRandom.isHidden = false
            imagePaperRandom.isHidden = true
            imageScissorsRandom.isHidden = true
        }
        
        imagePaperUsers.isHidden = false
        imageRockUsers.isHidden = true
        imageScissorsUsers.isHidden = true
        buttonRock.isHidden = true
        buttonPaper.isHidden = true
        buttonScissors.isHidden = true
        buttonRetry.isHidden = false
    }
    
    @objc private func buttonActionScissors(_ sender: UIButton!) {
        let language = switchLanguage()
        
        if settingViewController.statusDrawMode {
            randChoice = Int.random(in: 0...2)
        } else {
            randChoice = Int.random(in: 0...1)
        }

        if randChoice == 2 {
            textResult.text = language[0]
            imageRockRandom.isHidden = true
            imagePaperRandom.isHidden = true
            imageScissorsRandom.isHidden = false
        } else if randChoice == 0 {
            textResult.text = language[2]
            imageRockRandom.isHidden = false
            imagePaperRandom.isHidden = true
            imageScissorsRandom.isHidden = true
        } else if randChoice == 1 {
            textResult.text = language[1]
            imageRockRandom.isHidden = true
            imagePaperRandom.isHidden = false
            imageScissorsRandom.isHidden = true
        }
        
        imageScissorsUsers.isHidden = false
        imageRockUsers.isHidden = true
        imagePaperUsers.isHidden = true
        buttonRock.isHidden = true
        buttonPaper.isHidden = true
        buttonScissors.isHidden = true
        buttonRetry.isHidden = false
    }
}

