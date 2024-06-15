//
//  LocationsListView.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct LocationsListView: View {
    let locations: [LocationDetailModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                Header()
                Recommended()
                GeometryReader { _ in }
            }
        }
        .navigationTitle("Home")
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder
    func Recommended() -> some View {
        Text("Recommended")
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 20)
            .padding(.bottom, -40)
        
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(locations) { location in
                        NavigationLink(destination: LocationDetailView(locationDetail: location)) {
                            LocationCard(name: location.name, location: location.location, rating: location.rating, imageFilename: location.imageFilename)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
        
    }
    
    @ViewBuilder
    func Header() -> some View {
        HStack {
            Spacer()
            Text("Home")
                .fontWeight(.bold)
                .font(.title)
                .padding(.trailing, -40)
            Spacer()
            Image("profilePic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(.circle)
                .overlay() {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .stroke(.white)
                        .fill(.white)
                }
        }
        .padding(10)
        .background(.pink.opacity(0.6))
        .frame(maxHeight: 30)
    }
}

#Preview {
    LocationsListView(locations: LocationDetailModel.samples)
}
