//
//  FeedViewController.swift
//  AC3.2-Final
//
//  Created by John Gabriel Breshears on 2/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import Firebase
class FeedViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var ref: FIRDatabaseReference!
    fileprivate var _refHandle: FIRDatabaseHandle!
    var messages: [FIRDataSnapshot]! = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        configureDataBase()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // remember to cast custom cell at end of indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        
        return cell
    }
    // MARK: - FireBase
    
    func configureDataBase(){
        ref = FIRDatabase.database().reference()
        _refHandle = ref.child("ac-32-final").observe(.childAdded, with: { (snapshot: FIRDataSnapshot) in
            self.messages.append(snapshot)
            
        })
        
    }
    
}
