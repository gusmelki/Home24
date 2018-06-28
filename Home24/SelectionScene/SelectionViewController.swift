import UIKit
import Koloda
import SDWebImage

protocol SelectionDisplayLogic: class {
  func displaySomething(viewModel: Selection.Something.ViewModel)
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
  
      
      if segue.identifier == "showReview" {
       
          let controller = segue.destination as! TabViewController
          controller.arrayArticles = self.arrayArticles
        
      }
     
    }
  }
  
  // MARK: View lifecycle
  
  @IBOutlet weak var reviewBtn: UIButton!
  @IBOutlet weak var selectionView: KolodaView!
  var arrayArticles = [Article]()
  
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
    
  }
  
  func doSomething() {
    let request = Selection.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Selection.Something.ViewModel) {
    
    if let articles = viewModel.articles {
      for article in articles{
        arrayArticles.append(article)
      }
    }
    
    selectionView.reloadData()
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
  
  }
  
  func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    
    
    
  }
  
  func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
    
    
    if direction == SwipeResultDirection(rawValue: "right") {
      
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

