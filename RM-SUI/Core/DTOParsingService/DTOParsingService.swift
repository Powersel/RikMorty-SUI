import Foundation

final class DTOParsingService {
  private let decoder: JSONDecoder
  
  init() {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    self.decoder = decoder
  }
}

extension DTOParsingService: DTOParsingServiceProtocol {
  func parseData<T>(_ data: Data, _ model: T.Type) throws -> T where T : Codable {
    do {
      let model = try decoder.decode(T.self, from: data)
      return model
    } catch {
      throw DTOParsingError.parsingFailed
    }
  }
}
