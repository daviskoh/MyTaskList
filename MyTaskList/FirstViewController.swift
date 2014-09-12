//
//  FirstViewController.swift
//  MyTaskList
//
//  Created by Davis Koh on 9/12/14.
//  Copyright (c) 2014 daviskoh. All rights reserved.
//

import UIKit

// NOTE: FirstViewController must conform to UITableViewDataSource protocol
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // reference to table
    @IBOutlet var tblTasks: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Returning to view
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    // delete functionality on table
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // if delete button is tapped after swiping on row
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            taskMGR.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
    }

    /**
     * UITableViewDataSource protocol requirements
     */
    
    // returns number of rows to render
    // loop last func that many times
    // plot out info from array
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // NOTE: remember that because taskMGR was instantiated in the global scope,
        // it is available here
        return taskMGR.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        // main text used for cell
        cell.textLabel?.text = taskMGR.tasks[indexPath.row].name
        
        /**
         * tutorial uses below but it is deprecated as os IOS7
         * cell.text = taskMGR.tasks[indexPath.row].name
         * cell.detailTextLabel.text = taskMGR.tasks[indexPath.row].desc
         */
        
        cell.detailTextLabel?.text = taskMGR.tasks[indexPath.row].desc
        
        return cell
    }
}

