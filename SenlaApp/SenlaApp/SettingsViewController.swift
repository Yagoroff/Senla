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
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    lazy var buttonEnglish: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Переключиться на Английский", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionEnglish(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    lazy var buttonWithDraw: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Mode: with Draw", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionWithDraw(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    lazy var buttonWithoutDraw: UIButton = {
        let buttonForReturn = UIButton()
        buttonForReturn.setTitle("Mode: without Draw", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionWithoutDraw(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonRussian.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonRussian.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonRussian.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonRussian.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        buttonEnglish.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonEnglish.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonEnglish.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonEnglish.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        buttonWithDraw.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonWithDraw.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonWithDraw.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonWithDraw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        buttonWithoutDraw.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonWithoutDraw.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonWithoutDraw.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonWithoutDraw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
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


