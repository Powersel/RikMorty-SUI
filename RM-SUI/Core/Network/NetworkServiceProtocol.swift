import Foundation

protocol NetworkServiceProtocol {
  func fetchData(_ url: String) async throws -> Data
}
