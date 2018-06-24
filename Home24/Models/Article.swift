import Foundation

public struct Article: Codable {
  
  public let sku: String?
  public let title: String?
  public let media: [Media]?
  
  enum CodingKeys: String, CodingKey {
    case sku
    case title
    case media
    
  }
}
