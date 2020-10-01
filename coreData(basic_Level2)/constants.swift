//
//  constants.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 29/09/20.
//
import UIKit

let appdelegate = UIApplication.shared.delegate as! AppDelegate
let context = persistanceService.persistentContainer.viewContext

class GradientView: UIView {
    
    
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        let color1 = #colorLiteral(red: 0.9664050937, green: 0.247961998, blue: 0.07035661489, alpha: 1)
        let color2 = #colorLiteral(red: 0.9733994603, green: 0.735342443, blue: 0.1175928786, alpha: 1)
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
       
    }
}
