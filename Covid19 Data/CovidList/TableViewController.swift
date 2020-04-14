//
//  TableViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-26.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import FlagKit
import Lottie

class TableViewController: UITableViewController, UISearchResultsUpdating {

    let animationView = AnimationView()
    var covidDataArray = [CovidDataModel]()
    var flagImage = UIImage()
    @IBOutlet var covidTableList: UITableView!
    var filteredCountries = [CovidDataModel]()
    var searchController: UISearchController!
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    func filterContent(for searchText: String) {
        filteredCountries = covidDataArray.filter({ covidResult -> Bool in
            covidResult.countryArray.lowercased().contains(searchText.lowercased())
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            covidTableList.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        animationView.animation = Animation.named("17476-loading")
        animationView.frame = CGRect(x: 0, y: 0, width: 120, height: 65)
        animationView.center.x = view.center.x
        animationView.center.y = view.center.y - 100
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        animationView.play()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Search by country"
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.searchTextField.leftView?.tintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Fetches Covid19 data and appends it into arrays
        CovidNetworkManager().fetchCovidJSON { (result) in
            switch result {
            case .success(let covidDataList):
                covidDataList.forEach({ (covidData) in
                    if !(covidData.Country.isEmpty) && (covidData.Country != "Netherlands Antilles") {
                        
                        self.covidDataArray.append(CovidDataModel(CountryCodeArray: covidData.CountryCode, countryArray: covidData.Country, totalConfirmedArray: covidData.TotalConfirmed, totalRecoveredArray: covidData.TotalRecovered, totalDeathsArray: covidData.TotalDeaths, newConfirmedArray: covidData.NewConfirmed, newRecoveredArray: covidData.NewRecovered, newDeathsArray: covidData.NewDeaths))
                    }
                })
                DispatchQueue.main.async {
                    self.covidTableList.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch covid data from an api: ", error)
            }
        }
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCountries.count
        }
        return covidDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView()
        sectionView.backgroundColor = UIColor.bluishPurple
        
        let countryTag: UILabel = {
            let label = UILabel()
            label.text = "Country"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let confimredTag: UILabel = {
            let label = UILabel()
            label.text = "Confirmed"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let deathsTag: UILabel = {
            let label = UILabel()
            label.text = "Deaths"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        sectionView.addSubview(countryTag)
        sectionView.addSubview(confimredTag)
        sectionView.addSubview(deathsTag)
        
        NSLayoutConstraint.activate([
            countryTag.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 7),
            countryTag.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor, constant: -7),
            countryTag.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 20),
            
            deathsTag.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 7),
            deathsTag.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor, constant: -7),
            deathsTag.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor, constant: -49),
            
            confimredTag.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 7),
            confimredTag.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor, constant: -7),
            confimredTag.trailingAnchor.constraint(equalTo: deathsTag.leadingAnchor, constant: -38),
            
        ])
        return sectionView
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CovidDataCell else { fatalError("Issue dequeuing cell") }
        
        let covid: CovidDataModel
        if isFiltering {
            covid = filteredCountries[indexPath.row]
        } else {
            covid = covidDataArray[indexPath.row]
        }

        // To prevent crashing incase some country's flag doesn't exist
        let flag = Flag(countryCode: covid.CountryCodeArray) ?? Flag(countryCode: "CA")
        flagImage = flag!.originalImage
        cell.flag.image = flagImage
        cell.countryLabel.text = covid.countryArray
        cell.confimredLabel.text = "\(covid.totalConfirmedArray)"
        cell.deathsLabel.text = "\(covid.totalDeathsArray)"
        
        // Stops loading animation when data is loaded
        self.animationView.stop()
        self.animationView.removeFromSuperview()
        
        return cell
    }
    
    // Passes data to the DetailsViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        let covid: CovidDataModel
        
        if isFiltering {
            covid = filteredCountries[indexPath.row]
        } else {
            covid = covidDataArray[indexPath.row]
        }
        detailsVC.setUpData(covid: covid)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Animates uitableviewcells
        if !searchController.isActive {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 20, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0
            UIView.animate(withDuration: 0.5) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1
            }
        }
    }
    
}
