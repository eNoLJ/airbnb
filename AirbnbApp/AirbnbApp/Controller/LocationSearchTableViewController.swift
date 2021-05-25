//
//  LocationSearchTableViewController.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/21.
//

import UIKit
import Combine

class LocationSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    private var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: ResultsTableController())
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false

        return searchController
      }()
    
    private var locationSearchViewModel = LocationSearchViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
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
    
    func bind() {
        locationSearchViewModel.$searchedPlaces
            .receive(on: DispatchQueue.main)
            .sink { places in
                if let resultController = self.searchController.searchResultsController as? ResultsTableController {
                    resultController.searchedPlaces = self.locationSearchViewModel.searchedPlaces
                    resultController.tableView.reloadData()
                }
            }
            .store(in: &subscriptions)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        if !text.isEmpty {
            DispatchQueue.global().async {
                self.locationSearchViewModel.searchPlaces(keyword: text)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BaseLocations.baseLocations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! LocationSearchTableViewCell

        cell.configureLocationLabel(text: BaseLocations.baseLocations[indexPath.row])
        
        return cell
    }
}
