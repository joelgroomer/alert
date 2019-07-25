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
    @IBOutlet weak var txtvYouSaid: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnShowAlertTapped(_ sender: Any) {
        
        // Here's the example from the documentation
        
        // Create the alert instance
        let alert = UIAlertController(title: "My Alert", message: "Say something.", preferredStyle: .alert)
        
        
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
                                    when this button is tapped. `-> Void` means it
                                    has no return value
                { _ in putWhatYouWantToHappenHere }
         
                The `_` here is where the action itself is passed into your handler.
                Since you probably won't use it, you use the underscore syntax to
                effectively ignore it.
         
                Your handler function can span multiple lines. Just be sure to close
                it with the curly brace and two close parens to (one for the UIAlertAction
                init you called and one for the addAction init you called) like
                this:     }))
         
         
         So here's another example added to the original...
         */
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            _ in self.lblYouCancelled.isHidden = false
            self.txtvYouSaid.isHidden = true
        }))
        
        
        // Now we'll add a text field so the user can input something...
        
        alert.addTextField(configurationHandler: { txt in
            txt.placeholder = "What do you want to say?"
        })
        
        /* breakdown...
         
         alert.addTextField(        <-- obvi
            configurationHandler:   <-- another inline function that runs to set up
                                        your text box before it gets displayed
            txt in txt              <-- Just like the `_ in` above, this is where the text
                                        field itself is getting passed into your inline
                                        function. This time we want to use that reference,
                                        so we're giving it a name: `txt`. You can call it
                                        whatever you want.
            txt.placeholder         <-- grabbing the text field (txt) and setting the
                                        `placeholder` property on it. This property is
                                        for the light gray text that appears in your text
                                        field before a user starts typing, usually to give
                                        them a hint about what they should type.
         
        Other things you could set in your configurationHandler function:
        >   text                    The default text.
        >   textColor               The font color.
        >   font                    The font.
        >   textAlignment           .center, .justified, .left, .natural, .right
        >   clearButtonMode         .never, .whileEditing, .unlessEditing, .always
        >   autocapitalizationType  .allCharacters, .none, .sentences, .words
        >   autocorrectionType      .default, .no, .yes
        >   spellCheckingType       .default, .no, .yes
        >   keyboardType            I mean just hit . and see what types come up lol
        > more options and info at https://developer.apple.com/documentation/uikit/uitextfield
        
         And again we close everything:     })
         
         */
        
        // Now if we want to use the text we collected, we have to put that into
        // an action handler. Here's a modified version of the 'OK' button from the
        // documentation that does that.

        alert.addAction(UIAlertAction(title: NSLocalizedString("Say it", comment: "Default action"), style: .default, handler: { _ in
            self.lblYouCancelled.isHidden = true
            guard let userSaid = alert.textFields?[0].text else { return }
            self.txtvYouSaid.text = userSaid
            self.txtvYouSaid.isHidden = false
        }))
        
        // You can access the alert's text fields through it's .textFields property
        // which is an optional array of Strings. If you only have one text field, it
        // will be 0.

        
        
        
        // finally, we show the alert
        
        present(alert, animated: true, completion: nil)
    }
    
}

