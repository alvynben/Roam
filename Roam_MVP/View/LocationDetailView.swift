//
//  LocationDetailView.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct LocationDetailView: View {
    let locationDetail: LocationDetailModel
    
    var tabs: [LocationDetailTabModel] = [
        .init(id: LocationDetailTabModel.Tab.About),
        .init(id: LocationDetailTabModel.Tab.Review),
        .init(id: LocationDetailTabModel.Tab.Media),
        .init(id: LocationDetailTabModel.Tab.Accessibility_Info)
    ]
    
    @State private var activeTab: LocationDetailTabModel.Tab = .About
    @State private var tabBarScrollState: LocationDetailTabModel.Tab?
    @State private var mainViewScrollState: LocationDetailTabModel.Tab?
    
    var body: some View {
        VStack {
            ImageSection()
            MainDetails(name: locationDetail.name, location: locationDetail.location, rating: locationDetail.rating)
            TabBar()
            TabSection()
        }
        .navigationTitle(locationDetail.name)
    }
    
    
    
    @ViewBuilder
    func ImageSection() -> some View {
        Image(locationDetail.imageFilename)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
    }
    
    @ViewBuilder
    func TabSection() -> some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        Text(tab.id.rawValue)
                            .frame(width: size.width, height: size.height)
                            .contentShape(.rect)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $mainViewScrollState)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .onChange(of: mainViewScrollState) { oldValue, newValue in
                if let newValue {
                    withAnimation(.snappy) {
                        tabBarScrollState = newValue
                        activeTab = newValue
                    }
                }
                
            }
        }
        
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tabs) { tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            activeTab = tab.id
                            tabBarScrollState = tab.id
                            mainViewScrollState = tab.id
                        }
                    }) {
                        Text(tab.id.rawValue)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(activeTab == tab.id ? .primary : .secondary)
                            
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: .init(get: {
            return tabBarScrollState
        }, set: { _ in
            
        }), anchor: .center)
        .padding(.vertical, 5)
        .overlay(alignment: .bottom) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 1)
            }
        }
        
        
    }
    
}

#Preview {
    LocationDetailView(locationDetail: LocationDetailModel.sample)
}
