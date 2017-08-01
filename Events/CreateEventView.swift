//
//  CreateEventView.swift
//  Events
//
//  Created by chuangke-12 on 2017/7/31.
//  Copyright © 2017年 Make School. All rights reserved.
//

import Foundation
import UIKit

class CreateEventViewController : UIViewController
{
    var createViewEvent : Event?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var eventNameLabel: UILabel!
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var timeLabel: UILabel!

    //@IBOutlet weak var eventTimeTimeField: UITextField!
    
    @IBAction func createButtonTapped(_ sender: Any)
    {
    
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "save")
        {
            let event = self.createViewEvent ?? CoreDataHelper.createEvent()
            event.name = eventNameTextField.text ?? ""
            if (event.name == "")
            {
                event.name = "Untitled"
            }
            //event.modificationTime = Date() as NSDate
            //CoreDataHelper.saveNote()
            // listNotesTableViewController.notes.append(Note)
        }
        //}
    }

    

    


}
