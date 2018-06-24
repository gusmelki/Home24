import UIKit

protocol SelectionPresentationLogic {
  func presentSomething(response: Selection.Something.Response)
}

class SelectionPresenter: SelectionPresentationLogic {
  weak var viewController: SelectionDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Selection.Something.Response) {
    let viewModel = Selection.Something.ViewModel(articles: response.articles)
    viewController?.displaySomething(viewModel: viewModel)
  }
}
