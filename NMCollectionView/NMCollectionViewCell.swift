//
//  NMCollectionViewCell.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 01/06/16.
//  Copyright © 2016 Nicolas Mahé. All rights reserved.
//

import UIKit

open class NMCollectionViewCell: UICollectionViewCell {
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  open class var identifier: String { fatalError("need implementation") }
  
  public weak var collectionViewController: NMCollectionViewController?
  public var indexPath: IndexPath?
  
  //----------------------------------------------------------------------------
  // MARK: - Helper
  //----------------------------------------------------------------------------
  
  /**
   Return the index of the cell by additionning all rows in previous sections
   */
  public var absoluteIndex: Int? {
    guard
      let indexPath = self.indexPath
      else { return nil }
    var rowsInPreviousSection = 0
    if indexPath.section > 0 {
      rowsInPreviousSection = (0...indexPath.section - 1).reduce(0) { (rows: Int, section: Int) -> Int in
        return rows + (self.collectionViewController?.collectionView?.numberOfItems(inSection: section) ?? 0)
      }
    }
    return rowsInPreviousSection + indexPath.row
  }
  
}
