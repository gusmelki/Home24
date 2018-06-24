import Foundation
import Moya
import RxSwift

public class Home24Manager {
  
  static let provider = MoyaProvider<Home24Service>()
  
  public static func getArticles() -> Observable<Articles>{
    return self.provider.rx.request(.categories)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map(Articles.self)
  }
}
