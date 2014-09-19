//
//  KeyboardViewController.swift
//  CustomKeyBoard
//
//  Created by Admin on 19/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {


    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        
        let subviewArray = NSBundle.mainBundle().loadNibNamed("CustomKeyBoard", owner: self, options: nil)
        self.view.addSubview(subviewArray[0] as UIView);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
    }
    
    // Keyboard Actions
    var isCapsEnable:Bool = true;
    @IBAction func enableCapsButtonTapped(sender: AnyObject) {
        isCapsEnable = !isCapsEnable
    
    }
    @IBAction func globeButtonTapped(sender: AnyObject) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        self.advanceToNextInputMode()
    }
    
    @IBAction func otherButtonTapped(sender: AnyObject) {
        var tempButton = sender as UIButton
        var proxy = textDocumentProxy as UITextDocumentProxy
        var lowercase = tempButton.currentTitle?.lowercaseString
       
        if isCapsEnable {
            proxy.insertText(lowercase!)
        }
        else{
             proxy.insertText(tempButton.currentTitle!)
        }

    
    }
    @IBAction func spaceButtonTapped(sender: AnyObject) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(" ")
    }
    
    @IBAction func returnButtontapped(sender: AnyObject) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")

    }
   
    @IBAction func clearButtonTapped(sender: AnyObject) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()

    }
}
