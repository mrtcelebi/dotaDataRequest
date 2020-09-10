//
//  HeroApi.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 15.06.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import Foundation
import Alamofire


enum CustomError: Error {
    case invalidData
    case errorRequest
    case urlError
}

class HeroApi {
    
    static let shared = HeroApi()
    
    func getDotaData(completion: @escaping (Result<[Hero], CustomError>) -> Void) {
        
        let urlString = "https://api.opendota.com/api/heroStats"
        
        guard let url = URL(string: urlString) else {return completion(.failure(.urlError))}
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(.failure(.errorRequest))
                return
            }
            guard let data = response.data else { return completion(.failure(.invalidData))}
            let decoder = JSONDecoder()
            do {
                let hero = try decoder.decode([Hero].self, from: data)
                completion(.success(hero))
                print(hero)
            }
            catch {
                debugPrint(error.localizedDescription)
                completion(.failure(.invalidData))
            }
        }
    }
}
