//
//  NAExpandableTableView.swift
//
//  Created by Nicholas Arciero on 3/5/16.
//

import UIKit

@objc public protocol NAExpandableTableViewDataSource {
    /// Number of sections
    func numberOfSectionsInExpandableTableView(tableView: UITableView) -> Int
    
    /// Number of rows in section at index
    func expandableTableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    /// Equivalent to UITableView's cellForRowAtIndexPath - called for all cells except the section title cell (the one that toggles expansion)
    func expandableTableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    
    /// Equivalent to UITableView's cellForRowAtIndexPath - called only for section title cell (the one that toggles expansion)
    func expandableTableView(tableView: UITableView, titleCellForSection section: Int, expanded: Bool) -> UITableViewCell
    
    /// Indicates whether `section` is expandable or not.
    optional func expandableTableView(tableView: UITableView, isExpandableSection section: Int) -> Bool
    
    /// The height of cells within an expandable section
    optional func expandableTableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    
    /// The height of the expandable section title cell
    optional func expandableTableView(tableView: UITableView, heightForTitleCellInSection section: Int) -> CGFloat
  
    optional func expandableTableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?
  
    optional func expandableTableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
  
    optional func expandableTableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
  
    optional func expandableTableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
}

@objc public protocol NAExpandableTableViewDelegate {
  
    /// Equivalent to UITableView didSelectRowAtIndexPath delegate method. Called whenever a cell within a section is selected. This is NOT called when a section title cell is selected.
    optional func expandableTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    
    /// Called when a section title cell is selected
    optional func expandableTableView(tableView: UITableView, didSelectTitleCellInSection section: Int)
    
    /**
     Called when a section is expanded/collapsed.
     - Parameter section: Index of section being expanded/collapsed
     - Parameter expanded: True if section is being expanded, false if being collapsed
     */
    optional func expandableTableView(tableView: UITableView, didExpandSection section: Int, expanded: Bool)
  
    optional func expandableTableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)
  
    optional func expandableTableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
  
    optional func expandableTableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
  
    optional func expandableTableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
  
    optional func expandableTableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
  
    optional func expandableTableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
  
    optional func expandableTableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool
  
    optional func expandableTableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
  
    optional func expandableTableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
  
    optional func expandableTableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
  
    optional func expandableTableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String?
  
    optional func expandableTableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
  
    optional func expandableTableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool
  
    optional func expandableTableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath)
  
    optional func expandableTableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath
  
    optional func expandableTableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int
  
    optional func expandableTableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool
  
    optional func expandableTableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool
  
    optional func expandableTableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
  
    optional func expandableTableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool
  
    @available(iOS 9.0, *)
    optional func expandableTableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool
  
    @available(iOS 9.0, *)
    optional func expandableTableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
  
    optional func indexPathForPreferredFocusedViewInExpandableTableView(tableView: UITableView) -> NSIndexPath?
}

@objc public protocol NAExpandableScrollViewDelegate {
  optional func expandableScrollViewDidScroll(scrollView: UIScrollView)
  
  optional func expandableScrollViewDidZoom(scrollView: UIScrollView)
  
  optional func expandableScrollViewWillBeginDragging(scrollView: UIScrollView)
  
  optional func expandableScrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
  
  optional func expandableScrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool)
  
  optional func expandableScrollViewWillBeginDecelerating(scrollView: UIScrollView)
  
  optional func expandableScrollViewDidEndDecelerating(scrollView: UIScrollView)
  
  optional func expandableScrollViewDidEndScrollingAnimation(scrollView: UIScrollView)
  
  optional func viewForZoomingInExpandableScrollView(scrollView: UIScrollView) -> UIView?
  
  optional func expandableScrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?)
  
  optional func expandableScrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat)
  
  optional func expandableScrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool
  
  optional func expandableScrollViewDidScrollToTop(scrollView: UIScrollView)
}

