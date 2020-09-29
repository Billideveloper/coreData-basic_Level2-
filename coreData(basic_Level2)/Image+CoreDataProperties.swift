//
//  Image+CoreDataProperties.swift
//  coreData(basic_Level2)
//
//  Created by Ravi Thakur on 29/09/20.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var imageTocity: City?

}

extension Image : Identifiable {

}
