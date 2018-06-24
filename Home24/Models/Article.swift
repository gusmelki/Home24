import Foundation

public struct Article: Codable {
  
  public let sku: String?
  public let title: String?
  
  enum CodingKeys: String, CodingKey {
    case sku
    case title
    
  }
}
