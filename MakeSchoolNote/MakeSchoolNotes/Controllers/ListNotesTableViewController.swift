//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
//    print(notes[0])
    // 1
    var notes = [Note]()
    {
        didSet
        {
            

            
            var revNote = notes
            let arrLen = notes.count
            //print(arrLen)
            //print("t \(tempNote.count)")
            if (arrLen>0)
            {
                for index in 0...arrLen-1
                {
                    //print(index)
                    notes[index] = revNote[arrLen - index-1]
                }
            }
            tableView.reloadData()
        }
    }

    //let objNote = Note()
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let note = notes[row]
        
        // 3
        cell.noteTitleLabel.text = note.title! + String(indexPath.row)
        
        // 4
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                // 1
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                let note = notes[indexPath.row]
                // 3
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                // 4
                displayNoteViewController.note = note
                
            }
            else if identifier == "addNote" {
                print("+ button tapped") //debug stuff
            }
        }
    }
    
    // 1
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 2
        if editingStyle == .delete {
            // 3
            CoreDataHelper.deleteNote(note: notes[indexPath.row])
            //notes.remove(at: indexPath.row)
            notes = CoreDataHelper.getNoteFromData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.getNoteFromData()

        //Array - Tuple - Array
        
        let myArr = [(day: "1", event:[1,2,3]),(dar: "2", event:[4,5,6])] as [Any]
        let myTpl = myArr[0]
        print(myTpl)
        
        //Array - Dict
        let myDictionary : [String:[Int]] = ["1":[1,2,3],"2":[3,4,5]]
        print(myDictionary["1"]![0])
        //[ ARRAY, DOUBLE]
        
        //let tempArr = myArr[0][1] as! [Double]
        //let valueOfConcern = tempArr[0]
        //print(valueOfConcern)
        //[0] as [[[Double]]]
       // let arrSpec = [myArr[0][1]

     //   print(arrSpec[0])
        
    }
    
    
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
        self.notes = CoreDataHelper.getNoteFromData()
        
    }
    
}
