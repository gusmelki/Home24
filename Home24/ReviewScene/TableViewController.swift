//
//  TableViewController.swift
//  Home24
//
//  Created by Gustavo Melki Leal on 28/06/2018.
//  Copyright © 2018 Gustavo Melki. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

  var arrayArticles = [Article]()
  let userDefaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let likedArticles = userDefaults.object(forKey: "liked") as? [String] ?? [String]()
    print(likedArticles.count)
    print(likedArticles)
    
  }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayArticles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.textLabel?.text = arrayArticles[indexPath.row].title
    cell.imageView?.sd_setImage(with: URL(string: (arrayArticles[indexPath.row].media?.first?.uri)!))
    
    return cell
  }
  
}