public class NAExpandableTableController: NSObject, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
  
    /// Default height to use for all cells (44)
    public var defaultRowHeight: CGFloat = 44
  
    /// Determines if multiple sections can be expanded at the same time. If set to `true`, then only one section can be expanded at a time. If a section is expanded and you try to expand another section, the first one will be collapsed.
    public var exclusiveExpand: Bool = false
    
    public weak var dataSource: NAExpandableTableViewDataSource?
    public weak var delegate: NAExpandableTableViewDelegate?
    public weak var scrollViewDelegate: NAExpandableScrollViewDelegate?
  
    /// Keeps track of which section indices are expanded
    private var expandDict = [Int: Bool]()
    
    public init(dataSource: NAExpandableTableViewDataSource? = nil, delegate: NAExpandableTableViewDelegate? = nil) {
        super.init()
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    // MARK: - UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource?.numberOfSectionsInExpandableTableView(tableView) ?? 0
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return dataSource?.expandableTableView?(tableView, heightForTitleCellInSection: indexPath.section) ?? defaultRowHeight
        }
        
        return dataSource?.expandableTableView?(tableView, heightForRowAtIndexPath: indexPath) ?? defaultRowHeight
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Hide headers
        return 0
    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRectZero)
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandDict[section] ?? false {
            return 1 + (dataSource?.expandableTableView(tableView, numberOfRowsInSection: section) ?? 0)
        }
        
        return 1
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let dataSource = self.dataSource else {
            return UITableViewCell()
        }
        
        let expandable = dataSource.expandableTableView?(tableView, isExpandableSection: indexPath.section) ?? true
        if indexPath.row == 0 && expandable {
            return dataSource.expandableTableView(tableView, titleCellForSection: indexPath.section, expanded: expandDict[indexPath.section] ?? false)
        }
        
        let rowIndexPath = expandable ? NSIndexPath(forRow: indexPath.row - 1, inSection: indexPath.section) : indexPath
        return dataSource.expandableTableView(tableView, cellForRowAtIndexPath: rowIndexPath)
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Check if the first cell in the section
        let expandable = dataSource?.expandableTableView?(tableView, isExpandableSection: indexPath.section) ?? true
        if indexPath.row == 0 && expandable {
            // Check if this section is already expanded, if so then collapse it
            if expandDict[indexPath.section] ?? false {
                collapseSection(tableView, section: indexPath.section)
            } else {
                // If exclusiveExpand is true, then collapse any expanded sections
                if exclusiveExpand {
                    for (section, expanded) in expandDict where expanded {
                        collapseSection(tableView, section: section)
                    }
                }
                expandSection(tableView, section: indexPath.section)
            }
            
            delegate?.expandableTableView?(tableView, didSelectTitleCellInSection: indexPath.section)
        } else {
            // Need to decrement indexPath.row by 1 because the first row is the title cell
            let rowIndexPath = NSIndexPath(forRow: indexPath.row - 1, inSection: indexPath.section)
            delegate?.expandableTableView?(tableView, didSelectRowAtIndexPath: rowIndexPath)
        }
    }
    
    internal func expandSection(tableView: UITableView, section: Int) {
        expandDict[section] = true
        tableView.beginUpdates()
        
        var indexPaths = [NSIndexPath]()
        if let rows = dataSource?.expandableTableView(tableView, numberOfRowsInSection: section) {
            for rowIndex in 1...rows {
                indexPaths.append(NSIndexPath(forRow: rowIndex, inSection: section))
            }
        }
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .None)
        tableView.endUpdates()
        
        delegate?.expandableTableView?(tableView, didExpandSection: section, expanded: true)
    }
    
    internal func collapseSection(tableView: UITableView, section: Int) {
        expandDict[section] = false
        tableView.beginUpdates()
        
        var indexPaths = [NSIndexPath]()
        if let rows = dataSource?.expandableTableView(tableView, numberOfRowsInSection: section) {
            for rowIndex in 1...rows {
                indexPaths.append(NSIndexPath(forRow: rowIndex, inSection: section))
            }
        }
        
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .None)
        tableView.endUpdates()
        
        delegate?.expandableTableView?(tableView, didExpandSection: section, expanded: false)
    }
}

// MARK: Other UITableView DataSource methods default implementation
extension NAExpandableTableController {
  public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return dataSource?.expandableTableView?(tableView, titleForFooterInSection: section)
  }
  
  public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return dataSource?.expandableTableView?(tableView, canEditRowAtIndexPath: indexPath) ?? false
  }
  
  public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return dataSource?.expandableTableView?(tableView, canMoveRowAtIndexPath: indexPath) ?? false
  }
  
  public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    dataSource?.expandableTableView?(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    dataSource?.expandableTableView?(tableView, moveRowAtIndexPath: sourceIndexPath, toIndexPath: destinationIndexPath)
  }
}

