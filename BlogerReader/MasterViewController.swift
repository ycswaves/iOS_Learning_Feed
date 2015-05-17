//
//  MasterViewController.swift
//  BlogerReader
//
//  Created by YCS on 16/5/15.
//  Copyright (c) 2015 ycswaves. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=76ahy5pc25p4v4f8tkqtkzb3&q=Toy+Story+3&page_limit=1")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, err) -> Void in
            
            if err != nil {
                println("error:", err)
            } else {
                //println(NSString(data:data, encoding: NSUTF8StringEncoding))
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                if jsonResult.count > 0 {
                    if let resultErr = jsonResult["error"] as? String {
                        println(resultErr)
                    }
                }
            }
        })
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            println("show detail")
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Test"
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

