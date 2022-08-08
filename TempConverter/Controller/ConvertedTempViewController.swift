//
//  ConvertedTempViewController.swift
//  TempConverter
//
//  Created by iMac on 2022-08-07.
//

import UIKit

class ConvertedTempViewController: UIViewController {

    
    @IBOutlet weak var tempValueLabel: UILabel!
    
    var tempValueText = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if !tempValueText.isEmpty
        {
            tempValueLabel.text = tempValueText
        }
    }
    

}
