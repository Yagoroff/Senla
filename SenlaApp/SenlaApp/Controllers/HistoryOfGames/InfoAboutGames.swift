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

var historyOfRockPaperScissors: [RockPaperScissors] = []
var historyOfTicTacToe: [TicTacToe] = []
var countOfGamesInTicTacToe: Int = 0
var countOfWinInTicTacToe: Int = 0
var countOfGamesInRockPaperScissors: Int = 0
var countOfWinInRockPaperScissors: Int = 0
