//
//  ArticleEntity+CoreDataProperties.swift
//  Nytapp
//
//  Created by oleg on 31.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }

    @NSManaged public var url: String?
    @NSManaged public var title: String?
    @NSManaged public var abstract: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var id: String?

}
