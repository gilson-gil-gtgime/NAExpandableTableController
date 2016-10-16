//
//  ExampleViewController.swift
//  NAExpandableTableController
//
//  Created by Nick A on 03/06/2016.
//  Copyright (c) 2016 Nick A. All rights reserved.
//

import UIKit
import NAExpandableTableController

class ExampleViewController: UITableViewController, NAExpandableTableViewDataSource, NAExpandableTableViewDelegate {

    /// Basic seed data for our example tableView
    let numberOfSections = 5
    let numberOfRowsInEachSection = 3
    let expandableSectionIndices = [0, 2, 3]

    /// Need to hold strong reference to our expandable table controller
    private var expandableTableController: NAExpandableTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First create our NAExpandableTableController instance
        self.expandableTableController = NAExpandableTableController(dataSource: self, delegate: self)
        self.expandableTableController.exclusiveExpand = false
        
        // Now assign it to our tableView's dataSource & delegate, that's it!
        tableView.dataSource = self.expandableTableController
        tableView.delegate = self.expandableTableController
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.reloadData()
    }

    // MARK: - NAExpandableTableViewDataSource
    
    func numberOfSectionsInExpandableTableView(_ tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func expandableTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInEachSection
    }
    
    func expandableTableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        // Configure cell here...
        cell.textLabel?.text = "Cell - section \(indexPath.section), row \(indexPath.row)"
        return cell
    }
    
    func expandableTableView(_ tableView: UITableView, titleCellForSection section: Int, expanded: Bool) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTitleCell")!
        // Configure cell here...
        cell.textLabel?.text = "SECTION \(section)"
        return cell
    }
    
    func expandableTableView(_ tableView: UITableView, isExpandableSection section: Int) -> Bool {
        return expandableSectionIndices.contains(section)
    }
    
    // MARK: - NAExpandableTableViewDelegate
    
    func expandableTableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("Cell selected - section \(indexPath.section), row \(indexPath.row)")
    }
    
    func expandableTableView(_ tableView: UITableView, didSelectTitleCellInSection section: Int) {
        print("Title cell selected - section \(section)")
    }
  
    func expandableTableView(_ tableView: UITableView, didExpandSection section: Int, expanded: Bool) {
        print("Section \(section) " + (expanded ? "expanded" : "collapsed"))
    }
}

