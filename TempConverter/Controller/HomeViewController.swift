//
//  ViewController.swift
//  TempConverter
//
//  Created by iMac on 2022-08-05.
//

import UIKit

class HomeViewController: UIViewController
{

    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    @IBOutlet weak var tempSlider: UISlider!
    {
        didSet
        {
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
            tempSlider.value = 0
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any)
    {
        print("tempSlider.value:", tempSlider.value)
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any)
    {
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    func updateTempLabelForSlider(value: Float)
    {
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) ºC"
        
        var convertedTempString = ""
        
        switch tempSegmentControl.selectedSegmentIndex
        {
            case 0:
                let fahrenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
                convertedTempString = fahrenheitTempString + " ºF"
            default:
                let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
                convertedTempString = kelvinTempString + " ºK"
        }
        convertedTempLabel.text = convertedTempString
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double)
    {
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        
        return(fahrenheit, kelvin)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "appID"
        {
            guard let vc = segue.destination as? ConvertedTempViewController else {return}
            vc.tempValueText = convertedTempLabel.text ?? "No data detected!"
        }
    }
    
}

