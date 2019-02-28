//
//  FirstViewController.swift
//  Guesser
//
//  Created by Vinukonda,Sai Manikanta Durga Prasad on 2/26/19.
//  Copyright © 2019 Vinukonda,Sai Manikanta Durga Prasad. All rights reserved.
//

import UIKit

class GuesserViewController: UIViewController {

    @IBOutlet weak var myguesserTF: UITextField!
    @IBOutlet weak var resultsLBL: UILabel!
    
    @IBAction func createNewProblemBTN(_ sender: Any) {
        resultsLBL.text = ""
        myguesserTF.text = ""
        Guesser.shared.createNewProblem()
        
        
        
    }
    @IBAction func amirightBTN(_ sender: Any) {
        
        if let value = Int(myguesserTF.text!){
            if value >= 1 && value <= 10
            {
                let output = Guesser.shared.amIRight(guess : value)
                if output == Result.correct{
                    resultsLBL.text = output.rawValue
                    displayMessage()
                    Guesser.shared.createNewProblem()
                }
                else{
                    resultsLBL.text = output.rawValue
                }
            }
            else{
                error()
            }
        }
            
        else{
            
            error()
            
        }
        
    }
        
    
func displayMessage(){
    
    let alert = UIAlertController(title: "Wonderful", message: "You got it in \(Guesser.shared.numAttempts) tries", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: nil))
    
    self.present(alert, animated: true, completion: nil)
    
}



func error(){
    
    let alert = UIAlertController(title: "No", message: "You have entered an value that is not valid.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: nil))
    
    self.present(alert, animated: true, completion: nil)
    
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Guesser.shared.createNewProblem()
        // Do any additional setup after loading the view, typically from a nib.
    }


}



