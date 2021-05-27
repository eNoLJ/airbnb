//
//  ResultLocationSearchTableViewController.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/23.
//

import UIKit

class ResultsTableController: BaseTableViewController {
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return searchedPlaces.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationSearchResultTableViewCell.cellID, for: indexPath) as? LocationSearchResultTableViewCell else {
            return UITableViewCell()
        }

        cell.configureLocationLabel(text: searchedPlaces[indexPath.row].addressName)
        
        return cell
    }
}

class BaseTableViewController: UITableViewController {
    
    var searchedPlaces = [Document]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: LocationSearchResultTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LocationSearchResultTableViewCell.cellID)
    }
    
    func configureCell(_ cell: UITableViewCell, forLocation location: String) {
        cell.textLabel?.text = location
    }
}
