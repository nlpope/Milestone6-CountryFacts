//
//  DetailVC.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/12/25.
//
/**
 this 1st designated init is resp. for calling the super (UITableViewController)'s init after setting countryItem
 the 2nd required init is for the storyboard
 **/

import UIKit

class DetailVC: UIViewController, UITableViewDelegate & UITableViewDataSource
{
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var countryFactsTableView: UITableView!
    var countryItem: CountryItem
    var factsTableView: UITableView // return 4 slots for facts
    
    internal static func instantiate(withCountryItem countryItem: CountryItem) -> DetailVC
    {
        let vc          = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Identifiers.detailVC) as! DetailVC
        vc.countryItem  = countryItem
        return vc
    }

    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("deinitializing DetailVC") }
    
    //-------------------------------------//
    // MARK: METHODS
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
        configureTableView()
    }
    
    
    func setUpNavigation() { title = countryItem.name.common }
    
    
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
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.factsCell)!
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("selected")
    }
}
