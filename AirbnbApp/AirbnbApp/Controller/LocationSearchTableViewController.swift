//
//  LocationSearchTableViewController.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/21.
//

import UIKit

class LocationSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    private var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: ResultsTableController())
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false

        return searchController
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LocationSearchTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
        self.tableView.dataSource = self
        configureSearchBar()
    }
    
    private func configureSearchBar() {
        self.title = "숙소 찾기"
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.searchController = searchController
        self.searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        let vc =  searchController.searchResultsUpdater as? ResultsTableController
        vc?.view.backgroundColor = .yellow
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BaseLocations.baseLocations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! LocationSearchTableViewCell
//        let product = filteredProducts[indexPath.row]
        
        cell.configureLocationLabel(text: BaseLocations.baseLocations[indexPath.row])
        
        return cell
    }
}
