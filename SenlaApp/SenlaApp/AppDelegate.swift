import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()

        let cubeViewController = CubeViewController()
        cubeViewController.tabBarItem = UITabBarItem(title: "Cube", image: UIImage(systemName: "cube.fill"), selectedImage: nil)
        
        let rockPaperScissorsViewController = RockPaperScissorsViewController()
        let navigationController = UINavigationController(rootViewController: rockPaperScissorsViewController)
        navigationController.tabBarItem = UITabBarItem(title: "RockPaperScissors", image: UIImage(systemName: "scissors"), selectedImage: nil)
        
        tabBarController.viewControllers = [navigationController, cubeViewController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    
        return true
    }
}

