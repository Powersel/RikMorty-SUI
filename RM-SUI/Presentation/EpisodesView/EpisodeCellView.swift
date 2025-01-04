import SwiftUI

struct EpisodeCellView: View {
  
  private let episode: EpisodeDTO
  
  init(episode: EpisodeDTO) {
    self.episode = episode
  }
  
  var body: some View {
    VStack {
          Text("Episode number: \(String(episode.id))")
            .font(.footnote)
          Spacer()
          Text("Episode name: \(episode.name)")
            .font(.headline)
            .multilineTextAlignment(.leading)
          Spacer()
    }.frame(width: .infinity, alignment: .leading)
  }
}

#Preview {
  let mockEpisode = EpisodeDTO(id: 100, name: "Rick and Super Morty", airDate: "", episode: "100")
  EpisodeCellView(episode: mockEpisode)
}
