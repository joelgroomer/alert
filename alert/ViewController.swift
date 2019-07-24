//
//  ViewController.swift
//  alert
//
//  Created by Joel Groomer on 7/23/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblYouCancelled: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnShowAlertTapped(_ sender: Any) {
        
        // Here's the example from the documentation
        
        // Create the alert instance
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        
        
        // add an action (button) to the alert
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        
        /* let's break it down...
         
         alert.addAction(       <-- we're adding an action
            UIAlertAction(      <-- we're creating a new instance of an action
                title: String?  <-- it takes an optional string for a button title
                style:          <-- takes an enum option UIAlertAction
                                    .cancel         run the example to see it
                                    .destructive    a button that conveys danger
                                    .default        a button that is probably the
                                    users's first choice
                handler:        <-- basically you're defining a function that runs
                                    when this button is tapped. -> Void means it
                                    has no return value
                { _ in putWhatYouWantToHappenHere }
         
            I will fully admit that I don't understand the `_ in` syntax
            but it doesn't work without it.
         
         So here's another example added to the original...
         */
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in self.lblYouCancelled.isHidden = false }))
        
        
        //show the alert
        present(alert, animated: true, completion: nil)
    }
    
}

