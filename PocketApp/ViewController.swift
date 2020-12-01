//
//  ViewController.swift
//  PocketApp
//
//  Created by marvin evins on 11/30/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var tableView: UITableView!
    
    //var stateArray: [StateData] = []
    
    var coronaData = CoronaData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
        
        tableView.delegate = self
        tableView.dataSource = self
        
        coronaData.getData {
            DispatchQueue.main.async{
                self.tableView.reloadData()
                
            }
        }
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coronaData.stateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = coronaData.stateArray[indexPath.row].state
        cell.detailTextLabel?.text = "\(coronaData.stateArray[indexPath.row].positive)"
        
        return cell
    }

}

