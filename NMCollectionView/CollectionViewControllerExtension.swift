//
//  CollectionViewControllerExtension.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 04/09/2017.
//
//

import UIKit

extension UICollectionViewController {

  /**
   Return the sum of number of cells of all sections
   */
  public var totalNumberOfCells: Int? {
    guard let collectionView = self.collectionView
      else { return nil }
    return (0...collectionView.numberOfSections - 1).reduce(0) { (prev: Int, actual: Int) -> Int in
      return prev + collectionView.numberOfItems(inSection: actual)
    }
  }

}
