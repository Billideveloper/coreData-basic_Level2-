//
//  ViewController.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 27/09/20.
//

import UIKit

class todoController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    
    let mytask = ["find Work" , "get a milk"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

}


extension todoController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mytask.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tasks", for: indexPath)
        cell.textLabel?.text = mytask[indexPath.row]
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }




}

