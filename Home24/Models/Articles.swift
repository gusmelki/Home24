import Foundation

public struct Articles: Codable {
  
  public let articlesCount: Int?
  public let embedded: Embedded?

  
  enum CodingKeys: String, CodingKey {
    case articlesCount
    case embedded = "_embedded"

  }
}
