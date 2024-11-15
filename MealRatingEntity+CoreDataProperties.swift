//
//  MealRatingEntity+CoreDataProperties.swift
//  MealRater
//
//  Created by Maryam Inam on 11/14/24.
//
//

import Foundation
import CoreData


extension MealRatingEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealRatingEntity> {
        return NSFetchRequest<MealRatingEntity>(entityName: "MealRatingEntity")
    }

    @NSManaged public var meal: String?
    @NSManaged public var rating: Int16
    @NSManaged public var restaurantName: String?

}

extension MealRatingEntity : Identifiable {

}
