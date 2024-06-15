//
//  LocationDetailTabModel.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct LocationDetailTabModel: Identifiable {
    private(set) var id: Tab
    var size: CGSize = .zero
    var minX: CGSize = .zero
    
    enum Tab: String, CaseIterable {
        case About = "About"
        case Review = "Review"
        case Media = "Media"
        case Accessibility_Info = "Accessibility Info"
    }
}
