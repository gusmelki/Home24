import UIKit
import RxSwift

protocol SelectionBusinessLogic {
  func doResquestApi(request: Selection.ArticleApi.Request)
}

protocol SelectionDataStore {
  //var name: String { get set }
}

class SelectionInteractor: SelectionBusinessLogic, SelectionDataStore {
  var presenter: SelectionPresentationLogic?
  var worker: SelectionWorker?
  
  let disposeBag = DisposeBag()
  
  func doResquestApi(request: Selection.ArticleApi.Request) {
    worker = SelectionWorker()
    worker?.doSomeWork()
    
    Home24Manager.getArticles().subscribe(onNext: { (result) in
      let response = Selection.ArticleApi.Response(articles: result.embedded?.articles)
      self.presenter?.presentArticles(response: response)
    }, onError: { (error) in
      let erroMsg = Selection.ErrorApi.Response(errorMsg: "Something goes worng =(. Try again later.")
      self.presenter?.presentErrorMsg(response: erroMsg)
      print(error)
    }, onCompleted: {
      print("onCompleted")
    }).disposed(by: disposeBag)

  }
}
