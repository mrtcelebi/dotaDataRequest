//
//  HeroApi.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 15.06.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import Foundation
import Alamofire


class HeroApi {
    
    func getDotaData(completion: @escaping (Hero?) -> Void) {
        
        let urlString = "https://api.opendota.com/api/heroStats"
        
        guard let url = URL(string: urlString) else {return completion(nil)}
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil)}
            let decoder = JSONDecoder()
            do {
                let hero = try decoder.decode([Hero].self, from: data)
                completion(hero)
                
            }
            catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
