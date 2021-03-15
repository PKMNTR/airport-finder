//
//  AirportSearchRouter.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 14/03/21.
//

import Foundation
import CoreLocation

class AirportSearchRouter {
    
    weak var presenter: AirportSearchRouterToPresenter?
    
    class func createModule() -> AirportSearchView {
        let view = AirportSearchView()
        let interactor = AirportSearchInteractor()
        let router = AirportSearchRouter()
        let presenter = AirportSearchPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        
        return view
    }
    
}

extension AirportSearchRouter: AirportSearchPresenterToRouter {
    
    func createAirportResults(withLocation location: CLLocation, ratioInKM ratio: Int, airports: [Airport]) {
        let vc = AirportResultsRouter.createModule(withLocation: location, ratioInKM: ratio, airports: airports)
        presenter?.pushVC(vc)
    }
    
    
}
