import Foundation

struct EpisodeDTO: Codable, Identifiable {
  let id: Int
  let name : String
  let airDate: String
  let episode: String
}
