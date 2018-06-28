import UIKit

class TableViewController: UIViewController {

  var arrayArticles = [Article]()
  let userDefaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
    cell.articleNameLabel.text = arrayArticles[indexPath.row].title
    cell.articleImgView?.sd_setImage(with: URL(string: (arrayArticles[indexPath.row].media?.first?.uri)!))
  
    let likedArticles = userDefaults.object(forKey: "liked") as? [String] ?? [String]()
    if likedArticles.contains(arrayArticles[indexPath.row].sku!) {
      cell.likedArticleLabel.isHidden = false
    } else {
      cell.likedArticleLabel.isHidden = true
    }
    
    return cell
  }
}
