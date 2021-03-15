//
//  AirportSearchEntity.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 14/03/21.
//

import Foundation
import MapKit

struct AirportSearchResponse: Codable {
    let items: [Airport]
}

struct Airport: Codable {
    let icao: String
    let iata: String
    let name: String?
    let shortName: String?
    let municipalityName: String?
    let location: Location
    let countryCode: String
}

extension Airport {
    var mkAnnotation: MKAnnotation {
        let mkAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
        mkAnnotation.title = name
        mkAnnotation.subtitle = municipalityName
        return mkAnnotation
    }
}

struct Location: Codable {
    let lat: Double
    let lon: Double
}
