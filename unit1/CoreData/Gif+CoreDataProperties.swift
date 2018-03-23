//
//  Gif+CoreDataProperties.swift
//  unit1
//
//  Created by Hung Dinh on 3/23/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//
//

import Foundation
import CoreData


extension Gif {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gif> {
        return NSFetchRequest<Gif>(entityName: "Gif")
    }

    @NSManaged public var height: Int16
    @NSManaged public var image: NSData?
    @NSManaged public var key: String?
    @NSManaged public var like: Bool
    @NSManaged public var url: String?
    @NSManaged public var width: Int16
    @NSManaged public var comments: NSSet?

}

// MARK: Generated accessors for comments
extension Gif {

    @objc(addCommentsObject:)
    @NSManaged public func addToComments(_ value: Comment)

    @objc(removeCommentsObject:)
    @NSManaged public func removeFromComments(_ value: Comment)

    @objc(addComments:)
    @NSManaged public func addToComments(_ values: NSSet)

    @objc(removeComments:)
    @NSManaged public func removeFromComments(_ values: NSSet)

    static func insertGIF(key:String,like:Bool,url:String,width:Int16,height:Int16) -> Gif?{
        let gif = NSEntityDescription.insertNewObject(forEntityName: "Gif", into: AppDelegate.nSManagedObjectContext!) as! Gif
        gif.key = key
        gif.like = like
        gif.height = height
        gif.width = width
        gif.url = url
        do {
            try AppDelegate.nSManagedObjectContext?.save()
        } catch {
            let errStr = error as NSError
            print("Error: \(errStr)")
            return nil
        }
        print("insert Gif successful!  ")
        return gif
    }
    
    static func getAllGif()->[Gif]{
        var result = [Gif]()
        let context = AppDelegate.nSManagedObjectContext
        do{
            try result = (context?.fetch(Gif.fetchRequest()))!
        }catch{
            print("Can't get data from DataBase")
        }
        return result
    }
    
    static func deleteAllGif()->Bool{
        let gifs = Gif.getAllGif()
        let context = AppDelegate.nSManagedObjectContext
        for gif in gifs{
            context?.delete(gif)
        }
        do {
            try context?.save()
        } catch  {
            let errorStr = error as NSError
            print(errorStr)
            return false
        }
        print("All Gif Deleted!")
        return true
    }
    
    static func getGif(key:String)-> [Gif]{
        var result = [Gif]()
        let context = AppDelegate.nSManagedObjectContext
        let fetch : NSFetchRequest<NSFetchRequestResult> = Gif.fetchRequest()
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
            result = try context?.fetch(fetch) as! [Gif]
        } catch  {
            print("Error")
        }
        return result
    }
}
