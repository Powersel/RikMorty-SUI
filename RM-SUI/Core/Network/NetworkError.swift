import Foundation

enum NetworkError: Error {
  case missingURL
  case invalidStatusCode(Int)
  
  /// Localizations for each error.
  var localizedDescription: String {
    switch self {
    case .missingURL:
      return "Missing URL."
    case .invalidStatusCode(let statusCode):
      return "Request was not successfull. Finished with: \(statusCode) code."
    }
  }
}
