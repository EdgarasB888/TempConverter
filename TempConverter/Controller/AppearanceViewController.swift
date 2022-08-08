//
//  AppearanceViewController.swift
//  TempConverter
//
//  Created by iMac on 2022-08-07.
//

import UIKit

class AppearanceViewController: UIViewController
{
    @IBOutlet weak var textLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setLabelText()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettingsTapped(_ sender: Any)
    {
        openSettings()
    }
    
    func setLabelText()
    {
        var text = "Unable to specify UI style"
        
        if self.traitCollection.userInterfaceStyle == .dark
        {
            text = "Dark Mode is ON"
        }
        else
        {
            text = "Light Mode is ON"
        }
        
        textLabel.text = text
    }
    
    func openSettings()
    {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString)else {return}
        if UIApplication.shared.canOpenURL(settingsURL)
        {
            UIApplication.shared.open(settingsURL, options: [:])
            {
                success in print("Success:", success)
            }
        }
    }

}

extension AppearanceViewController
{
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?)
    {
        setLabelText()
    }
}
