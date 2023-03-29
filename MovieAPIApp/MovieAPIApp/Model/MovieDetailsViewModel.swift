import Foundation
import SwiftUI

@MainActor
class MovieDetailsViewModel: ObservableObject {
    
    @Published var credits: MovieCredits?
    @Published var cast: [MovieCredits.Cast] = []
    
    func movieCredits(for movieID: Int) async {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDiscoverViewModel.apiKey)&language=en-US")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(MovieCredits.self, from: data)
            self.credits = credits
            self.cast = credits.cast.sorted(by: { $0.order < $1.order })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    struct MovieCredits: Decodable {
        
        let id: Int
        let cast: [Cast]
        
        struct Cast: Decodable, Identifiable {
            let name: String
            let id: Int
            let character: String
            let order: Int
        }
    }
}
