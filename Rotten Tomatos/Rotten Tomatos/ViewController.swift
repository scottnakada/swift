//
//  ViewController.swift
//  Rotten Tomatos
//
//  Created by Scott Nakada on 3/29/17.
//  Copyright © 2017 Scott Nakada. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {

    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.rowHeight = 70.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView . dequeueReusableCellWithIdentifier("com.codepath.examplecell") as! MyCell
        cell.myCustomLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView,
                   didSelectRowAtIndexPath
        indexPath: NSIndexPath) {
            let vc = DetailViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

class MyCell: UITableViewCell
{
    
    @IBOutlet weak var myCustomLabel: UILabel!
}

class DetailViewController:
UIViewController {
    override func loadView() {
        let v = UIView(frame: CGRectZero)
        v.backgroundColor = UIColor.greenColor()
        self.view = v;
    }
}