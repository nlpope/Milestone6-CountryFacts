//
//  DetailVC.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/12/25.
//

import UIKit

class DetailVC: UITableViewController
{
    var countryItem: CountryItem

    /**
     this 1st designated init is resp. for calling the super (UITableViewController)'s init after setting countryItem
     the 2nd required init is for the storyboard
     **/
        
    init(withCountryItem countryItem: CountryItem)
    {
        self.countryItem = countryItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("deinitializing DetailVC") }
    
    //-------------------------------------//
    // MARK: METHODS
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
    }
    
    
    func setUpNavigation()
    {
        title = countryItem.name
    }
    
    
    //-------------------------------------//
    // MARK: TABLEVIEW DELEGATE & DATASOURCE METHODS
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
