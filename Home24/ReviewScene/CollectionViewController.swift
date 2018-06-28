import UIKit

class CollectionViewController: UIViewController {
  
  var arrayArticles = [Article]()
  let userDefaults = UserDefaults.standard
  
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
    
    let likedArticles = userDefaults.object(forKey: "liked") as? [String] ?? [String]()
    if likedArticles.contains(arrayArticles[indexPath.row].sku!) {
      cell.likedArticleLabel.isHidden = false
    } else {
      cell.likedArticleLabel.isHidden = true
    }
    
    return cell
  }
}
