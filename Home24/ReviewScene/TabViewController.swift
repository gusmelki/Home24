import UIKit

class TabViewController: UITabBarController {
  
  var arrayArticles = [Article]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let tableViewController = self.viewControllers![0] as? TableViewController {
      tableViewController.arrayArticles = self.arrayArticles
    }
    if let tableViewController = self.viewControllers![1] as? CollectionViewController {
      tableViewController.arrayArticles = self.arrayArticles
    }
  }
}
