//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Marko Jovanov on 24.8.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var total: String = ""
    var totalSplit: Int = 0
    var tip: Float = 0.0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = "Split between \(totalSplit) people, with \(tip * 100)% tip."
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
