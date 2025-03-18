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
        NetworkManager.getCountries()
        tableView.reloadData()
    }
    
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
}
