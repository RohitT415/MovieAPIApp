import Foundation
import SwiftUI

struct TrendingCard: View {

    let trendingItem: Movie

    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                VStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                }
                
                AsyncImage(url: trendingItem.backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 330, height: 200)
                } placeholder: {
                    Rectangle().fill(Color("white"))
                            .frame(width: 300, height: 200)
                }

                HStack {
                    Text("User Score:")
                    .foregroundColor(.white)
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.mint)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(hue: 0.6, saturation: 0.8, brightness: 0.3))
        }
        .cornerRadius(10)
    }
}

