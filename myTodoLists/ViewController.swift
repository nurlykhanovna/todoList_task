//
//  ViewController.swift
//  myTodoLists
//
//
//  Created by Alima Seytkhan on 6/29/18.
//  Copyright © 2017 moon inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeCategoryBTN: UIButton!
    @IBOutlet weak var callCategoryBTN: UIButton!
    @IBOutlet weak var shopcartCategoryBTN: UIButton!
    @IBOutlet weak var planeCategoryBTN: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dataPickerView: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    var titleText: String?
    var dateInfo: String?

    var currentName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: realization of category buttons, to change images
    @IBAction func homeCategoryBTNpressed(_ sender: UIButton) {
        homeCategoryBTN.isSelected = true
        callCategoryBTN.isSelected = false
        planeCategoryBTN.isSelected = false
        shopcartCategoryBTN.isSelected = false
    }

    @IBAction func callCategoryBTNpressed(_ sender: UIButton) {
        homeCategoryBTN.isSelected = false
        callCategoryBTN.isSelected = true
        planeCategoryBTN.isSelected = false
        shopcartCategoryBTN.isSelected = false
    }
    @IBAction func shopcartBTNpressed(_ sender: UIButton) {
        homeCategoryBTN.isSelected = false
        callCategoryBTN.isSelected = false
        planeCategoryBTN.isSelected = false
        shopcartCategoryBTN.isSelected = true
    }

    @IBAction func planeBTNpressed(_ sender: UIButton) {
        homeCategoryBTN.isSelected = false
        callCategoryBTN.isSelected = false
        planeCategoryBTN.isSelected = true
        shopcartCategoryBTN.isSelected = false
    }
    
    @IBAction func dataPickerVIew(_ sender: UIDatePicker) {
        dateInfo = String(describing: dataPickerView.date)
    }
    
    func savingTodo() {
        
        if homeCategoryBTN.isSelected == true {
            currentName = "homeBTN.png"
        } else if callCategoryBTN.isSelected == true {
            currentName = "callBTNstate.png"
        } else if shopcartCategoryBTN.isSelected == true {
            currentName = "cartBTNstate.png"
        } else if planeCategoryBTN.isSelected == true {
            currentName = "planeBTNstate.png"
        }
        
        titleText = titleTextField.text
        
        let task = "\(titleText!)_\(dateInfo!)_\(currentName)"
        
        var arr = UserDefaults.standard.array(forKey: "data")
        
        if arr == nil {
            arr = [String]()
            arr?.append(task)
        } else {
            arr?.append(task)
        }
        // save
        UserDefaults.standard.set(arr, forKey: "data")
        
    }
    
    @IBAction func doneBTNpressed(_ sender: UIButton) {
        
        savingTodo()
        navigationController?.popViewController(animated: true)
    }
    
}

