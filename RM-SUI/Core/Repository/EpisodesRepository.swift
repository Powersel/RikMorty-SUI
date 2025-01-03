import Foundation

protocol EpisodesRepositoryProtocol {
  func fetchEpisodes(_ urlString: String) async throws -> RMEpisodesDTO
}

final class EpisodesRepository: EpisodesRepositoryProtocol {
  
  private let networkService: NetworkServiceProtocol
  private let parsingService: DTOParsingServiceProtocol
  
  init(networkService: NetworkServiceProtocol = NetworkService(),
       parsingService: DTOParsingServiceProtocol = DTOParsingService()) {
    self.networkService = networkService
    self.parsingService = parsingService
  }
  
  func fetchEpisodes(_ urlString: String) async throws -> RMEpisodesDTO {
    let data = try await networkService.fetchData(urlString)
    let episodesDTO = try parsingService.parseData(data, RMEpisodesDTO.self)
    
    return episodesDTO
  }
}
