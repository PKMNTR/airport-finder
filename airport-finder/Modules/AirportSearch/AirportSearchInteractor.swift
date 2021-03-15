//
//  AirportSearchInteractor.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 14/03/21.
//

import Foundation
import CoreLocation

class AirportSearchInteractor {
 
    weak var presenter: AirportSearchInteractorToPresenter?
}

extension AirportSearchInteractor: AirportSearchPresenterToInteractor {
    
    func requestAirports(withLocation location: CLLocation, ratioInKM ratio: Int) {
        guard let url = URL(string: "https://aerodatabox.p.rapidapi.com/airports/search/location/\(location.coordinate.latitude)/\(location.coordinate.longitude)/km/\(ratio)/16") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "x-rapidapi-key": "YOUR_API_KEY",
            "x-rapidapi-host": "aerodatabox.p.rapidapi.com"
        ]
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let _ = error {
                DispatchQueue.main.async {
                    self?.presenter?.response(withError: "Something happens at getting data")
                }
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode),
                let responseData = data,
                let data = try? JSONDecoder().decode(AirportSearchResponse.self, from: responseData)
                else {
                    DispatchQueue.main.async {
                        self?.presenter?.response(withError: "Something happens at getting data")
                    }
                    return
            }
            DispatchQueue.main.async {
                self?.presenter?.response(withAirportsData: data.items, location: location, ratioInKM: ratio)
            }
        }
        task.resume()
    }
    
}
