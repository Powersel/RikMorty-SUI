import SwiftUI

@main
struct RM_SUIApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        EpisodesListView(viewModel: EpisodesListViewModel())
          .tabItem {
            Label("Episodes", systemImage: "tray.full")
              .font(.largeTitle)
          }
        
        CharactersListView(viewModel: CharacterListViewModel())
          .tabItem {
            Label("Characters", systemImage: "person.and.background.dotted")
              .font(.largeTitle)
//              .labelStyle(.titleOnly)
          }
      }
    }
  }
}
