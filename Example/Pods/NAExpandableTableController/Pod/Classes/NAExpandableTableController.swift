//
//  NAExpandableTableView.swift
//
//  Created by Nicholas Arciero on 3/5/16.
//

import UIKit

public protocol NAExpandableTableViewDataSource {
    /// Number of sections
    func numberOfExpandableSectionsInTableView(tableView: UITableView) -> Int
    
    /// Number of rows in section at index
    func expandableTableView(tableView: UITableView, numberOfRowsInExpandableSection section: Int) -> Int
    
    /// Equivalent to UITableView's cellForRowAtIndexPath - called for all cells except the section title cell (the one that toggles expansion)
    func expandableTableView(tableView: UITableView, section: Int, cellForRow row: Int) -> UITableViewCell
    
    /// Equivalent to UITableView's cellForRowAtIndexPath - called only for section title cell (the one that toggles expansion)
    func expandableTableView(tableView: UITableView, titleCellForSection section: Int, expanded: Bool) -> UITableViewCell
}

@objc public protocol NAExpandableTableViewDelegate {
    
    /// Equivalent to UITableView didSelectCell delegate method
    func expandableTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    
    /**
     Called when a section is expanded/collapsed.
     - Parameter section: Index of section being expanded/collapsed
     - Parameter expanded: True if section is being expanded, false if being collapsed
     */
    optional func expandableTableView(tableView: UITableView, didExpandSection section: Int, expanded: Bool)
}

public class NAExpandableTableController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public var dataSource: NAExpandableTableViewDataSource?
    public var delegate: NAExpandableTableViewDelegate?
    
    private var expandDict = [Int : Bool]()
    
    public init(dataSource: NAExpandableTableViewDataSource? = nil, delegate: NAExpandableTableViewDelegate? = nil) {
        super.init()
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    // MARK: - UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataSource?.numberOfExpandableSectionsInTableView(tableView) ?? 0
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Hide headers
        return 0
    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRectZero)
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.expandDict[section] ?? false {
            return 1 + (self.dataSource?.expandableTableView(tableView, numberOfRowsInExpandableSection: section) ?? 0)
        }
        
        return 1
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let dataSource = self.dataSource else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            return dataSource.expandableTableView(tableView, titleCellForSection: indexPath.section, expanded: self.expandDict[indexPath.section] ?? false)
        }
        
        return dataSource.expandableTableView(tableView, section: indexPath.section, cellForRow: indexPath.row)
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Check if the first cell in the section
        if indexPath.row == 0 {
            //
            if self.expandDict[indexPath.section] ?? false {
                self.collapseSection(tableView, section: indexPath.section)
            } else {
                self.expandSection(tableView, section: indexPath.section)
            }
            
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
        }
        
        self.delegate?.expandableTableView(tableView, didSelectRowAtIndexPath: indexPath)
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
    }
    
    internal func expandSection(tableView: UITableView, section: Int) {
        self.expandDict[section] = true
        tableView.beginUpdates()
        
        var indexPaths = [NSIndexPath]()
        if let rows = self.dataSource?.expandableTableView(tableView, numberOfRowsInExpandableSection: section) {
            for rowIndex in 1...rows {
                indexPaths.append(NSIndexPath(forRow: rowIndex, inSection: section))
            }
        }
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .None)
        tableView.endUpdates()
        
        self.delegate?.expandableTableView?(tableView, didExpandSection: section, expanded: true)
    }
    
    internal func collapseSection(tableView: UITableView, section: Int) {
        self.expandDict[section] = false
        tableView.beginUpdates()
        
        var indexPaths = [NSIndexPath]()
        if let rows = self.dataSource?.expandableTableView(tableView, numberOfRowsInExpandableSection: section) {
            for rowIndex in 1...rows {
                indexPaths.append(NSIndexPath(forRow: rowIndex, inSection: section))
            }
        }
        
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .None)
        tableView.endUpdates()
        
        self.delegate?.expandableTableView?(tableView, didExpandSection: section, expanded: false)
    }
}