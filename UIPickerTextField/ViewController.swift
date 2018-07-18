//
//  ViewController.swift
//  UIPickerTextField
//
//  Created by Gabriel Miranda Silveira on 18/07/18.
//  Copyright © 2018 GabrielSilveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let southAmericanCountries = ["Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Equador", "Guiana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela"]
    
    @IBOutlet weak var countriesTextField: UIPickerTextField! {
        didSet {
            countriesTextField.pickerDelegate = self
            countriesTextField.data = southAmericanCountries
            countriesTextField.placeholder = "South American countries"
        }
    }
}

extension ViewController: UIPickerTextFieldDelegate {
    
    func didSelectRow(_ row: Int, withTitle title: String!) {
        print(title)
    }
}
