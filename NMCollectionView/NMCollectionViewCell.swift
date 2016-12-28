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
  
}
