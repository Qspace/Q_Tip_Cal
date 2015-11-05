//
//  SettingViewController.swift
//  Q_Tip_Cal
//
//  Created by MAC on 11/2/15.
//  Copyright © 2015 MAC. All rights reserved.
//

import UIKit

var tipIndex = 0

class SettingViewController: UIViewController {
    
    
    @IBOutlet var tipPercentDefaultSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    tipIndex = NSUserDefaults.standardUserDefaults().integerForKey("DefaultTipPerCent")
    tipPercentDefaultSegment.selectedSegmentIndex = tipIndex

  }
    
    @IBAction func defaultTipValueChanged(sender: AnyObject) {
        tipIndex = tipPercentDefaultSegment.selectedSegmentIndex
//        NSUserDefaults.standardUserDefaults().setObject(tipIndex, forKey: "DefaultTipPerCent")
      NSUserDefaults.standardUserDefaults().setInteger(tipIndex, forKey: "DefaultTipPerCent")
      NSUserDefaults.standardUserDefaults().synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
