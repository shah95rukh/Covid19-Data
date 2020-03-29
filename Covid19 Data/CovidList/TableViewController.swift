//
//  TableViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-26.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class TableViewController: UITableViewController {
    var countryArray: [String] = []
    var totalConfirmedArray: [Int] = []
    var totalRecoveredArray: [Int] = []
    var totalDeathsArray: [Int] = []
    

    @IBOutlet var covidTableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.offWhite
        
        // Fetches Covid19 data and appends it into arrays
        CovidNetworkManager().fetchCovidJSON { (result) in
            switch result {
            case .success(let covidDataList):
                covidDataList.forEach({ (covidData) in
                    if !(covidData.Country.isEmpty) {
                        self.countryArray.append(covidData.Country)
                        self.totalConfirmedArray.append(covidData.TotalConfirmed)
                        self.totalRecoveredArray.append(covidData.TotalRecovered)
                        self.totalDeathsArray.append(covidData.TotalDeaths)
                    }
                })
                DispatchQueue.main.async { self.covidTableList.reloadData() }
            case .failure(let error):
                print("Failed to fetch covid data from an api: ", error)
            }
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CovidDataCell else { fatalError("Issue dequeuing cell") }
        cell.countryLabel.text = countryArray[indexPath.row]
        cell.confirmedCasesLabel.text = "\(totalConfirmedArray[indexPath.row])"
        cell.recoveredCasesLabel.text = "\(totalRecoveredArray[indexPath.row])"
        cell.deathsLabel.text = "\(totalDeathsArray[indexPath.row])"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
