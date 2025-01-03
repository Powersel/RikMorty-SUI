import Foundation

enum APIEndpoint {
  private var baseURL: String { return "https://rickandmortyapi.com/api" }
  
  case characters
  case locations
  case episodes
}

extension APIEndpoint {
  var path: String {
    switch self {
    case .characters: return baseURL + "/character"
    case .locations: return baseURL + "/location"
    case .episodes: return baseURL + "/episode"
    }
  }
}

