//
//  AirportSearchPresenter.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 14/03/21.
//

import UIKit
import CoreLocation

class AirportSearchPresenter {
    
    weak var view: AirportSearchPresenterToView?
    var interactor: AirportSearchPresenterToInteractor?
    var router: AirportSearchPresenterToRouter?
    
    init(view: AirportSearchPresenterToView, interactor: AirportSearchPresenterToInteractor, router: AirportSearchPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension AirportSearchPresenter: AirportSearchInteractorToPresenter {
    
    func response(withAirportsData data: [Airport], location: CLLocation, ratioInKM: Int) {
        router?.createAirportResults(withLocation: location, ratioInKM: ratioInKM, airports: data)
        view?.hideLoadingUI()
    }
    
    func response(withError error: String) {
        view?.hideLoadingUI()
        view?.showError(error)
    }
    
    
}

extension AirportSearchPresenter: AirportSearchRouterToPresenter {
    
    func pushVC(_ vc: UIViewController) {
        view?.pushVC(vc)
    }
    
}

extension AirportSearchPresenter: AirportSearchViewToPresenter {
    
    func requestAirports(withLocation location: CLLocation, ratioInKM ratio: Int) {
        view?.showLoadingUI()
        interactor?.requestAirports(withLocation: location, ratioInKM: ratio)
    }
    
}
