//
//  DetailViewController.swift
//  BlogerReader
//
//  Created by YCS on 16/5/15.
//  Copyright (c) 2015 ycswaves. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

