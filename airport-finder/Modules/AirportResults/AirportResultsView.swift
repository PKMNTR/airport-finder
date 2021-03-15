//
//  AirportResultsView.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import UIKit
import  CoreLocation

class AirportResultsView: UITabBarController {
    
    var presenter: AirportResultsViewToPresenter?
    
    let airportMapView = AirportMapView()
    
    let airportTableView = AirportTableView()
    
    override func loadView() {
        super.loadView()
        airportMapView.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        airportTableView.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        viewControllers = [airportMapView, airportTableView]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Results"
    }
    
}

extension AirportResultsView: AirportResultsPresenterToView {
    
    func updateUI(withLocation location: CLLocation, ratioInKM ratio: Int) {
        airportMapView.centerMapOn(location: location, visibleRatioinKM: ratio)
    }
    
    func updateUI(withAirports airports: [Airport]) {
        airportMapView.placeAirportMarkers(airports: airports)
        airportTableView.updateTable(withAirports: airports)
    }
    
  
}

