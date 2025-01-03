import SwiftUI

@main
struct RM_SUIApp: App {
    var body: some Scene {
        WindowGroup {
          EpisodesListView(viewModel: EpisodesListViewModel())
        }
    }
}
