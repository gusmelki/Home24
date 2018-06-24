import UIKit
import RxSwift

protocol SelectionBusinessLogic {
  func doSomething(request: Selection.Something.Request)
}

protocol SelectionDataStore {
  //var name: String { get set }
}

class SelectionInteractor: SelectionBusinessLogic, SelectionDataStore {
  var presenter: SelectionPresentationLogic?
  var worker: SelectionWorker?
  
  let disposeBag = DisposeBag()
  
  func doSomething(request: Selection.Something.Request) {
    worker = SelectionWorker()
    worker?.doSomeWork()
    
    Home24Manager.getArticles().subscribe(onNext: { (result) in
      let response = Selection.Something.Response(articles: result.embedded?.articles)
      self.presenter?.presentSomething(response: response)
    }, onError: { (error) in
      print(error)
    }, onCompleted: {
      print("onCompleted")
    }).disposed(by: disposeBag)

  }
}
