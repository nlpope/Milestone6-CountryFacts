//  File: DetailVC.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 3/12/25.
/**
 this 1st designated init is resp. for calling the super (UITableViewController)'s init after setting country
 the 2nd required init is for the storyboard
 **/

import UIKit

class DetailVC: UIViewController, UITableViewDelegate & UITableViewDataSource
{
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var countryFactsTableView: UITableView!
    var country: CountryItem! // strong reference
    var factsTableView: UITableView!
    
    internal static func instantiate(withCountryItem countryItem: CountryItem) -> DetailVC
    {
        let vc          = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Identifiers.detailVC) as! DetailVC
        vc.country  = countryItem
        return vc
    }

    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    
    deinit { print("deinitializing DetailVC") }
    
    //-------------------------------------//
    // MARK: METHODS
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
        configureFlag()
        configureTableView()
    }
    
    
    func setUpNavigation() { title = country.name?.common ?? "Unknown"}
    
    
    func configureFlag()
    {
        let flagImageUrlString  = country.flagImageName?.png
        if flagImageUrlString != nil { flagImageView.load(urlString: flagImageUrlString!) }
        else { flagImageView.image  = UIImage(named: Images.defaultFlag) }
    }
    
    
    func configureTableView()
    {
        countryFactsTableView.delegate      = self
        countryFactsTableView.dataSource    = self
        countryFactsTableView.removeExcessCells()
    }
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell    = tableView.dequeueReusableCell(withIdentifier: Identifiers.CFCountryFactsCell)!
        
        switch indexPath.row
        {
        case 0:
            cell.textLabel?.text        = "Capital"
            cell.detailTextLabel?.text  = country.capital?[0] ?? "unknown"
        case 1:
            cell.textLabel?.text        = "Size"
            cell.detailTextLabel?.text  = String(country.size ?? 0.0)
        case 2:
            cell.textLabel?.text        = "Population"
            cell.detailTextLabel?.text  = String(country.population ?? 0.0)
        default:
            cell.textLabel?.text        = "Other info"
            cell.detailTextLabel?.text  = "Unknown"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("selected")
    }
}
