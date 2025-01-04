import Foundation

protocol ListDTORepositoryProtocol {
  func fetchEpisodes(_ urlString: String) async throws -> RMEpisodesDTO
  func fetchCharacters(_ urlString: String) async throws -> RMCharactersDTO
}

final class ListDTORepository: ListDTORepositoryProtocol {
  
  private let networkService: NetworkServiceProtocol
  private let parsingService: DTOParsingServiceProtocol
  
  init(networkService: NetworkServiceProtocol = NetworkService(),
       parsingService: DTOParsingServiceProtocol = DTOParsingService()) {
    self.networkService = networkService
    self.parsingService = parsingService
  }
  
  // MARK: - EpisodesRepositoryProtocol
  
  func fetchEpisodes(_ urlString: String) async throws -> RMEpisodesDTO {
    return try await fetchDTOData(urlString, RMEpisodesDTO.self)
  }
  
  func fetchCharacters(_ urlString: String) async throws -> RMCharactersDTO {
    return try await fetchDTOData(urlString, RMCharactersDTO.self)
  }
  
  // MARK: - Private
  
  private func fetchDTOData<T: Codable>(_ urlString: String, _ model: T.Type) async throws -> T {
    let data = try await networkService.fetchData(urlString)
    let episodesDTO = try parsingService.parseData(data, model)
    
    return episodesDTO
  }
}
