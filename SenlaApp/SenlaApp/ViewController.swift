import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        complexShape()
    }
    
    func complexShape() {
        let center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        
        let pathForFrame = UIBezierPath()
        pathForFrame.move(to: CGPoint(x: center.x - 50, y: center.y))
        pathForFrame.addCurve(to: CGPoint(x: center.x + 50, y: center.y),
                       controlPoint1: CGPoint(x: center.x - 100, y: center.y - 250),
                       controlPoint2: CGPoint(x: center.x + 100, y: center.y - 250))
        
        let pathForFirstWing = UIBezierPath()
        pathForFirstWing.move(to: CGPoint(x: center.x - 50, y: center.y - 50))
        pathForFirstWing.addCurve(to: CGPoint(x: center.x - 50, y: center.y),
                       controlPoint1: CGPoint(x: center.x - 120, y: center.y),
                       controlPoint2: CGPoint(x: center.x - 20, y: center.y + 100))

        let pathForSecondWing = UIBezierPath()
        pathForSecondWing.move(to: CGPoint(x: center.x + 50, y: center.y - 50))
        pathForSecondWing.addCurve(to: CGPoint(x: center.x + 50, y: center.y),
                       controlPoint1: CGPoint(x: center.x + 120, y: center.y),
                       controlPoint2: CGPoint(x: center.x + 20, y: center.y + 100))
        
        let pathForWindow = UIBezierPath(arcCenter: CGPoint(x: center.x, y: center.y - 120), radius: 15, startAngle: 10, endAngle: 0, clockwise: false)
        
        let pathForFire = UIBezierPath()
        pathForFire.move(to: CGPoint(x: center.x - 20, y: center.y + 20))
        pathForFire.addLine(to: CGPoint(x: center.x - 20, y: center.y + 40))
        pathForFire.addLine(to: CGPoint(x: center.x, y: center.y + 70))
        pathForFire.addLine(to: CGPoint(x: center.x + 20, y: center.y + 40))
        pathForFire.addLine(to: CGPoint(x: center.x + 20, y: center.y + 20))
        
        let frame = CAShapeLayer()
        frame.path = pathForFrame.cgPath
        frame.strokeColor = UIColor.black.cgColor
   
        let firstWing = CAShapeLayer()
        firstWing.path = pathForFirstWing.cgPath
        firstWing.strokeColor = UIColor.black.cgColor

        let secondWing = CAShapeLayer()
        secondWing.path = pathForSecondWing.cgPath
        secondWing.strokeColor = UIColor.black.cgColor
        
        let window = CAShapeLayer()
        window.path = pathForWindow.cgPath
        window.strokeColor = UIColor.black.cgColor
        window.fillColor = UIColor.white.cgColor
        
        let fire = CAShapeLayer()
        fire.path = pathForFire.cgPath
        fire.strokeColor = UIColor.black.cgColor
        fire.fillColor = UIColor.black.cgColor
        fire.lineWidth = 1
        
        view.layer.addSublayer(frame)
        view.layer.addSublayer(firstWing)
        view.layer.addSublayer(secondWing)
        view.layer.addSublayer(window)
        view.layer.addSublayer(fire)

    }
}
