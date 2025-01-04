import SwiftUI

struct CharactersListView<ViewModel: CharactersListViewModelProtocol>: View {
  
  @StateObject
  private var viewModel: ViewModel
  
  init(viewModel: @autoclosure @escaping () -> ViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel())
  }
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 8) {
        ForEach(viewModel.items) { characterDTO in
          
          CharacterCellView(characterDTO: characterDTO)
            .task {
              if viewModel.hasReachedEnd(characterDTO) {
                await viewModel.fetchNextListOfData()
              }
            }
          
        }
      }
    }.task {
      await viewModel.loadInitialData()
    }
  }
}

#Preview {
  CharactersListView(viewModel: CharacterListViewModel())
}
