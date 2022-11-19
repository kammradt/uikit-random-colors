//
//  ColorDetailViewController.swift
//  RandomColors
//
//  Created by Vinicius Kammradt on 19/11/22.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .gray
    }
}
