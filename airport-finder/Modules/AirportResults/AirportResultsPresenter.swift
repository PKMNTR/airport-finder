//
//  AirportResultsPresenter.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import Foundation

class AirportResultsPresenter {
    
    weak var view: AirportResultsPresenterToView?
    var interactor: AirportResultsPresenterToInteractor?
    var router: AirportResultsPresenterToRouter?
    
    init(view: AirportResultsPresenterToView, interactor: AirportResultsPresenterToInteractor, router: AirportResultsPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension AirportResultsPresenter: AirportResultsInteractorToPresenter {
    
}

extension AirportResultsPresenter: AirportResultsRouterToPresenter {
    
}

extension AirportResultsPresenter: AirportResultsViewToPresenter {
    
}