// MARK: Other UITableView DataSource methods default implementation
extension NAExpandableTableController {
  public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
    delegate?.expandableTableView?(tableView, willDisplayFooterView: view, forSection: section)
  }
  
  public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, didEndDisplayingCell: cell, forRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
    delegate?.expandableTableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
  }
  
  public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return delegate?.expandableTableView?(tableView, heightForFooterInSection: section) ?? 0
  }
  
  public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return delegate?.expandableTableView?(tableView, estimatedHeightForRowAtIndexPath: indexPath) ?? defaultRowHeight
  }
  
  public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
    return delegate?.expandableTableView?(tableView, estimatedHeightForFooterInSection: section) ?? 0
  }
  
  public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return delegate?.expandableTableView?(tableView, viewForFooterInSection: section)
  }
  
  public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, accessoryButtonTappedForRowWithIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return delegate?.expandableTableView?(tableView, shouldHighlightRowAtIndexPath: indexPath) ?? false
  }
  
  public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, didHighlightRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, didUnhighlightRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return delegate?.expandableTableView?(tableView, willSelectRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return delegate?.expandableTableView?(tableView, willDeselectRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, didDeselectRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    return delegate?.expandableTableView?(tableView, editingStyleForRowAtIndexPath: indexPath) ?? .None
  }
  
  public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
    return delegate?.expandableTableView?(tableView, titleForDeleteConfirmationButtonForRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    return delegate?.expandableTableView?(tableView, editActionsForRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return delegate?.expandableTableView?(tableView, shouldIndentWhileEditingRowAtIndexPath: indexPath) ?? false
  }
  
  public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, willBeginEditingRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
    delegate?.expandableTableView?(tableView, didEndEditingRowAtIndexPath: indexPath)
  }
  
  public func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
    return delegate?.expandableTableView?(tableView, targetIndexPathForMoveFromRowAtIndexPath: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? sourceIndexPath
  }
  
  public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
    return delegate?.expandableTableView?(tableView, indentationLevelForRowAtIndexPath: indexPath) ?? 0
  }
  
  public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return delegate?.expandableTableView?(tableView, shouldShowMenuForRowAtIndexPath: indexPath) ?? false
  }
  
  public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return delegate?.expandableTableView?(tableView, canPerformAction: action, forRowAtIndexPath: indexPath, withSender: sender) ?? false
  }
  
  public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    delegate?.expandableTableView?(tableView, performAction: action, forRowAtIndexPath: indexPath, withSender: sender)
  }
  
  public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return delegate?.expandableTableView?(tableView, canFocusRowAtIndexPath: indexPath) ?? false
  }
  
  @available(iOS 9.0, *)
  public func tableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool {
    return delegate?.expandableTableView?(tableView, shouldUpdateFocusInContext: context) ?? false
  }
  
  @available(iOS 9.0, *)
  public func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
    delegate?.expandableTableView?(tableView, didUpdateFocusInContext: context, withAnimationCoordinator: coordinator)
  }
  
  public func indexPathForPreferredFocusedViewInTableView(tableView: UITableView) -> NSIndexPath? {
    return delegate?.indexPathForPreferredFocusedViewInExpandableTableView?(tableView)
  }
}

// MARK: Other UITableView DataSource methods default implementation
extension NAExpandableTableController {
  public func scrollViewDidScroll(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewDidScroll?(scrollView)
  }
  
  public func scrollViewDidZoom(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewDidZoom?(scrollView)
  }
  
  public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewWillBeginDragging?(scrollView)
  }
  
  public func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    scrollViewDelegate?.expandableScrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
  }
  
  public func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    scrollViewDelegate?.expandableScrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
  }
  
  public func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewWillBeginDecelerating?(scrollView)
  }
  
  public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewDidEndDecelerating?(scrollView)
  }
  
  public func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewDidEndScrollingAnimation?(scrollView)
  }
  
  public func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return scrollViewDelegate?.viewForZoomingInExpandableScrollView?(scrollView)
  }
  
  public func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
    scrollViewDelegate?.expandableScrollViewWillBeginZooming?(scrollView, withView: view)
  }
  
  public func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
    scrollViewDelegate?.expandableScrollViewDidEndZooming?(scrollView, withView: view, atScale: scale)
  }
  
  public func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
    return scrollViewDelegate?.expandableScrollViewShouldScrollToTop?(scrollView) ?? true
  }
  
  public func scrollViewDidScrollToTop(scrollView: UIScrollView) {
    scrollViewDelegate?.expandableScrollViewDidScrollToTop?(scrollView)
  }
}
