//
//  City+CoreDataProperties.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 29/09/20.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var name: String?
    @NSManaged public var rating: Double
    @NSManaged public var price: Double
    @NSManaged public var famous: String?
    @NSManaged public var cityToimage: Image?

}

extension City : Identifiable {

}
