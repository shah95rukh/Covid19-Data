//
//  TableViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-26.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import EMTNeumorphicView

struct APIdetails: Decodable {
    let Date: String
    let Countries: [Covid]
}

struct Covid: Decodable {
    let Country: String
    let TotalConfirmed: Int
    let TotalRecovered: Int
    let TotalDeaths: Int
}

class TableViewController: UITableViewController {
    var countryArray: [String] = []
    var totalConfirmedArray: [Int] = []
    var totalRecoveredArray: [Int] = []
    var totalDeathsArray: [Int] = []
    

    @IBOutlet var covidTableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.offWhite
        
        fetchJokesJSON { (result) in
            switch result {
            case .success(let jokes):
                jokes.forEach({ (joke) in
                    if !(joke.Country.isEmpty) {
                        self.countryArray.append(joke.Country)
                        self.totalConfirmedArray.append(joke.TotalConfirmed)
                        self.totalRecoveredArray.append(joke.TotalRecovered)
                        self.totalDeathsArray.append(joke.TotalDeaths)
                    }
                })
                
                // reloads the table
                DispatchQueue.main.async { self.covidTableList.reloadData() }
            case .failure(let error):
                print("Failed to fetch jokes: ", error)
            }
        }
    }
    
    fileprivate func fetchJokesJSON(completion: @escaping (Result<[Covid], Error>) -> ()) {
        guard let jokeUrl = URL(string: "https://api.covid19api.com/summary") else {
            return
        }
        
        URLSession.shared.dataTask(with: jokeUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Upon success tries decoding returned json
            guard let data = data else { return }
            do {
                let jokes = try JSONDecoder().decode(APIdetails.self, from: data)
                completion(.success(jokes.Countries.sorted(by: { $0.TotalConfirmed > $1.TotalConfirmed })))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CovidDataCell
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
