//
//  BookEntity+CoreDataProperties.swift
//  BookStore
//
//  Created by Eddy on 2022/06/22.
//
//

import Foundation
import CoreData


extension BookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var body: String?
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?

}

extension BookEntity : Identifiable {

}
