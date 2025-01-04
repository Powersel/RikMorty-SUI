import Foundation

struct RMCharactersDTO: Codable {
  let info: ServiceInfoDTO
  let results: [CharacterDTO]
}

struct CharacterDTO: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
  let species: String
}
