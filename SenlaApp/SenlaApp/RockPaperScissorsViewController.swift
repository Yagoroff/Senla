import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    let settingViewController = SettingsViewController()

    private lazy var randChoice = Int.random(in: 0...2)
    
    private lazy var textResult: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
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
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    private lazy var buttonRock: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: "rock"), for: .normal)
        buttonForReturn.tintColor = .black
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionRock(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        buttonForReturn.alpha = 0
        
        return buttonForReturn
    } ()
    
    private lazy var buttonPaper: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: "paper"), for: .normal)
        buttonForReturn.tintColor = .black
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionPaper(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        buttonForReturn.alpha = 0

        return buttonForReturn
    } ()
    
    private lazy var buttonScissors: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setImage(UIImage(named: "scissors"), for: .normal)
        buttonForReturn.tintColor = .black

        buttonForReturn.addTarget(self, action: #selector(buttonActionScissors(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        buttonForReturn.alpha = 0

        return buttonForReturn
    } ()

    private lazy var imageRockUsers: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "rock"))
        
        imageForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        return imageForReturn
    } ()
    
    private lazy var imagePaperUsers: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "paper"))
        
        imageForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        return imageForReturn
    } ()
    
    private lazy var imageScissorsUsers: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "scissors"))
        
        imageForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        return imageForReturn
    } ()
    
    private lazy var imageRockRandom: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "rock"))
        
        imageForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        return imageForReturn
    } ()
    
    private lazy var imagePaperRandom: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "paper"))
        
        imageForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        return imageForReturn
    } ()
    
    private lazy var imageScissorsRandom: UIImageView = {
        let imageForReturn = UIImageView(image: UIImage(named: "scissors"))
        
        imageForReturn.translatesAutoresizingMaskIntoConstraints = false
        
        return imageForReturn
    } ()
    
    private lazy var buttonSettings: UIButton = {
        let button = UIButton(type: .system)

        button.setImage(UIImage(systemName: "gearshape", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)), for: .normal)
        button.imageView?.tintColor = .black
        button.tintColor = .black

        button.addTarget(self, action: #selector(buttonActionSettings(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        UIView.animate(withDuration: 1.2, delay: 0.6, options: .curveEaseInOut, animations: { [self] in
            self.buttonRock.alpha = 1
            self.buttonPaper.alpha = 1
            self.buttonScissors.alpha = 1
            self.buttonSettings.transform.tx = -100
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonSettings.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50).isActive = true
        buttonSettings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true

        
        buttonRock.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        buttonRock.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        buttonRock.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonRock.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonPaper.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        buttonPaper.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        buttonPaper.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonPaper.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonScissors.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 290).isActive = true
        buttonScissors.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        buttonScissors.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonScissors.heightAnchor.constraint(equalToConstant: 50).isActive = true

        textResult.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textResult.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buttonRetry.widthAnchor.constraint(equalToConstant: 140).isActive = true
        buttonRetry.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonRetry.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonRetry.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        imageRockRandom.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        imageRockRandom.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageRockRandom.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageRockRandom.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imagePaperRandom.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        imagePaperRandom.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imagePaperRandom.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imagePaperRandom.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageScissorsRandom.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        imageScissorsRandom.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageScissorsRandom.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageScissorsRandom.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageRockUsers.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        imageRockUsers.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        imageRockUsers.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageRockUsers.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imagePaperUsers.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        imagePaperUsers.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        imagePaperUsers.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imagePaperUsers.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageScissorsUsers.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        imageScissorsUsers.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        imageScissorsUsers.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageScissorsUsers.heightAnchor.constraint(equalToConstant: 50).isActive = true
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

