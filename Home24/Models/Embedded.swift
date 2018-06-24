import Foundation

public struct Embedded: Codable {
  
  public let articles: [Article]?
  
  enum CodingKeys: String, CodingKey {
    case articles
    
  }
}
