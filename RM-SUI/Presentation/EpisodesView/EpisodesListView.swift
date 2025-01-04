import SwiftUI

struct EpisodesListView<ViewModel: EpisodesListViewModelProtocol>: View {
  
  @StateObject
  private var viewModel: ViewModel
  
  init(viewModel: @autoclosure @escaping () -> ViewModel) {
      _viewModel = StateObject(wrappedValue: viewModel())
  }
  
    var body: some View {
      ScrollView {
        LazyVStack(spacing: 8) {
          ForEach(viewModel.items) { episode in
            EpisodeCellView(episode: episode)
              .task {
                if viewModel.hasReachedEnd(episode) {
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
  EpisodesListView(viewModel: EpisodesListViewModel())
}
