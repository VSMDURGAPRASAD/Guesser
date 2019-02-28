//
//  SecondViewController.swift
//  Guesser
//
//  Created by Vinukonda,Sai Manikanta Durga Prasad on 2/26/19.
//  Copyright © 2019 Vinukonda,Sai Manikanta Durga Prasad. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var HistoryTableView: UITableView!
    
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return Guesser.shared.numGuesses()
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "history")!
            
            cell.textLabel?.text = "Correct Answer: " + String(Guesser.shared[indexPath.row].correctAnswer)
            
            cell.detailTextLabel?.text = "# Attempts:" + String(Guesser.shared[indexPath.row].numAttemptsRequired)
            
            return cell
            
        }
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
            
        }
        
    
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            HistoryTableView.dataSource = self
            
            HistoryTableView.delegate = self
            
            // Do any additional setup after loading the view, typically from a nib.
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            
            HistoryTableView.reloadData()
            
        }
        
    }




