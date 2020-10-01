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
    
    var mycity = [City]()
    var myImage = [Image]()
    
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
    
    
    
    //MARK: - savedata
    
    
    @IBAction func addCity(_ sender: Any) {
        
//
//        let citypic = Image(context: context)
//
//        let mcity = City(context: persistanceService.context)
//
//        city.cityToimage = citypic
//
//
//        let entity = NSEntityDescription.entity(forEntityName: "City", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//
//        let entity2 = NSEntityDescription.entity(forEntityName: "Image", in: context)
//        let newUser2 = NSManagedObject(entity: entity2!, insertInto: context)
//
//
//        if let cityname = cityName.text, let citythings = cityFamousthings.text, let cityprice = cityPrice.text, let cityrating = cityRating.text, let cimage = selectCityImage.image{
//
//            let cprice = (cityprice as NSString).doubleValue
//            let crating = (cityrating as NSString).doubleValue
//
//            newUser.setValue(cityname, forKey: "name")
//            newUser.setValue(cprice, forKey: "price")
//            newUser.setValue(citythings, forKey: "famous")
//            newUser.setValue(crating, forKey: "rating")
//            newUser2.setValue(cimage, forKey: "image")
//
//            mcity.cityToimage?.image = cimage
//
//           // newUser.setValue(cimage, forKey: "cityToimage")
//
////            city.name = cityname
////            city.price = (cityprice as NSString).doubleValue
////            city.famous = citythings
////            city.rating = (cityrating as NSString).doubleValue
//
//        }
//
//        do {
//           try context.save()
//          } catch {
//           print("Failed saving")
//        }
//
//        persistanceService.saveContext()
//
//        self.navigationController?.popToRootViewController(animated: true)

        savedata()
        
    }
    
    
    
    
    func savedata(){
        
        let mcity = City(context: persistanceService.context)
        let mimage = Image(context: persistanceService.context)
        
        if let cityname = cityName.text, let citythings = cityFamousthings.text, let cityprice = cityPrice.text, let cityrating = cityRating.text, let cimage = selectCityImage.image{
            
            let cprice = (cityprice as NSString).doubleValue
            let crating = (cityrating as NSString).doubleValue
            
            mcity.name = cityname
            mcity.famous = citythings
            mcity.price = cprice
            mcity.rating = crating
            mimage.image = cimage
//            let imageis = Image(context: persistanceService.context)
//            imageis.image = cimage
//
//            city = City(context: persistanceService.context)
//            city.cityToimage = imageis
            
        }
        
        persistanceService.saveContext()
        
        self.mycity.append(mcity)
        self.myImage.append(mimage)
        
        
        print(mycity)
        print(myImage)
        
    }
    
    
    
    
    //MARK: - imagepart
    
    
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
