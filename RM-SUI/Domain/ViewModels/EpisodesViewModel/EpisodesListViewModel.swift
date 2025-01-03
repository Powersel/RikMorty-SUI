import Foundation

protocol EpisodesListViewModelProtocol: ListViewModelProtocol {
  /// Array containing of items to be displayed.
  var items: [EpisodeDTO] { get }
  
  func hasReachedEnd(_ episode: EpisodeDTO) -> Bool
}

final class EpisodesListViewModel: EpisodesListViewModelProtocol {
  
  @Published
  private(set) var state: ListViewState = .idle
  
  @Published
  private(set) var items: [EpisodeDTO] = []
  
  private var episodesData: RMEpisodesDTO?
  
  @Published
  private(set) var error: Error?
  
  private let repository: EpisodesRepositoryProtocol
  
  // MARK: - Initialization
  init(repository: EpisodesRepositoryProtocol = EpisodesRepository()) {
    self.repository = repository
  }
  
 // MARK: - NetworkActiveViewModelProtocol
  
  func loadInitialData() async {
    await loadData()
  }
  
  func fetchNextListOfData() async {
    await loadData()
  }
  
  func refresh() async {
    
  }
  
  func hasReachedEnd(_ episode: EpisodeDTO) -> Bool {
    if items.isEmpty { return false }
    
    return items.last?.id == episode.id
  }
  
  // MARK: - Private
  
  @MainActor
  private func loadData() async {
    guard state != .loading else { return }
    state = .loading
    
    let urlString = episodesData?.info.next ?? APIEndpoint.episodes.path
    
    do {
      let episodesDataDTO = try await repository.fetchEpisodes(urlString)
      items.append(contentsOf: episodesDataDTO.results)
      episodesData = episodesDataDTO
      error = nil
      state = .loaded
    } catch let loadindError {
      self.error = loadindError
      state = .error(loadindError)
    }
  }
}
