import UIKit
import RxSwift


class ViewController: UIViewController {

  let disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    Home24Manager.getArticles().subscribe(onNext: { (result) in
      print(result)
      
    }, onError: { (error) in
      print(error)
    }, onCompleted: {
      print("onCompleted")
    }).disposed(by: disposeBag)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

