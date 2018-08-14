//
//  ViewController.swift
//  RadioOnline
//
//  Created by student on 8/14/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import SwipeCellKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet var tableView: UITableView!
    
    var radioStation = ["Rock FM", "Kiss Fm", "Avto Radio", "101,3 FM", "Radio 90h"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nib = UINib(nibName: "MyCustomCell", bundle: nil)
//        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (radioStation.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = radioStation[indexPath.row]
//
//
//        return(cell)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
        
        cell.nameLabel.text = radioStation[indexPath.row]
        cell.descriptionLabel.text = "gggggggg"
        
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let flagAction = self.contextualToggleFlagAction(forRowAtIndexPath: indexPath)
        let swipeConfig = UISwipeActionsConfiguration(actions: [flagAction])
        return swipeConfig
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = self.contextualDeleteAction(forRowAtIndexPath: indexPath)
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfig
    }
    
    func contextualToggleFlagAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Flag") { (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
            
            if self.addFavorites(indexPath) {
                completionHandler(true)
            } else {
                completionHandler(false)
            }
            
        }
        action.image = UIImage(named: "favorites")
        return action
    }
    func contextualDeleteAction(forRowAtIndexPath indexPath: IndexPath)-> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
            
            if self.deleteRadiostation(indexPath) {
                completionHandler(true)
                self.tableView.reloadData()
            } else {
                completionHandler(false)
            }
            
        }
        action.image = UIImage(named: "delete")
        return action
        
    }
    
    func deleteRadiostation(_ indexPath: IndexPath) -> Bool{
        if indexPath.row <= radioStation.count {
            radioStation.remove(at: indexPath.row)
            return true
        } else {
            print("error deleting radiostation")
            return false
        }
        
    }
    
    func addFavorites(_ indexPath: IndexPath) -> Bool{
        let c = tableView.cellForRow(at: indexPath)
        c?.backgroundColor = UIColor.yellow
        return true
    }


    


}

