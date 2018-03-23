//
//  Comment+CoreDataProperties.swift
//  unit1
//
//  Created by Hung Dinh on 3/23/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var id: Int16
    @NSManaged public var key: String?
    @NSManaged public var relationship: Gif?
    

    static func insertComment(key:String,content:String) -> Comment?{
        let comment = NSEntityDescription.insertNewObject(forEntityName: "Comment", into: AppDelegate.nSManagedObjectContext!) as! Comment
        comment.key = key
        comment.content = content
        do {
            try AppDelegate.nSManagedObjectContext?.save()
        } catch {
            let errStr = error as NSError
            print("Error: \(errStr)")
            return nil
        }
        print("successful!  ")
        return comment
    }
    
    static func getComment(key:String)-> [Comment]{
        var result = [Comment]()
        let context = AppDelegate.nSManagedObjectContext
        let fetch : NSFetchRequest<NSFetchRequestResult> = Comment.fetchRequest()
        var AllPredicate = [NSPredicate]()
        if key != nil{
            let predicate1 = NSPredicate(format: "key == %@", key)
            AllPredicate.append(predicate1)
        }
        if AllPredicate.count>=1{
            let compoundPredicate = NSCompoundPredicate.init(type: .and, subpredicates:AllPredicate)
            fetch.predicate = compoundPredicate
        }
        do {
            result = try context?.fetch(fetch) as! [Comment]
        } catch  {
            print("Error")
        }
        return result
    }
}
