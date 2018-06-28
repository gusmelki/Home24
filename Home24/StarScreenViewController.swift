import UIKit



class StarScreenViewController: UIViewController {

  @IBOutlet weak var logoView: UIImageView!
  let yFrameMove: CGFloat = 150.0
  
  override func viewDidLoad() {
        super.viewDidLoad()

      UIView.animate(withDuration: 1.5) {
        self.logoView.frame.origin.y -= self.yFrameMove
      }
      
    }

}
