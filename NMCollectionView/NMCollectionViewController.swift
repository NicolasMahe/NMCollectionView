//
//  NMCollectionViewController.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 01/06/16.
//  Copyright © 2016 Nicolas Mahé. All rights reserved.
//

import UIKit
import RZCellSizeManager
import SnapKit

open class NMCollectionViewController: UICollectionViewController {
  
  //----------------------------------------------------------------------------
  // MARK: - Size manager
  //----------------------------------------------------------------------------
  
  public var sizeManager: RZCellSizeManager?
  
  //----------------------------------------------------------------------------
  // MARK: - Datasource
  //----------------------------------------------------------------------------
  
  /**
   The data source
   */
  public var dataSource: UICollectionViewDataSource? {
    didSet {
      self.collectionView?.dataSource = dataSource
    }
  }
  
  public var dataSourceTyped: NMCollectionViewDataSource? {
    return self.collectionView?.dataSource as? NMCollectionViewDataSource
  }
  
  //----------------------------------------------------------------------------
  // MARK: - Collection view delegate
  //----------------------------------------------------------------------------
  
  override open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let dataSource = self.collectionView?.dataSource as? NMCollectionViewDataSource,
      let cell = self.collectionView?.cellForItem(at: indexPath) as? NMCollectionViewCell
    else { return }
    dataSource.cellsData[indexPath.section].cellData(for: indexPath).didSelect(
      cell,
      collectionView,
      indexPath
    )
  }
  
  //----------------------------------------------------------------------------
  // MARK: - Helpers
  //----------------------------------------------------------------------------
  
  /**
   Register a BaseTableViewCell easy
   */
  public func registerCell(_ forClass: NMCollectionViewCell.Type) {
    self.collectionView?.register(
      UINib(
        nibName:forClass.identifier,
        bundle: Bundle(for: forClass.self)
      ),
      forCellWithReuseIdentifier: forClass.identifier
    )
  }
  
  //----------------------------------------------------------------------------
  // MARK: - Loading management
  //----------------------------------------------------------------------------
  
  var loadingView: UIActivityIndicatorView?
  
  public func addLoading() {
    self.removeLoading()
    
    let loadingView = UIActivityIndicatorView()
    loadingView.color = UIColor.black
    loadingView.startAnimating()
    self.collectionView?.addSubview(loadingView)
    self.loadingView = loadingView
    
    loadingView.snp.makeConstraints { (make) -> Void in
      guard let collectionView = self.collectionView else { return }
      make.center.equalTo(collectionView)
    }
  }
  
  public func removeLoading() {
    self.loadingView?.removeFromSuperview()
    self.loadingView = nil
  }
  
}
