//  File: UITableView+Ext.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 3/17/25.

import UIKit

extension UITableView
{
    func removeExcessCells() { tableFooterView = UIView(frame: .zero) }
}
