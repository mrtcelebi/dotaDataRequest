//
//  ViewController.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 15.06.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import UIKit

class HomeController: UIViewController {


    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(DotaCell.self, forCellReuseIdentifier: DotaCell.identifier)
        table.rowHeight = 50
        return table
    }()
      
    var heroes = [Hero]()
       
    let viewModel: HomeViewModelProtocol

    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.dataSource = self
        
        HeroApi.shared.getDotaData { (result) in
            switch result {
            case .success(let heroes):
                self.heroes = heroes
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}




//MARK: - TableViewDataSource Methods

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfItems = viewModel.numberOfItems
        return numberOfItems
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DotaCell.identifier, for: indexPath) as! DotaCell
        
        let item = viewModel.cellItem(at: indexPath)

        cell.set(with: item)

        return cell
    }
}
