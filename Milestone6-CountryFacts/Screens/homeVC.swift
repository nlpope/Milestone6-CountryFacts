//  File: homeVC.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 3/12/25.

/**
 initializing VC when storyboard is in use:
 https://stackoverflow.com/questions/30449137/custom-init-of-uiviewcontroller-from-storyboard
 */

import UIKit

class homeVC: UITableViewController
{
    var countryArray = [CountryItem]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchCountryArray()
        configureNavigation()
    }
    
    
    func configureNavigation()
    {
        view.backgroundColor    = .systemBackground
        title                   = "COUNTRIES"
    }
    
    
    func fetchCountryArray()
    {
        APICaller.shared.fetchSomething() { [weak self] result in
            switch result {
            case .success(let data):
                self?.countryArray = APICaller.shared.parseJSON(jsonData: data)
            case .failure(let error):
                print(error.rawValue)
                
            }
            DispatchQueue.main.async { self?.tableView.reloadData() }
        }
    }
    
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return countryArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell                = tableView.dequeueReusableCell(withIdentifier: Identifiers.CFCountryCell, for: indexPath) as! CFCountryCell
        let country             = countryArray[indexPath.row]
        let flagImageUrlString  = country.flagImageName?.png
        
        if flagImageUrlString != nil { cell.countryImageView.load(urlString: flagImageUrlString!) }
        else { cell.countryImageView.image = UIImage(named: Images.defaultFlag) }
        cell.countryLabel?.text = country.name?.common ?? "Unknown"
        tableView.rowHeight = CGFloat(75)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let countryItem = countryArray[indexPath.row]
        navigationController?.pushViewController(DetailVC.instantiate(withCountryItem: countryItem), animated: true)
    }
}
