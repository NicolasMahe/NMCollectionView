//
//  NMIntrinsicSizedCollectionView.swift
//  NMCollectionView
//
//  Created by Nicolas Mahé on 15/06/16.
//  Copyright © 2016 Nicolas Mahé. All rights reserved.
//

import UIKit

open class NMIntrinsicSizedCollectionView: UICollectionView {
  
  override open func layoutSubviews() {
    super.layoutSubviews()
    if self.bounds.size != self.intrinsicContentSize {
      self.invalidateIntrinsicContentSize()
    }
  }
  
  override open var intrinsicContentSize : CGSize {
    return self.contentSize
  }
}
