import UIKit
import Koloda
import SDWebImage

protocol SelectionDisplayLogic: class {
  func displayArticles(viewModel: Selection.ArticleApi.ViewModel)
  func displayError(viewModel: Selection.ErrorApi.ViewModel)
}

class SelectionViewController: UIViewController, SelectionDisplayLogic {
  var interactor: SelectionBusinessLogic?
  var router: (NSObjectProtocol & SelectionRoutingLogic & SelectionDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = SelectionInteractor()
    let presenter = SelectionPresenter()
    let router = SelectionRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showReview" {
      let controller = segue.destination as! TabViewController
      controller.arrayArticles = self.arrayArticles
      
    }
  }
  
  // MARK: View lifecycle
  
  @IBOutlet weak var reviewBtn: UIButton!
  @IBOutlet weak var selectionView: KolodaView!
  @IBOutlet weak var amountArticlesLabel: UILabel!
  @IBOutlet weak var amountLikedArticlesLabel: UILabel!
  @IBOutlet weak var placeHolderLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var arrayArticles = [Article]()
  var totalLiked = 0
  let userDefaults = UserDefaults.standard
  var likedArticles = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    doSomething()
    setupSelectionView()
  }
  
  func setupSelectionView(){
    selectionView.dataSource = self
    selectionView.delegate = self
  
    self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    
    self.reviewBtn.isEnabled = false
    self.reviewBtn.backgroundColor = UIColor.gray
    self.placeHolderLabel.isHidden = true
  }
  
  func doSomething() {
    self.activityIndicator.startAnimating()
    let request = Selection.ArticleApi.Request()
    interactor?.doResquestApi(request: request)
  }
  
  func displayArticles(viewModel: Selection.ArticleApi.ViewModel) {
    
    self.activityIndicator.stopAnimating()
    self.activityIndicator.hidesWhenStopped = true
    
    if let totalArticles = viewModel.articles?.count {
      self.amountArticlesLabel.text = "/ \(totalArticles)"
    }
    if let articles = viewModel.articles {
      for article in articles{
        arrayArticles.append(article)
      }
    }
    selectionView.reloadData()
  }
  
  func displayError(viewModel: Selection.ErrorApi.ViewModel) {
    let alert = UIAlertController(title: "Error", message: viewModel.errorMsg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
    self.present(alert, animated: true)
  }
  
  @IBAction func likeBtn(_ sender: Any) {
    selectionView?.swipe(.right)
  }
  
  @IBAction func dislikeBtn(_ sender: Any) {
    selectionView?.swipe(.left)
  }
  
  @IBAction func reviewBtn(_ sender: Any) {

  }
}

extension SelectionViewController: KolodaViewDelegate {
  
  func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    self.reviewBtn.isEnabled = true
    self.reviewBtn.backgroundColor = UIColor.orange
    self.placeHolderLabel.isHidden = false
    
    self.userDefaults.set(likedArticles, forKey: "liked")
  }
  
  func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    
  }
  
  func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
    if direction == SwipeResultDirection(rawValue: "right") {
      totalLiked += 1
      
      UIView.transition(with: amountLikedArticlesLabel, duration: 0.5, options: [.transitionFlipFromBottom], animations: {
        self.amountLikedArticlesLabel.text = "\(self.totalLiked)"
      }, completion: nil)
    
      likedArticles.append(arrayArticles[index].sku!)
    }
  }
}

// MARK: KolodaViewDataSource
extension SelectionViewController: KolodaViewDataSource {
  
  func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
    return arrayArticles.count
  }
  
  func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
    return .default
  }
  
  func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {

    let imageview = UIImageView()
    imageview.sd_setImage(with: URL(string: (arrayArticles[index].media?.first?.uri)!))
    
    return imageview
  }
}

