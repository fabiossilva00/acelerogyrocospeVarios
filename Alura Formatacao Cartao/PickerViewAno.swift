//
//  PickerViewAno.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 16/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

protocol PickerViewAnoText {
    func anoText(ano:String)
}

class PickerViewAno: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let listaAno = ["2018", "2019", "2020", "2021", "2022"]
    var delegate:PickerViewAnoText?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaAno.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let ano = listaAno[row]
        return ano
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil {
            delegate?.anoText(ano: listaAno[row])
        }else{
            print("Ano")
        }
    }
}
