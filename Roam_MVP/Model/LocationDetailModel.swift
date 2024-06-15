//
//  LocationDetailModel.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct LocationDetailModel: Identifiable {
    var id: UUID
    var name: String
    var location: String
    var rating: Double
    var imageFilename: String
    
    public init(name: String, location: String, rating: Double, imageFilename: String) {
        self.id = UUID()
        self.name = name
        self.location = location
        self.rating = rating
        self.imageFilename = imageFilename
    }
}

extension LocationDetailModel {
    static var sample: LocationDetailModel = LocationDetailModel(name: "Raja Ampat Islands", location: "Raja Ampat, Papua Burat", rating: 4.8, imageFilename: "raja_ampat_islands")
    
    static var samples: [LocationDetailModel] = [
        LocationDetailModel(name: "Raja Ampat Islands", location: "Raja Ampat, Papua Burat", rating: 4.8, imageFilename: "raja_ampat_islands"),
        LocationDetailModel(name: "Ijen Crater", location: "Banyuwangi, Jawa Timur", rating: 3.2, imageFilename: "ijen_crater"),
        LocationDetailModel(name: "Ranu Kumbolo", location: "Lumajang, Jawa Timur", rating: 4.2, imageFilename: "ranu_kumbolo")
    ]
}
