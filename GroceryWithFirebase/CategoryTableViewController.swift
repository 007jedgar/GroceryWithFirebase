//
//  CategoryTableViewController.swift
//  GroceryWithFirebase
//
//  Created by Jonathan Edgar on 3/8/17.
//  Copyright © 2017 Jonathan Edgar. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class CategoryTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference!
    var categories = [Category]()
    let category = Category()
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        
    }
    private func populateTable() {
    let ref = FIRDatabase.database().reference(withPath: "Categories")
        ref.observe(.value) { (snapshot :FIRDataSnapshot) in
        
            for snap in snapshot.children{
                let snapShotValue = (snap as! FIRDataSnapshot).value
                let snapShotDictionary = snapShotValue as! [String:Any]
                
                let catTitle = snapShotDictionary["Categories"] as! String
                self.category.title = catTitle
                self.categories.append(self.category)
                
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
}
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = self.categories[indexPath.row]
        cell.textLabel?.text = category.title
        return cell
    }
}
 

 
    
    
    
    








