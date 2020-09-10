//
//  HeroViewModel.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 9.09.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import Foundation

protocol HeroDataSource: class {
    var name: String? { get }
    var attackType: String? { get }
}

protocol HeroProtocol: HeroDataSource {}

class HeroViewModel: HeroProtocol {
    var name: String?
    var attackType: String?
    
    init(hero: Hero) {
        name = hero.name
        attackType = hero.attackType
    }
}
