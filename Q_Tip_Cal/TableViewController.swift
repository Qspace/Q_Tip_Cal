//
//  TableViewController.swift
//  Q_Tip_Cal
//
//  Created by MAC on 11/2/15.
//  Copyright © 2015 MAC. All rights reserved.
//

import UIKit

var tableData = [Dictionary<String,String>]()


class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if (NSUserDefaults.standardUserDefaults().objectForKey("billList") != nil) {
      tableData = NSUserDefaults.standardUserDefaults().objectForKey("billList") as! Array
      // reload data in table whenever view is showing
      tableView.reloadData()
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! BillTableViewCell
    cell.dateLabel.text = tableData[indexPath.row]["date"]
    cell.tipLabel.text = "$\(tableData[indexPath.row]["tip"]!)"
    cell.totalLabel.text = "$\(tableData[indexPath.row]["total"]!)"
    
    return cell
  }
  
  override func viewDidAppear(animated: Bool) {
    tableView.reloadData()
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    // perform User delete history bill Action
    if editingStyle == UITableViewCellEditingStyle.Delete {
      
      tableData.removeAtIndex(indexPath.row)
      tableView.reloadData()
      NSUserDefaults.standardUserDefaults().setObject(tableData, forKey: "billList")
    }
  }
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
