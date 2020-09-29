//
//  addCityViewController.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 29/09/20.
//

import UIKit
import CoreData

class addCityViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    
    var city: City!
    
    @IBOutlet weak var cityName: UITextField!
    
    
    @IBOutlet var opeanimageview: UITapGestureRecognizer!
    @IBOutlet weak var cityFamousthings: UITextField!
    

    @IBOutlet weak var cityPrice: UITextField!
    
    
    @IBOutlet weak var selectCityImage: UIImageView!
    
    @IBOutlet weak var cityRating: UITextField!
    
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        selectCityImage.isUserInteractionEnabled = true
        selectCityImage.addGestureRecognizer(opeanimageview)
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addCity(_ sender: Any) {
        
        
        let citypic = Image(context: context)
        
        
        city.cityToimage = citypic
        
        
        if let cityname = cityName.text, let citythings = cityFamousthings.text, let cityprice = cityPrice.text, let cityrating = cityRating.text{
            
            city.name = cityname
            city.price = (cityprice as NSString).doubleValue
            city.famous = citythings
            city.rating = (cityrating as NSString).doubleValue
            
            
        }
        
        
        
        appdelegate.saveContext()
        
        self.navigationController?.popToRootViewController(animated: true)

        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
        
        if let selectedimage = image{
        selectCityImage.image = selectedimage
            
            picker.dismiss(animated: true, completion: nil)
        }else{
            
            debugPrint("select CourseImage")
        }
        
    }
    
    
    
    
    
    @IBAction func selectImage(_ sender: Any) {
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
    
    
}
