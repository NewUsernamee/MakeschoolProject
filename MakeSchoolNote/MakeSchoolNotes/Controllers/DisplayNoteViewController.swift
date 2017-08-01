//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //print(note?.title ?? "")
        
        //let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if (segue.identifier == "save")
        {
            //if (noteContentTextView.text != "")
            //{
            let note = self.note ?? CoreDataHelper.createNote()
            note.title = noteTitleTextField.text ?? ""
            if (note.title == "")
            {
                note.title = "Untitled"
            }
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
           // listNotesTableViewController.notes.append(Note)
        }
            //}
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) // 1 
        noteTitleTextField.text = note?.title ?? ""
        noteContentTextView.text = note?.content ?? ""
        /*
        if let note = note
        {
            // 2
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        }
        else
        {
            // 3
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let navigationBarTitle = UINavigationBar.te
        //navigationBarTitle.title = noteTitleTextField.text //setting title to note title
        //let noteTitle = Note()
        //let noteTitle = Note()
        if (note?.title == nil)
        {
            self.navigationItem.title = "New Note"
        }
        else
        {
            self.navigationItem.title = note?.title
        }
            //noteTitle.title// ?? ""//noteTitleTextField.text
        //reloadData()
    }
    
}
