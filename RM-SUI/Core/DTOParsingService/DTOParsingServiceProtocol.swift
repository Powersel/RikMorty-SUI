import Foundation

protocol DTOParsingServiceProtocol {
  func parseData<T>(_ data: Data, _ model: T.Type) throws -> T where T : Codable
}
