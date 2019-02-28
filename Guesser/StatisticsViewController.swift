//
//  StatisticsViewController.swift
//  Guesser
//
//  Created by Vinukonda,Sai Manikanta Durga Prasad on 2/28/19.
//  Copyright © 2019 Vinukonda,Sai Manikanta Durga Prasad. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    
    @IBOutlet weak var minLBL: UILabel!
    @IBOutlet weak var maxLBL: UILabel!
    @IBOutlet weak var meanLBL: UILabel!
    @IBOutlet weak var stddevLBL: UILabel!
    @IBAction func clearBTN(_ sender: Any) {
        minLBL.text = "0"
        maxLBL.text = "0"
        meanLBL.text = "0"
        stddevLBL.text = "0"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        labels()
    }
    func labels(){
        minLBL.text = String(Guesser.shared.minimumNumAttempts())
        maxLBL.text = String(Guesser.shared.maximumNumAttempts())
        var incrementedValue = 0
        for i in 0..<Guesser.shared.numGuesses(){
            incrementedValue += Guesser.shared.guess(index: i).numAttemptsRequired
        }
        
        let meanValue = Double(incrementedValue)/Double(Guesser.shared.numGuesses())
        meanLBL.text = "\(meanValue)"
        
        var sumTotal = 0.0
        for i in 0..<Guesser.shared.numGuesses(){
            sumTotal += pow(Double(Guesser.shared.guess(index: i).numAttemptsRequired) - meanValue, 2)
        }
        
        stddevLBL.text = "\(sumTotal/Double(Guesser.shared.numGuesses()))"
        
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
