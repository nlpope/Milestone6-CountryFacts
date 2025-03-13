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
    
    //-------------------------------------//
    // MARK: INITS & DEINITS
    
    /**this calls the super (UITableViewController)'s init**/
    init(withCountryItem countryItem: CountryItem)
    {
        self.countryItem = countryItem
        super.init(nibName: nil, bundle: nil)
    }
    
    /**this is for the storyboard**/
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
}
