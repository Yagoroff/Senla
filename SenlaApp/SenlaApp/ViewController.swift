import UIKit

class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Анимация", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        return button
    }()
    
    private let buttonRocket: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        return button
    }()
    
    private let rocket: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.black.cgColor
        return shape
    }()
    
    private let window: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.white.cgColor
        return shape
    }()
    
    private let land: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.systemGreen.cgColor
        return shape
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.layer.addSublayer(land)
        view.layer.addSublayer(rocket)
        view.layer.addSublayer(window)
        setupButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 1.5)
        
        let pathForRocket = UIBezierPath()
        pathForRocket.move(to: CGPoint(x: center.x - 50, y: center.y))
        pathForRocket.addCurve(to: CGPoint(x: center.x + 50, y: center.y),
                       controlPoint1: CGPoint(x: center.x - 100, y: center.y - 250),
                       controlPoint2: CGPoint(x: center.x + 100, y: center.y - 250))
        pathForRocket.move(to: CGPoint(x: center.x - 57.8, y: center.y - 50))
        pathForRocket.addCurve(to: CGPoint(x: center.x - 50, y: center.y),
                       controlPoint1: CGPoint(x: center.x - 120, y: center.y),
                       controlPoint2: CGPoint(x: center.x - 20, y: center.y + 100))
        pathForRocket.move(to: CGPoint(x: center.x + 57.8, y: center.y - 50))
        pathForRocket.addCurve(to: CGPoint(x: center.x + 50, y: center.y),
                       controlPoint1: CGPoint(x: center.x + 120, y: center.y),
                       controlPoint2: CGPoint(x: center.x + 20, y: center.y + 100))
        pathForRocket.move(to: CGPoint(x: center.x - 20, y: center.y + 20))
        pathForRocket.addLine(to: CGPoint(x: center.x - 20, y: center.y + 40))
        pathForRocket.addLine(to: CGPoint(x: center.x, y: center.y + 70))
        pathForRocket.addLine(to: CGPoint(x: center.x + 20, y: center.y + 40))
        pathForRocket.addLine(to: CGPoint(x: center.x + 20, y: center.y + 20))
        
        let pathForWindow = UIBezierPath(arcCenter: CGPoint(x: center.x, y: center.y - 120), radius: 15, startAngle: 10, endAngle: 0, clockwise: false)
        
        let pathForLand = UIBezierPath(arcCenter: CGPoint(x: center.x, y: center.y + 970), radius: 1000, startAngle: 10, endAngle: 0, clockwise: false)
        
        rocket.path = pathForRocket.cgPath
        window.path = pathForWindow.cgPath
        land.path = pathForLand.cgPath
    }
}

extension ViewController {
    @objc func startAnimation() {
//        button.isEnabled = false
//        buttonRocket.isEnabled = false
        addAnimation(to: rocket)
        addAnimation(to: window)
    }
    
    private func setupButtons() {
        view.addSubview(button)
        view.addSubview(buttonRocket)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonRocket.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            buttonRocket.heightAnchor.constraint(equalToConstant: 258),
            buttonRocket.widthAnchor.constraint(equalToConstant: 160),
            buttonRocket.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRocket.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 82)
        ])
    }
    
    private func addAnimation(to layer: CAShapeLayer) {
        let shakeRocket = CABasicAnimation(keyPath: "position.x")
        shakeRocket.fromValue = -2
        shakeRocket.toValue = 2
        shakeRocket.duration = 0.05
        shakeRocket.beginTime = CACurrentMediaTime()
        shakeRocket.repeatCount = 100
        shakeRocket.autoreverses = true
        
        let sizeRocket = CABasicAnimation(keyPath: "transform.scale")
        sizeRocket.fromValue = 1
        sizeRocket.toValue = 0
        sizeRocket.duration = 4
        sizeRocket.beginTime = CACurrentMediaTime() + 5
        sizeRocket.repeatCount = 1
        sizeRocket.autoreverses = true
        
        let positionRocket = CABasicAnimation(keyPath: "position.x")
        positionRocket.fromValue = 0
        positionRocket.toValue = 200
        positionRocket.duration = 4
        positionRocket.beginTime = CACurrentMediaTime() + 5
        positionRocket.repeatCount = 1
        positionRocket.autoreverses = true
        
        layer.add(shakeRocket, forKey: nil)
        layer.add(sizeRocket, forKey: nil)
        layer.add(positionRocket, forKey: nil)
    }
}
