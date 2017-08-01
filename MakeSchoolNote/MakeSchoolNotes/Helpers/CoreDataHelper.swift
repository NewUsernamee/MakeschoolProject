//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by chuangke-12 on 2017/7/21.
//  Copyright © 2017年 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper
{
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func createNote() -> Note
    {
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return newNote
    }
    
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func getNoteFromData() -> [Note]
    {
        let fetchRequest = NSFetchRequest<Note>(entityName:"Note")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        }
        catch let error as NSError
        {
            print("\(error)")
        }
        return []
    }
    
    static func deleteNote(note: Note)
    {
        managedContext.delete(note)
        saveNote()
    }
}
