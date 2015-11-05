//
//  ViewController.swift
//  Q_Tip_Cal
//
//  Created by MAC on 11/1/15.
//  Copyright © 2015 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var billAmount = 0.0
  var tip = 0.0
  var total = 0.0
  
  @IBOutlet var saveButton: UIBarButtonItem!
  
  @IBOutlet var tipPercentSegment: UISegmentedControl!
  
  @IBOutlet var billField: UITextField!
  
  @IBOutlet var tipLabel: UILabel!
  
  @IBOutlet var totalLabel: UILabel!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //Set animation
    tipLabel.alpha = 0
    totalLabel.alpha = 1
    
    //show keyboard whenever app start
    billField.becomeFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    tipIndex = NSUserDefaults.standardUserDefaults().integerForKey("DefaultTipPerCent")
    tipPercentSegment.selectedSegmentIndex = tipIndex
    if (NSUserDefaults.standardUserDefaults().objectForKey("billTextField") != nil) {
      billField.text = NSUserDefaults.standardUserDefaults().objectForKey("billTextField") as! String
    }
    updateResultValue()
  }
  
  @IBAction func onEditingChanged(sender: AnyObject) {
    updateResultValue()
  }
  
  
  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }
  
  // Update the value of tipLabel and totalLabel
  func updateResultValue() {
    saveButton.enabled = false
    let tipPercentArr = [0.18, 0.20, 0.22]
    let tipPercent = tipPercentArr[tipPercentSegment.selectedSegmentIndex]
    if billField.text! != "" {
      //save data when swap between view controller and when app stop without saving bill
      NSUserDefaults.standardUserDefaults().setObject(billField.text, forKey: "billTextField")
      NSUserDefaults.standardUserDefaults().synchronize()
      billAmount = Double(billField.text!)!
      saveButton.enabled = true
      UIView.animateWithDuration(0.5, animations: { () -> Void in
        self.tipLabel.alpha = 1
        self.totalLabel.alpha = 1
      })
      
    }
    else {
      UIView.animateWithDuration(0.5, animations: { () -> Void in
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
      })
    }
    print(billAmount)
    tip = billAmount * tipPercent
    total = billAmount + tip
    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
    
    
  }
  
  
  @IBAction func saveBill(sender: AnyObject) {
    let date: NSDate = NSDate()
    tableData.append(["date": "\(date)", "tip": "\(tip)", "total": "\(total)"])
    NSUserDefaults.standardUserDefaults().setObject(tableData, forKey: "billList")
    
  }
  
}

