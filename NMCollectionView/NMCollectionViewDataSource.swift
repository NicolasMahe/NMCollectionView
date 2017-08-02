//
//  NMCollectionViewDataSource.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 01/06/16.
//  Copyright © 2016 Nicolas Mahé. All rights reserved.
//

import UIKit

open class NMCollectionViewDataSource: NSObject, UICollectionViewDataSource {
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  /**
   Array of all cell init from these collection view controller
   */
  public var collectionViewCells = [NMCollectionViewCell?]()
  
  /**
   The array of BaseTableViewCellData
   */
  public var cellsData: [NMCollectionViewCellData]
  
  /**
   Table View Controller
   */
  weak var collectionViewController: NMCollectionViewController?
  
  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------
  
  /**
   Add a BaseTableViewCellData to the controller
   */
  public init(
    collectionViewController: NMCollectionViewController,
    data: [NMCollectionViewCellData]
  ) {
    self.cellsData = data
    
    super.init()
    
    self.collectionViewController = collectionViewController
    data.forEach { (cellData: NMCollectionViewCellData) in
      collectionViewController.registerCell(cellData.cellClass)
      if let extraCells = cellData.extraCells {
        collectionViewController.registerCell(extraCells.cellClass)
      }
    }
  }
  
  //----------------------------------------------------------------------------
  // MARK: - Delegate
  //----------------------------------------------------------------------------
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.cellsData.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let cellData = self.cellsData[section]
    return cellData.numberOfItems() + (cellData.extraCells?.numberOfItems() ?? 0)
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cellData = self.cellsData[indexPath.section].cellData(for: indexPath)
    
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: cellData.cellClass.identifier,
      for: indexPath
    ) as! NMCollectionViewCell
    
    cell.collectionViewController = self.collectionViewController
    cell.indexPath = indexPath
    
    let appendCellToCells = { [weak cell] () -> Void in
      self.collectionViewCells.append(cell)
    }
    appendCellToCells()
    
    cellData.config(cell, indexPath)
    
    return cell
  }

}
