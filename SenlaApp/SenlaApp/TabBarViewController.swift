//
//  TabBarViewController.swift
//  SenlaApp
//
//  Created by Игорь Ходжгоров on 12.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let cubeViewController = CubeViewController()
        cubeViewController.tabBarItem = UITabBarItem.init(title: "Cube", image: UIImage(systemName: "cube"), tag: 0)
        cubeViewController.tabBarItem.selectedImage = UIImage(systemName: "cube.fill")
        
        let rockPaperScissorsViewController = RockPaperScissorsViewController()
        let navigationController = UINavigationController(rootViewController: rockPaperScissorsViewController)
        navigationController.tabBarItem = UITabBarItem.init(title: "RockPaperScissors", image: UIImage(systemName: "scissors"), tag: 1)
        
        let ticTacToeViewController = TicTacToeViewController()
        ticTacToeViewController.tabBarItem = UITabBarItem.init(title: "TicTacToe", image: UIImage(systemName: "multiply.circle"), tag: 2)
        ticTacToeViewController.tabBarItem.selectedImage = UIImage(systemName: "multiply.circle.fill")
        
        let calculatorViewControleer = CalculatorViewController()
        calculatorViewControleer.tabBarItem = UITabBarItem.init(title: "Calculator", image: UIImage(systemName: "x.squareroot"), tag: 3)
        
        let historyViewController = HistoryViewController()
        historyViewController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "book"), tag: 4)
        historyViewController.tabBarItem.selectedImage = UIImage(systemName: "book.fill")
        
        
        tabBar.barTintColor = .gray
        tabBar.tintColor = .darkGray
                        
        setViewControllers([navigationController, cubeViewController, ticTacToeViewController, calculatorViewControleer, historyViewController], animated: false)
    }
}
