//
//  AirportSearchProtocols.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 14/03/21.
//

import UIKit
import CoreLocation

// MARK: - AirportSearchInteractor
protocol AirportSearchPresenterToInteractor {
    func requestAirports(withLocation location: CLLocation, ratioInKM ratio: Int)
}

// MARK: - AirportSearchPresenter
protocol AirportSearchViewToPresenter: class {
    func requestAirports(withLocation location: CLLocation, ratioInKM ratio: Int)
}

protocol AirportSearchInteractorToPresenter: class {
    func response(withAirportsData data: [Airport], location: CLLocation, ratioInKM: Int)
    func response(withError error: String)
}

protocol AirportSearchRouterToPresenter: class {
    func pushVC(_ vc: UIViewController)
}

// MARK: - AirportSearchRouter
protocol AirportSearchPresenterToRouter {
    func createAirportResults(withLocation location: CLLocation, ratioInKM ratio: Int, airports: [Airport])
}

// MARK: - AirportSearchView
protocol AirportSearchPresenterToView: class {
    func showLoadingUI()
    func hideLoadingUI()
    func showError(_ error: String)
    func pushVC(_ vc: UIViewController)
}

