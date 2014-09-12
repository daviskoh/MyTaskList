import UIKit

// Note: anything written outside of class or func is within global scope (thus no need for singleton pattern?)

// defined instance of TaskManager
var taskMGR: TaskManager = TaskManager()

struct task {
    var name = "Un-Named"
    var desc = "Un-Described"
}

class TaskManager: NSObject {
    // array of type tasks
    var tasks = [task]()
    
    func addTask(name: String, desc: String) {
        // append new instance of task struct
        tasks.append(task(name: name, desc: desc))
    }
}
