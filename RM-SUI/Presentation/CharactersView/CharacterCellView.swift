import SwiftUI

struct CharacterCellView: View {
  
  private let characterDTO: CharacterDTO
  
  init(characterDTO: CharacterDTO) {
    self.characterDTO = characterDTO
  }
  
  var body: some View {
    HStack {
      AsyncImage(url: URL(string: characterDTO.image)) { image in
        image
          .resizable()
          .scaledToFill()
          .frame(width: 80, height: 80)
          .clipShape(.circle)
      } placeholder: {
        ProgressView()
          .frame(width: 80, height: 80)
      }
      Spacer()
      VStack(spacing: .zero) {
        Text(characterDTO.name)
          .font(.title)
        Text(characterDTO.species)
          .font(.headline)
      }
      Spacer()
    }
    .padding(12)
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  let imageURL = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
  let model = CharacterDTO(id: 123,
                           name: "Rick",
                           image: imageURL,
                           species: "Human")
  CharacterCellView(characterDTO: model)
}
