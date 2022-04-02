import UIKit

class SettingsViewController: UIViewController {
    public var currentLanguage: String = "english"
    public var statusDrawMode: Bool = true
    
    lazy var buttonRussian: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Switch to Russian", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionRussian(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    lazy var buttonEnglish: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Переключиться на Английский", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionEnglish(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    lazy var buttonWithDraw: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Mode: with Draw", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionWithDraw(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    lazy var buttonWithoutDraw: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Mode: without Draw", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionWithoutDraw(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
    }
}


extension SettingsViewController {
    func setupView() {
        view.backgroundColor = .white
        title = "Settings"
        view.addSubview(buttonRussian)
        view.addSubview(buttonEnglish)
        view.addSubview(buttonWithDraw)
        view.addSubview(buttonWithoutDraw)
        buttonEnglish.isHidden = true
        buttonWithoutDraw.isHidden = true
    }
    
    func makeConstraints() {
        buttonRussian.translatesAutoresizingMaskIntoConstraints = false
        buttonEnglish.translatesAutoresizingMaskIntoConstraints = false
        buttonWithDraw.translatesAutoresizingMaskIntoConstraints = false
        buttonWithoutDraw.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonRussian.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            buttonRussian.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            buttonRussian.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRussian.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            buttonEnglish.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            buttonEnglish.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            buttonEnglish.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonEnglish.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            buttonWithDraw.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            buttonWithDraw.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            buttonWithDraw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWithDraw.topAnchor.constraint(equalTo: buttonRussian.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            
            buttonWithoutDraw.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            buttonWithoutDraw.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            buttonWithoutDraw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWithoutDraw.topAnchor.constraint(equalTo: buttonRussian.safeAreaLayoutGuide.bottomAnchor, constant: 30)
        ])
    }
    
    @objc func buttonActionRussian(_ sender: UIButton!) {
        buttonRussian.isHidden = true
        buttonEnglish.isHidden = false
        currentLanguage = "русский"
        buttonWithDraw.setTitle("Режим: с ничьей", for: .normal)
        buttonWithoutDraw.setTitle("Режим: без ничьи", for: .normal)
        
        title = "Настройки"
    }
    
    @objc func buttonActionEnglish(_ sender: UIButton!) {
        buttonRussian.isHidden = false
        buttonEnglish.isHidden = true
        currentLanguage = "english"
        buttonWithDraw.setTitle("Mode: with Draw", for: .normal)
        buttonWithoutDraw.setTitle("Mode: without Draw", for: .normal)

        title = "Settings"
    }
    
    @objc func buttonActionWithDraw(_ sender: UIButton!) {
        statusDrawMode = false
        buttonWithDraw.isHidden = true
        buttonWithoutDraw.isHidden = false
    }
    
    @objc func buttonActionWithoutDraw(_ sender: UIButton!) {
        statusDrawMode = true
        buttonWithDraw.isHidden = false
        buttonWithoutDraw.isHidden = true
    }
}


