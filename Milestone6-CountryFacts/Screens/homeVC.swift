//
//  homeVC.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/12/25.
//

import UIKit

class homeVC: UITableViewController
{
    var countryArray = [CountryItem]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    func fetchCountryArray()
    {
        countryArray = APICaller.shared.getCountries()
        tableView.reloadData()
    }
    
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryItem = countryArray[indexPath.row]
        navigationController?.pushViewController(DetailVC.instantiate(withCountryItem: countryItem), animated: true)
        
//        if let vc = storyboard?.instantiateViewController(withIdentifier: Identifiers.detailVC) as? DetailVC {
//            vc.countryItem  = country
//            navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
