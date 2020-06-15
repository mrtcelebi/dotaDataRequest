//
//  ViewController.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 15.06.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    
    var heroes = [Hero]()
    let api = HeroApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
}






extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = heroes[indexPath.row].localized_name
        cell.detailTextLabel?.text = heroes[indexPath.row].attack_type

        return cell
    }
}
