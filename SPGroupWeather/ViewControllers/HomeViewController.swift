//
//  ViewController.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 27/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    //MARK:- Variable Declaration
    var homeSearchVM    : HomeSearchViewModel!
    var searchActive    : Bool = false

    // MARK:- Constant
    static let cellIdentifier = "searchList"
    let citySegueIdentifier = "showCity"   //New
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK:- IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myViewedTableView: UITableView!

    // MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        try! self.homeSearchVM.fetchUserLocations()
        self.removeSpinner()
    }
    

    init(viewModel: HomeSearchViewModel) {
        self.homeSearchVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // required when called from storyboard
    required init?(coder aDecoder: NSCoder) {
        self.homeSearchVM = HomeSearchViewModel()
        super.init(coder: aDecoder)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CityViewController,
            let selectedIndex = myViewedTableView.indexPathForSelectedRow {
            try! self.homeSearchVM.insertLocation(location: self.homeSearchVM.locations[selectedIndex.row])
            destination.selectedText = self.homeSearchVM.locations[selectedIndex.row].areaName
        }
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search any Topic"
        definesPresentationContext = true
        myViewedTableView.tableHeaderView = searchController.searchBar
    }

    func refreshTable() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.myViewedTableView.reloadData()
        })
    }
    
    @objc func reload() {
        guard let searchText = self.searchBar.text else { return }
        searchLocation(searchText : searchText)
    }
    
    //MARK:- searchLocation
    func searchLocation(searchText : String){
        //call API
        homeSearchVM.searchLocation(searchText, { (success, result, error) -> Void in
            if(success) {
                 self.homeSearchVM.locations.removeAll()
                if(result.count > 0){
                    self.homeSearchVM.locations = result
                }
                 self.refreshTable()

            } else {
                //Show error
            }
        })
    }
}

//MARK:- UITableViewDataSource
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.homeSearchVM.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.cellIdentifier, for: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = self.homeSearchVM.locations[row].areaName
        return cell
    }
}

//MARK:- UITableViewDelegate
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        myViewedTableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:- UISearchBarDelegate
extension HomeViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(HomeViewController.reload), object: nil)
        self.perform(#selector(HomeViewController.reload), with: nil, afterDelay: 0.5)
    }

    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }

}

