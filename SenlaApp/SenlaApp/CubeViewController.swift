import UIKit

class CubeViewController: UIViewController {
    
    lazy var titleGame: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 60)
        textView.text = "CUBE"
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.layer.opacity = 0
        return textView
    } ()
    
    
    private lazy var randomNumber: Int = Int.random(in: 1...6)
    
    private lazy var stackViewFirstLine = UIStackView()
    
    private lazy var stackViewSecondLine = UIStackView()
    
    private lazy var cubeFirst: UIImageView = createImage("one")
    private lazy var cubeSecond: UIImageView = createImage("two")
    private lazy var cubeThird: UIImageView = createImage("three")
    private lazy var cubeFourth: UIImageView = createImage("four")
    private lazy var cubeFifth: UIImageView = createImage("five")
    private lazy var cubeSixth: UIImageView = createImage("six")
    
    private lazy var playButton: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("THROW", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionPlay(_:)), for: .touchUpInside)
        
        buttonForReturn.layer.opacity = 0
        return buttonForReturn
    } ()
    
    private lazy var retryButton: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("RETRY", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionRetry(_:)), for: .touchUpInside)
        
        return buttonForReturn
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
        UIView.animate(withDuration: 1.2, delay: 0, options: .curveEaseInOut, animations: { [self] in
            self.titleGame.layer.opacity = 1
            self.cubeFirst.layer.opacity = 1
            self.cubeSecond.layer.opacity = 1
            self.cubeThird.layer.opacity = 1
            self.cubeFourth.layer.opacity = 1
            self.cubeFifth.layer.opacity = 1
            self.cubeSixth.layer.opacity = 1
            self.playButton.layer.opacity = 1
        })
    }
}

extension CubeViewController {
    func setupView() {
        view.backgroundColor = .white
        appendArrangedSubviews()
        view.addSubview(titleGame)
        view.addSubview(stackViewFirstLine)
        view.addSubview(stackViewSecondLine)
        view.addSubview(playButton)
        view.addSubview(retryButton)
        retryButton.isHidden = true
    }
    
    func appendArrangedSubviews() {
        stackViewFirstLine.addArrangedSubview(cubeFirst)
        stackViewFirstLine.addArrangedSubview(cubeSecond)
        stackViewFirstLine.addArrangedSubview(cubeThird)
        stackViewSecondLine.addArrangedSubview(cubeFourth)
        stackViewSecondLine.addArrangedSubview(cubeFifth)
        stackViewSecondLine.addArrangedSubview(cubeSixth)
    }
    
    func makeConstraints() {
        titleGame.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewFirstLine.translatesAutoresizingMaskIntoConstraints = false
        stackViewSecondLine.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewFirstLine.axis = .horizontal
        stackViewFirstLine.spacing = 20
        stackViewFirstLine.distribution = .fillEqually
        
        stackViewSecondLine.axis = .horizontal
        stackViewSecondLine.spacing = 20
        stackViewSecondLine.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            titleGame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleGame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            playButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            retryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            retryButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            
            stackViewFirstLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewFirstLine.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            
            stackViewSecondLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewSecondLine.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30)
        ])
    }
    
    func createImage(_ name: String) -> UIImageView {
        let image = UIImageView(image: UIImage(named: name))
        image.layer.opacity = 0
        return image
    }
    
    @objc private func buttonActionPlay(_ sender: UIButton!) {
        randomNumber = Int.random(in: 1...6)
        playButton.isHidden = true
        retryButton.isHidden = false
        switch randomNumber {
        case 1:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.layer.opacity = 1
                self.cubeSecond.layer.opacity = 0
                self.cubeThird.layer.opacity = 0
                self.cubeFourth.layer.opacity = 0
                self.cubeFifth.layer.opacity = 0
                self.cubeSixth.layer.opacity = 0
            })
            playButton.isHidden = true
        case 2:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.layer.opacity = 0
                self.cubeSecond.layer.opacity = 1
                self.cubeThird.layer.opacity = 0
                self.cubeFourth.layer.opacity = 0
                self.cubeFifth.layer.opacity = 0
                self.cubeSixth.layer.opacity = 0
            })
            playButton.isHidden = true
        case 3:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.layer.opacity = 0
                self.cubeSecond.layer.opacity = 0
                self.cubeThird.layer.opacity = 1
                self.cubeFourth.layer.opacity = 0
                self.cubeFifth.layer.opacity = 0
                self.cubeSixth.layer.opacity = 0
            })
            playButton.isHidden = true
        case 4:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.layer.opacity = 0
                self.cubeSecond.layer.opacity = 0
                self.cubeThird.layer.opacity = 0
                self.cubeFourth.layer.opacity = 1
                self.cubeFifth.layer.opacity = 0
                self.cubeSixth.layer.opacity = 0
            })
            playButton.isHidden = true
        case 5:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.layer.opacity = 0
                self.cubeSecond.layer.opacity = 0
                self.cubeThird.layer.opacity = 0
                self.cubeFourth.layer.opacity = 0
                self.cubeFifth.layer.opacity = 1
                self.cubeSixth.layer.opacity = 0
            })
            playButton.isHidden = true
        case 6:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.layer.opacity = 0
                self.cubeSecond.layer.opacity = 0
                self.cubeThird.layer.opacity = 0
                self.cubeFourth.layer.opacity = 0
                self.cubeFifth.layer.opacity = 0
                self.cubeSixth.layer.opacity = 1
            })
            playButton.isHidden = true
        default:
            break
        }
    }
    
    @objc func buttonActionRetry(_ sender: UIButton!) {
        playButton.isHidden = false
        retryButton.isHidden = true
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
            self.cubeFirst.layer.opacity = 1
            self.cubeSecond.layer.opacity = 1
            self.cubeThird.layer.opacity = 1
            self.cubeFourth.layer.opacity = 1
            self.cubeFifth.layer.opacity = 1
            self.cubeSixth.layer.opacity = 1
        })
    }
}
