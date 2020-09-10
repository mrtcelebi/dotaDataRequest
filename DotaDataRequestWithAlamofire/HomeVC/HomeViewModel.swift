//
//  HomeViewModel.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 9.09.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import Foundation

protocol HomeViewModelDataSource: class {
    var title: String { get }
    var numberOfItems: Int { get }
    func cellItem(at indexPath: IndexPath) -> DotaCellProtocol
}

protocol HomeViewModelProtocol: HomeViewModelDataSource {
    func didSelectItem(at indexPath: IndexPath)
}

class HomeViewModel: HomeViewModelProtocol {
   
    
    var title: String {
        return "Dota Heroes"
    }
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    private var hero: [Hero] = []
    private var cellItems: [DotaCellProtocol] = []

    
    func cellItem(at indexPath: IndexPath) -> DotaCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    func didSelectItem(at indexPath: IndexPath) {
           
    }
    
}
