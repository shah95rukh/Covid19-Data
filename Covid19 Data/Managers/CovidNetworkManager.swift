//
//  CovidNetworkManager.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-29.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import Foundation

final class CovidNetworkManager {
    
    private let domainUrlString = "https://api.covid19api.com/summary"
    
    func fetchCovidJSON(completion: @escaping (Result<[Covid], Error>) -> ()) {
        guard let covidUrl = URL(string: domainUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: covidUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            do {
                let covidResults = try JSONDecoder().decode(APIdetails.self, from: data)
                completion(.success(covidResults.Countries.sorted(by: { $0.TotalConfirmed > $1.TotalConfirmed })))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}
