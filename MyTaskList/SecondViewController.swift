//
//  SecondViewController.swift
//  MyTaskList
//
//  Created by Davis Koh on 9/12/14.
//  Copyright (c) 2014 daviskoh. All rights reserved.
//

import UIKit

// Both task name & desc text input fields use same delegate (SecondViewController)

class SecondViewController: UIViewController, UITextFieldDelegate {
    // NOTE: ! - declare var but not yet set it (set to null until set in code)
    
    // Create references to input boxes from view
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Events
    @IBAction func btnAddTask_Click(sender: UIButton) {
        taskMGR.addTask(txtTask.text, desc: txtDesc.text)
        
        // hide keyboard if open
        self.view.endEditing(true)
        
        // clear text input boxes
        txtTask.text = ""
        txtDesc.text = ""
        
        // jump user back to task list
        self.tabBarController?.selectedIndex = 0
    }
    
    /**
     * IOS Touch Functions
     */
    
    // make keyboard disappear when clicking away from input box
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    // UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

