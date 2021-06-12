//
//  ViewController.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nearTripCollectionView: UICollectionView!
    @IBOutlet weak var anywhereTripCollectionView: AnywhereTripCollectionView!

    private let nearTripCollectionViewDataSource: UICollectionViewDataSource = NearTripCollectionViewDataSource()
    private let anywhereCollectionViewDataSource: UICollectionViewDataSource = AnywhereTripCollectionViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        nearTripCollectionView.dataSource = nearTripCollectionViewDataSource
        anywhereTripCollectionView.dataSource = anywhereCollectionViewDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func goLocationSearchView(_ sender: Any) {
        guard let locationSearchView = storyboard?.instantiateViewController(identifier: "LocationSearchTableViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(locationSearchView, animated: true)
    }
}

