//
//  Hero.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 15.06.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import Foundation

struct Hero : Codable {
    let name: String
    let attackType: String
    
    enum CodingKeys: String, CodingKey {
        case name =  "localized_name"
        case attackType = "attack_type"
    }
    
}


