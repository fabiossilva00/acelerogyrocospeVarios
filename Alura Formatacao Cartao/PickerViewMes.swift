//
//  PickerViewMes.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 16/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

protocol PickerViewMesText {
    func mesText(mes:String)
}

class PickerViewMes: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let listaMes = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    var delegate:PickerViewMesText?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaMes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let mes = listaMes[row]
        return mes
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.mesText(mes: listaMes[row])
        }
    }
}
