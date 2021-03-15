//
//  AirportResultsInteractor.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import Foundation

class AirportResultsInteractor {
    
    weak var presenter: AirportResultsInteractorToPresenter?
    
}

extension AirportResultsInteractor: AirportResultsPresenterToInteractor {
    
}
