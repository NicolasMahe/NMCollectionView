//
//  NMCollectionViewCellData.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 01/06/16.
//  Copyright © 2016 Nicolas Mahé. All rights reserved.
//

import UIKit
import PromiseKit

open class NMCollectionViewCellData {

  public var numberOfItems: () -> Int
  public var cellClass: NMCollectionViewCell.Type
  public var config: (_ cell: NMCollectionViewCell, _ indexPath: IndexPath) -> Void
  public var didSelect: (_ cell: NMCollectionViewCell, _ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void
  public var extraCells: NMCollectionViewCellData?
  
  /**
   Classic init
   */
  public init<T: NMCollectionViewCell>(
    cellClass: T.Type,
    numberOfItems: @escaping (() -> Int) = { (_) -> Int in return 1 },
    config: ((_ cell: T, _ indexPath: IndexPath) -> Void)? = nil,
    didSelect: ((_ cell: T, _ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void)? = nil,
    extraCells: NMCollectionViewCellData? = nil
  ) {
    self.cellClass = cellClass
    self.numberOfItems = numberOfItems
    self.extraCells = extraCells
    self.config = { (cell: NMCollectionViewCell, indexPath: IndexPath) -> Void in
      let cell = cell as! T
      config?(cell, indexPath)
    }
    self.didSelect = { (cell: NMCollectionViewCell, collectionView: UICollectionView, indexPath: IndexPath) -> Void in
      let cell = cell as! T
      didSelect?(cell, collectionView, indexPath)
    }
  }
  
  public func cellData(for indexPath: IndexPath) -> NMCollectionViewCellData {
    // is it a extraCell?
    if let extraCells = self.extraCells,
      indexPath.row >= self.numberOfItems() {
      return extraCells
    }
    return self
  }
  
  /**
   This function force the data to be refreshed.
   Nothing to do is this class
   */
  open func reloadData() -> Promise<Void> {
    return Promise(value: ())
  }

}
