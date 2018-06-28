import UIKit

protocol SelectionPresentationLogic {
  func presentArticles(response: Selection.ArticleApi.Response)
  func presentErrorMsg(response: Selection.ErrorApi.Response)
}

class SelectionPresenter: SelectionPresentationLogic {
  weak var viewController: SelectionDisplayLogic?
  
  // MARK: Do something
  
  func presentArticles(response: Selection.ArticleApi.Response) {
    let viewModel = Selection.ArticleApi.ViewModel(articles: response.articles)
    viewController?.displayArticles(viewModel: viewModel)
  }
  
  func presentErrorMsg(response: Selection.ErrorApi.Response) {
    let viewModel = Selection.ErrorApi.ViewModel(errorMsg: response.errorMsg)
    viewController?.displayError(viewModel: viewModel)
    
  }
}
