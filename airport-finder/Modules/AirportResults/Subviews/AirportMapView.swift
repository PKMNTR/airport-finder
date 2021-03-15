//
//  AirportMapView.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import UIKit
import MapKit

class AirportMapView: UIViewController {
    
    let mapView = MKMapView()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        setupUI()
        activateConstraints()
    }
    
    func setupUI() {
        view.addSubview(mapView)
    }
    
    func activateConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func centerMapOn(location: CLLocation, visibleRatioinKM ratio: Int) {
        let ratioInMeters = CLLocationDistance(ratio * 1000 + 500)
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: ratioInMeters,
            longitudinalMeters: ratioInMeters
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func placeAirportMarkers(airports: [Airport]) {
        mapView.addAnnotations(airports.map { $0.mkAnnotation })
    }
    
}
