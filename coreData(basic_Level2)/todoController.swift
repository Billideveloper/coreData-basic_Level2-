//
//  ViewController.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 27/09/20.
//

import UIKit
import CoreData



class todoController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var tableview: UITableView!
    
    let mytask = ["find Work" , "get a milk"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //fetchcity()
        
        //fetchcityimage()
        // Do any additional setup after loading the view.
    }
    
//    var controller : NSFetchedResultsController<City>!
//    var controller2 : NSFetchedResultsController<Image>!
//
    
//
//
//    func fetchcityimage(){
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
//        request.returnsObjectsAsFaults = false
//        do{
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject] {
//                print(data)
//            }
//        }catch{
//            print("fail")
//        }
//
//    }
//
    
    
    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//
//        switch type {
//
//        case .delete:
//            if let indexPath = indexPath {
//                tableview.deleteRows(at: [indexPath], with: .fade)
//            }
//
//        case .insert:
//            if let indexPath = newIndexPath {
//                tableview.insertRows(at: [indexPath], with: .fade)
//            }
//        case .update:
//            if let indexPath = indexPath {
//                //TODO: Do something here
//                let cell = tableview.cellForRow(at: indexPath) as! cityTableViewCell
//                cellinfo(cell: cell, indexpath: indexPath as NSIndexPath)
//            }
//        case .move:
//            if let indexPath = indexPath {
//                tableview.deleteRows(at: [indexPath], with: .fade)
//            }
//            if let indexPath = newIndexPath {
//                tableview.insertRows(at: [indexPath], with: .fade)
//            }
//
//        @unknown default:
//            print("error")
//        }
//
//
//    }
//

//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableview.beginUpdates()
//    }
//    
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableview.endUpdates()
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       
//        return 0
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableview.dequeueReusableCell(withIdentifier: "tasks", for: indexPath) as! cityTableViewCell
//        
//        cellinfo(cell: cell, indexpath: indexPath as NSIndexPath)
//        
//        return cell
//    }
//    
//  


//
//    func cellinfo(cell:cityTableViewCell, indexpath: NSIndexPath){
//
//
//        let city = controller.object(at: indexpath as IndexPath)
//        let image = controller2.object(at: indexpath as IndexPath)
//        cell.cityinfo(city: city, image: image)
//
//    }
//
//
    
    func fetchcity(){
        
        //let request = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        
        let request : NSFetchRequest<City> = City.fetchRequest()
        let request2 : NSFetchRequest<Image> = Image.fetchRequest()
                //request.predicate = NSPredicate(format: "age = %@", "12")
                
        //request.returnsObjectsAsFaults = false
    
        let moneysort = NSSortDescriptor(key: "price", ascending: true)
        request.sortDescriptors = [moneysort]
        
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request2.sortDescriptors = [sort]
        
        
        let mcontroller1 = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        mcontroller1.delegate = self
        
        
        let mcontroller2 = NSFetchedResultsController(fetchRequest: request2, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        mcontroller2.delegate = self
        
        
        
        do{
            try mcontroller1.performFetch()
            
        }catch{
            
            let err = error as NSError
            print("\(err)")
            
        }
        
        do{
            try mcontroller2.performFetch()
            
        }catch{
            
            let err = error as NSError
            print("\(err)")
            
        }
        
        
                
    }

}
