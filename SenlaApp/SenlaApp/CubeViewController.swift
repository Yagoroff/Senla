import UIKit

class CubeViewController: UIViewController {
    private lazy var randomNumber: Int = Int.random(in: 1...6)
    
    private lazy var cubeFirst: UIImageView = {
        let image = UIImageView(image: UIImage(named: "one"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var cubeSecond: UIImageView = {
        let image = UIImageView(image: UIImage(named: "two"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var cubeThird: UIImageView = {
        let image = UIImageView(image: UIImage(named: "three"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var cubeFourth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "four"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var cubeFifth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "five"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var cubeSixth: UIImageView = {
        let image = UIImageView(image: UIImage(named: "six"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var playButton: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("THROW", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionPlay(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    private lazy var retryButton: UIButton = {
        let buttonForReturn = UIButton(type: .system)
        buttonForReturn.setTitle("RETRY", for: .normal)
        buttonForReturn.setTitleColor(.black, for: .normal)
        buttonForReturn.backgroundColor = .systemGray5
        buttonForReturn.layer.cornerRadius = 15
        
        buttonForReturn.addTarget(self, action: #selector(buttonActionRetry(_:)), for: .touchUpInside)
        
        buttonForReturn.translatesAutoresizingMaskIntoConstraints = false
        return buttonForReturn
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        retryButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        retryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        retryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        
        cubeFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        cubeFirst.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        
        cubeSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        cubeSecond.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 155).isActive = true
        
        cubeThird.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        cubeThird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 275).isActive = true
        
        cubeFourth.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        cubeFourth.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
    
        cubeFifth.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        cubeFifth.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 155).isActive = true
        
        cubeSixth.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        cubeSixth.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 275).isActive = true
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
    
    @objc private func buttonActionPlay(_ sender: UIButton!) {
        randomNumber = Int.random(in: 1...6)
        playButton.isHidden = true
        retryButton.isHidden = false
        
        switch randomNumber {
        case 1:
            cubeFirst.isHidden = false
            cubeSecond.isHidden = true
            cubeThird.isHidden = true
            cubeFourth.isHidden = true
            cubeFifth.isHidden = true
            cubeSixth.isHidden = true
        case 2:
            cubeFirst.isHidden = true
            cubeSecond.isHidden = false
            cubeThird.isHidden = true
            cubeFourth.isHidden = true
            cubeFifth.isHidden = true
            cubeSixth.isHidden = true
        case 3:
            cubeFirst.isHidden = true
            cubeSecond.isHidden = true
            cubeThird.isHidden = false
            cubeFourth.isHidden = true
            cubeFifth.isHidden = true
            cubeSixth.isHidden = true
        case 4:
            cubeFirst.isHidden = true
            cubeSecond.isHidden = true
            cubeThird.isHidden = true
            cubeFourth.isHidden = false
            cubeFifth.isHidden = true
            cubeSixth.isHidden = true
        case 5:
            cubeFirst.isHidden = true
            cubeSecond.isHidden = true
            cubeThird.isHidden = true
            cubeFourth.isHidden = true
            cubeFifth.isHidden = false
            cubeSixth.isHidden = true
        case 6:
            cubeFirst.isHidden = true
            cubeSecond.isHidden = true
            cubeThird.isHidden = true
            cubeFourth.isHidden = true
            cubeFifth.isHidden = true
            cubeSixth.isHidden = false
        default:
            break
        }
    }
    
    @objc func buttonActionRetry(_ sender: UIButton!) {
        playButton.isHidden = false
        retryButton.isHidden = true
        cubeFirst.isHidden = false
        cubeSecond.isHidden = false
        cubeThird.isHidden = false
        cubeFourth.isHidden = false
        cubeFifth.isHidden = false
        cubeSixth.isHidden = false
    }
}
