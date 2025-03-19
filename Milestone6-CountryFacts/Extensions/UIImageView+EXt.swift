//  File: UIImageView+EXt.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 3/19/25.

import UIKit

extension UIImageView
{
    func load(urlString: String)
    {
        DispatchQueue.global().async { [weak self] in
            guard let url   = URL(string: urlString) else { return }
            guard let data  = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async { self?.image = image }
        }
    }
}
