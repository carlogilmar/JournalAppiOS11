//
//  CreateEntry.swift
//  Journal
//
//  Created by Carlo Gilmar on 3/18/18.
//  Copyright © 2018 Carlo Gilmar. All rights reserved.
//

import UIKit

class CreateEntry: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
    }
    
    @IBAction func addTag(){
        presentAlertController()
    }
    
    @IBAction func save(){
        guard let title = titleTextField.text, !title.isEmpty,
            let body = bodyTextView.text, !body.isEmpty else {return}
        titleTextField.text = ""
        bodyTextView.text = "Enter a body..."
        addTagButton.setTitle("Add a tag", for: .normal)
        
        var tag: String? = nil
        if addTagButton.titleLabel?.text != "Add a Tag" {
            tag = addTagButton.titleLabel?.text
        }
        
        EntryController.shared.createEntry(withTitle: title, body: body, tag: tag, color: .lightGray)
        
        resignResponders()
    }
    
    @IBAction func dismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func resignResponders(){
        titleTextField.resignFirstResponder()
        bodyTextView.resignFirstResponder()
    }
    
}

extension CreateEntry{
    
    func presentAlertController(){
        let alertController = UIAlertController(title:"Tag", message:"Add a tag", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a tag you wish to add..."
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addTagAction = UIAlertAction(title: "Add", style:.default){ (_) in
            guard let textField = alertController.textFields?.first,
                let tag = textField.text, !tag.isEmpty else {return}
            self.addTagButton.setTitle(tag, for: .normal)
        }
        
        alertController.addAction(dismissAction)
        alertController.addAction(addTagAction)
        
        present(alertController, animated:true, completion:nil)
    }
    
}

extension CreateEntry: KeyboardScrollable {
    
    func keyboardDidShow(_ notification: Notification) {
        keyboardWasShow(notification)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        keyboardWillBeHidden(notification)
    }
}
