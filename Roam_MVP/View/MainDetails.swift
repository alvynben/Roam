//
//  MainDetails.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct MainDetails: View {
    let name: String
    let location: String
    let rating: Double
    
    private var noOfStars: Int {
        Int(rating.rounded(FloatingPointRoundingRule.toNearestOrAwayFromZero))
    }
    var body: some View {
            VStack(spacing: 2) {
                Text(name)
                    .font(.system(size: 25))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.pink)
                        .font(.system(size: 25))
                    Text(location)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text(String(format: "%.1f", rating))
                        .font(.headline)
                    ForEach((1...noOfStars), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.pink)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Image(systemName: "figure.roll")
                        .foregroundColor(.pink)
                        .font(.system(size: 25))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
        
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 150)) {
    MainDetails(name: "Munich", location: "Germany", rating: 3.4)
}
