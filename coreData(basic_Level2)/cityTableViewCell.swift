//
//  cityTableViewCell.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 01/10/20.
//

import UIKit
import CoreData

class cityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var cityRating: UILabel!
    
    @IBOutlet weak var famPoint: UILabel!
    
    @IBOutlet weak var averageCost: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func cityinfo(city: City, image: Image){
        
        self.cityName.text = city.name
        self.cityRating.text = "\(city.rating)"
        self.famPoint.text = city.famous
        self.averageCost.text = "\(city.price)"
        let cityimage = image.image as! UIImage
        self.cityImage.image = cityimage
        
    }
   
    
    

}
