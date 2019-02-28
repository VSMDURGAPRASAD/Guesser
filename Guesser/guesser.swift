//
//  guesser.swift
//  Guesser
//
//  Created by Vinukonda,Sai Manikanta Durga Prasad on 2/28/19.
//  Copyright © 2019 Vinukonda,Sai Manikanta Durga Prasad. All rights reserved.
//

import Foundation
enum Result:String{case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}



class Guesser{
    
       private var correctAnswer:Int
       private var _numAttempts:Int
       private var guesses:[Guess]
    public struct Guess{
        var correctAnswer:Int
        var numAttemptsRequired:Int
        
    }
    
    var numAttempts:Int{
        return _numAttempts
    }
    
    private init(){
        
        self.correctAnswer = 0
        self._numAttempts = 0
        self.guesses = []
        
    }
    
    static var shared = Guesser()
    
    func createNewProblem(){
        correctAnswer = Int.random(in: 1...10)
        _numAttempts = 0
    }
    
    func amIRight(guess: Int) -> Result{
        
        _numAttempts = _numAttempts + 1
        if guess < correctAnswer{
            return Result.tooLow
        }
        else if guess > correctAnswer{
            return Result.tooHigh
        }
            
        else{
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct
        }
        
    }
    
    func guess(index:Int) -> Guess{
        return guesses[index]
    }
    
    func numGuesses() -> Int{
        return guesses.count
    }
    subscript(guess:Int) -> Guess{
        return guesses[guess]
    }
    func clearStatistics(){
        guesses = []
    }
    func maximumNumAttempts() -> Int{
        if guesses.count != 0{
            var maximumValue:Int = guesses[0].numAttemptsRequired
            for i in guesses{
                if maximumValue < i.numAttemptsRequired{
                    maximumValue = i.numAttemptsRequired
                }
            }
            
            return maximumValue
        }
        else{
            return 0
        }
        
    }
    func minimumNumAttempts() -> Int{
        if guesses.count != 0{
            var minimumValue:Int = guesses[0].numAttemptsRequired
            for i in guesses{
                if minimumValue > i.numAttemptsRequired{
                    minimumValue = i.numAttemptsRequired
                }
            }
            return minimumValue
            
        }
            
        else{
            return 0
        }
        
    }
    
}

