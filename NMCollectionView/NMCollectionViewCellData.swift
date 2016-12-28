//
//  NMCollectionViewCellData.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 01/06/16.
//  Copyright © 2016 Nicolas Mahé. All rights reserved.
//

import UIKit

open class NMCollectionViewCellData {

  var numberOfItems: () -> Int
  public var cellClass: NMCollectionViewCell.Type
  var config: (_ cell: NMCollectionViewCell, _ indexPath: IndexPath) -> Void
  var didSelect: (_ cell: NMCollectionViewCell, _ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void
  
  /**
   Classic init
   */
  public init<T: NMCollectionViewCell>(
    cellClass: T.Type,
    numberOfItems: @escaping () -> Int,
    config: ((_ cell: T, _ indexPath: IndexPath) -> Void)? = nil,
    didSelect: ((_ cell: T, _ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void)? = nil
  ) {
    self.cellClass = cellClass
    self.numberOfItems = numberOfItems
    
    self.config = { (cell: NMCollectionViewCell, indexPath: IndexPath) -> Void in
      let cell = cell as! T
      config?(cell, indexPath)
    }
    
    self.didSelect = { (cell: NMCollectionViewCell, collectionView: UICollectionView, indexPath: IndexPath) -> Void in
      let cell = cell as! T
      didSelect?(cell, collectionView, indexPath)
    }

  }

}
