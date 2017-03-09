//
//  AddCategoryViewController.swift
//  GroceryWithFirebase
//
//  Created by Jonathan Edgar on 3/8/17.
//  Copyright © 2017 Jonathan Edgar. All rights reserved.
//

import UIKit
import FirebaseDatabase


class AddCategoryViewController: UIViewController {


    @IBOutlet weak var newCategoryField: UITextField!
    
    let category = Category()
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveToDatabase(_ sender: UIButton) {

        let category = Category()
        if let newCat = newCategoryField.text{
        category.title = newCat
        } else {
            print("not string")
        }
        
        ref?.child("Categories").childByAutoId().setValue(category.title)

        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
