//
//  DotaCellViewModel.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 9.09.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

protocol DotaCellDataSource: AnyObject {
    var title: String? { get }
    var attackType: String? { get }
}

protocol DotaCellProtocol: DotaCellDataSource {}

class DotaCellViewModel: DotaCellProtocol {
    var title: String?
    var attackType: String?
    
    init(with hero: Hero) {
        title = hero.name
        attackType = hero.attackType
    }  
}
