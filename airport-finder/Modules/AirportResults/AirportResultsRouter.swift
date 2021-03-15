//
//  AirportResultsRouter.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import UIKit
import CoreLocation

class AirportResultsRouter {
    
    weak var presenter: AirportResultsRouterToPresenter?
    
    class func createModule(withLocation location: CLLocation, ratioInKM ratio: Int, airports: [Airport]) -> AirportResultsView {
        let view = AirportResultsView()
        let interactor = AirportResultsInteractor()
        let router = AirportResultsRouter()
        let presenter = AirportResultsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        
        view.updateUI(withAirports: airports)
        view.updateUI(withLocation: location, ratioInKM: ratio)
        
        return view
    }
    
}

extension AirportResultsRouter: AirportResultsPresenterToRouter {
    
}
