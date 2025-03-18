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

class DetailVC: UIViewController
{
    var countryItem: CountryItem
    var flagImageView: UIImageView
    var factsTableView: UITableView // return 4 slots for facts
    var countryFactsTableView = UITableView()
    
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
        view.addSubview(countryFactsTableView)
        
    }
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
    
    
}
