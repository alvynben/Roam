//
//  LocationCard.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct LocationCard: View {
    let name: String
    let location: String
    let rating: Double
    let imageFilename: String
    
    var body: some View {
        VStack {
            Image(imageFilename)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 150, alignment: .top)
                .clipShape(.rect(cornerRadius: 20))
            
            HStack {
                Text(name)
                    .bold()
                    .font(.title3)
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.pink)
                    Text(String(format: "%.1f", rating))
                        .foregroundStyle(.gray)
                }
            }
            .padding(5)
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.pink)
                Text(location)
            }
            .padding(5)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: 500, maxHeight: 500)
    }
}

#Preview(traits: .fixedLayout(width: 250, height: 250)) {
    LocationCard(name: "Raja Ampat Islands", location: "Raja Ampat, Papua Barat", rating: 4.8, imageFilename: "raja_ampat_islands")
}
