//
//  AirportResultsProtocols.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import Foundation
import CoreLocation

// MARK: - AirportSearchInteractor
protocol AirportResultsPresenterToInteractor {
    
}

// MARK: - AirportSearchPresenter
protocol AirportResultsViewToPresenter: class {
    
}

protocol AirportResultsInteractorToPresenter: class {
    
}

protocol AirportResultsRouterToPresenter: class {
    
}

// MARK: - AirportSearchRouter
protocol AirportResultsPresenterToRouter {
    
}

// MARK: - AirportSearchView
protocol AirportResultsPresenterToView: class {
    
    func updateUI(withLocation location: CLLocation, ratioInKM ratio: Int)
    func updateUI(withAirports airports: [Airport])
    
}

