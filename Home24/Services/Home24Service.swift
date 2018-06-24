import Foundation
import Moya

enum Home24Service {
  case categories
}

extension Home24Service: TargetType {
  var baseURL: URL { return URL(string: "https://api-mobile.home24.com/api/v2.0?appDomain=1&locale=de_DE&limit=10")! }
  var path: String {
    switch self {
    case .categories:
      return "/categories/100/articles"
    }
  }
  var method: Moya.Method {
    switch self {
    case .categories:
      return .get
    }
  }
  var task: Task {
    switch self {
    case .categories:
      return .requestPlain

    }
  }
  var sampleData: Data {
    switch self {
    case .categories:
      return "Half measures are as bad as nothing at all.".utf8Encoded
    }
  }
  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
}

private extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}
