//
//  CollectionViewController.swift
//  Home24
//
//  Created by Gustavo Melki Leal on 28/06/2018.
//  Copyright © 2018 Gustavo Melki. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
  
  var arrayArticles = [Article]()
  
  override func viewDidLoad() {
    super.viewDidLoad()    
  }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrayArticles.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
    cell.imageView?.sd_setImage(with: URL(string: (arrayArticles[indexPath.row].media?.first?.uri)!))
    
    return cell
  }
  
  
  
}
