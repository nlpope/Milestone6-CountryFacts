//  homeVC.swift
//  Milestone6-CountryFacts
//  Created by Noah Pope on 3/12/25.
//  initializing VC when storyboard is in use: https://stackoverflow.com/questions/30449137/custom-init-of-uiviewcontroller-from-storyboard

import UIKit

class homeVC: UITableViewController
{
    var countryArray = [CountryItem]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchCountryArray()
        view.backgroundColor = .systemRed
    }
    
    
    func fetchCountryArray()
    {
        countryArray = APICaller.shared.fetchSomething() { [weak self] result in
            switch result {
            case .success(let data):
                countryArray = APICaller.shared.parseJSON(jsonData: data)
            }
        }
        print("payload = \(countryArray)")
        tableView.reloadData()
    }
    
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return countryArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell    = tableView.dequeueReusableCell(withIdentifier: Identifiers.countryCell, for: indexPath)
        let country = countryArray[indexPath.row]
//        cell.textLabel?.text    = country.name.common
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let countryItem = countryArray[indexPath.row]
        navigationController?.pushViewController(DetailVC.instantiate(withCountryItem: countryItem), animated: true)
    }
}
