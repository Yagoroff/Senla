import Foundation
import UIKit

struct RockPaperScissors {
    let imagePlayer: UIImage
    let imageComputer: UIImage
    let result: String
}

struct TicTacToe {
    let result: String
}

final class InfoAboutGames {
    static let shared = InfoAboutGames()
    
    var historyOfRockPaperScissors: [RockPaperScissors] = []
    var historyOfTicTacToe: [TicTacToe] = []
    var countOfGamesInTicTacToe: Int = 0
    var countOfWinInTicTacToe: Int = 0
    var countOfGamesInRockPaperScissors: Int = 0
    var countOfPickRock: Int = 0
    var countOfWinByRock: Int = 0
    var countOfPickPaper: Int = 0
    var countOfWinByPaper: Int = 0
    var countOfPickScissors: Int = 0
    var countOfWinByScissors: Int = 0
}
