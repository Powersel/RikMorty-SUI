import Foundation

enum DTOParsingError: Error {
  case parsingFailed
  
  var localizedDescription: String {
    switch self {
    case .parsingFailed: return "Model parsing error."
    }
  }
}
