import Foundation

public struct Media: Codable {
  
  public let uri: String?
  public let mimeType: String?
  
  enum CodingKeys: String, CodingKey {
    case uri
    case mimeType

  }
}
