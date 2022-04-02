import UIKit

class CubeViewController: UIViewController {
    private lazy var randomNumber: Int = Int.random(in: 1...6)
    
    private lazy var cubeFirst: UIImageView = {
        let image = UIImageView(image: UIImage(named: "one"))
        image.alpha = 0
        return image
    } ()
    
    private lazy var cubeSecond: UIImageView = {
        let image = UIImageView(image: UIImage(named: "two"))
        image.alpha = 0
        return image
    } ()
    
    private lazy var cubeThird: UIImageView = {
        let image = UIImageView(image: UIImage(named: "three"))
        image.alpha = 0
        return image
    } ()
    
    private lazy var cubeFourth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "four"))
        image.alpha = 0
        return image
    } ()
    
    private lazy var cubeFifth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "five"))
        image.alpha = 0
        return image
    } ()
    
    private lazy var cubeSixth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "six"))
        image.alpha = 0
        return image
    } ()
    
    private lazy var playButton: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("THROW", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionPlay(_:)), for: .touchUpInside)
        
        buttonForReturn.alpha = 0
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
            self.cubeFirst.alpha = 1
            self.cubeSecond.alpha = 1
            self.cubeThird.alpha = 1
            self.cubeFourth.alpha = 1
            self.cubeFifth.alpha = 1
            self.cubeSixth.alpha = 1
            self.playButton.alpha = 1
        })
    }
}

extension CubeViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(cubeFirst)
        view.addSubview(cubeSecond)
        view.addSubview(cubeThird)
        view.addSubview(cubeFourth)
        view.addSubview(cubeFifth)
        view.addSubview(cubeSixth)
        view.addSubview(playButton)
        view.addSubview(retryButton)
        retryButton.isHidden = true
    }
    
    func makeConstraints() {
        cubeFirst.translatesAutoresizingMaskIntoConstraints = false
        cubeSecond.translatesAutoresizingMaskIntoConstraints = false
        cubeThird.translatesAutoresizingMaskIntoConstraints = false
        cubeFourth.translatesAutoresizingMaskIntoConstraints = false
        cubeFifth.translatesAutoresizingMaskIntoConstraints = false
        cubeSixth.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.widthAnchor.constraint(equalToConstant: 140),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            retryButton.widthAnchor.constraint(equalToConstant: 140),
            retryButton.heightAnchor.constraint(equalToConstant: 50),
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            
            cubeFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            cubeFirst.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            
            cubeSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            cubeSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 155),
            
            cubeThird.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            cubeThird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 275),
            
            cubeFourth.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            cubeFourth.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
        
            cubeFifth.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            cubeFifth.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 155),
            
            cubeSixth.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            cubeSixth.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 275)
        ])
    }
    
    @objc private func buttonActionPlay(_ sender: UIButton!) {
        randomNumber = Int.random(in: 1...6)
        playButton.isHidden = true
        retryButton.isHidden = false
        switch randomNumber {
        case 1:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.alpha = 1
                self.cubeSecond.alpha = 0
                self.cubeThird.alpha = 0
                self.cubeFourth.alpha = 0
                self.cubeFifth.alpha = 0
                self.cubeSixth.alpha = 0
            })
            playButton.isHidden = true
        case 2:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.alpha = 0
                self.cubeSecond.alpha = 1
                self.cubeThird.alpha = 0
                self.cubeFourth.alpha = 0
                self.cubeFifth.alpha = 0
                self.cubeSixth.alpha = 0
            })
            playButton.isHidden = true
        case 3:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.alpha = 0
                self.cubeSecond.alpha = 0
                self.cubeThird.alpha = 1
                self.cubeFourth.alpha = 0
                self.cubeFifth.alpha = 0
                self.cubeSixth.alpha = 0
            })
            playButton.isHidden = true
        case 4:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.alpha = 0
                self.cubeSecond.alpha = 0
                self.cubeThird.alpha = 0
                self.cubeFourth.alpha = 1
                self.cubeFifth.alpha = 0
                self.cubeSixth.alpha = 0
            })
            playButton.isHidden = true
        case 5:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.alpha = 0
                self.cubeSecond.alpha = 0
                self.cubeThird.alpha = 0
                self.cubeFourth.alpha = 0
                self.cubeFifth.alpha = 1
                self.cubeSixth.alpha = 0
            })
            playButton.isHidden = true
        case 6:
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: { [self] in
                self.cubeFirst.alpha = 0
                self.cubeSecond.alpha = 0
                self.cubeThird.alpha = 0
                self.cubeFourth.alpha = 0
                self.cubeFifth.alpha = 0
                self.cubeSixth.alpha = 1
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
            self.cubeFirst.alpha = 1
            self.cubeSecond.alpha = 1
            self.cubeThird.alpha = 1
            self.cubeFourth.alpha = 1
            self.cubeFifth.alpha = 1
            self.cubeSixth.alpha = 1
        })
    }
}
