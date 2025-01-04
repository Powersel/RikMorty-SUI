import Foundation

protocol CharactersListViewModelProtocol: ListViewModelProtocol {
  /// Array containing of items to be displayed.
  var items: [CharacterDTO] { get }
  
  func hasReachedEnd(_ character: CharacterDTO) -> Bool
}

final class CharacterListViewModel: CharactersListViewModelProtocol {
  
  @Published
  private(set) var state: ListViewState = .idle
  
  @Published
  private(set) var items: [CharacterDTO] = []
  
  private var charactersData: RMCharactersDTO?
  
  @Published
  private(set) var error: Error?
  
  private let repository: ListDTORepositoryProtocol
  
  // MARK: - Initialization
  init(repository: ListDTORepositoryProtocol = ListDTORepository()) {
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
  
  func hasReachedEnd(_ character: CharacterDTO) -> Bool {
    if items.isEmpty { return false }
    
    return items.last?.id == character.id
  }
  
  // MARK: - Private
  
  @MainActor
  private func loadData() async {
    guard state != .loading else { return }
    state = .loading
    
    let urlString = charactersData?.info.next ?? APIEndpoint.characters.path
    
    do {
      let rmCharactersDTO = try await repository.fetchCharacters(urlString)
      items.append(contentsOf: rmCharactersDTO.results)
      charactersData = rmCharactersDTO
      error = nil
      state = .loaded
    } catch let loadindError {
      self.error = loadindError
      state = .error(loadindError)
    }
  }
}
