//
//  ViewController.swift
//  cjqn9_proj3
//
//  Created by CJ on 6/26/17.
//  Copyright © 2017 CJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Declarations for the textfield, button, and textview outlets.
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var textViewCheck: UITextView!
    
    //Declares variable to access Model class.
    let validationModel = model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegates to hide keyboard when 'Return' is tapped on the keyboard.
        nameTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailAddressTextField.delegate = self
        phoneNumberTextField.delegate = self
        
        //Tap gesture declaration for when user taps on the screen.
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground(_:)))
        view.addGestureRecognizer(tap)
        
        let range = NSMakeRange(textViewCheck.text.characters.count - 1, 0)
        textViewCheck.scrollRangeToVisible(range)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Action for the add button once it is enabled by the tappedbackground function.
    @IBAction func addButton(_ sender: UIButton) {
        let bounds = add.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.add.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.add.setImage(#imageLiteral(resourceName: "panda2"), for: .normal)
        }) { (success:Bool) in
            if success {
                //self.add.setImage(#imageLiteral(resourceName: "panda"), for: .normal)
                UIView.animate(withDuration: 0.5, animations: {
                    self.add.bounds = bounds
                    //self.add.setImage(#imageLiteral(resourceName: "panda"), for: .normal)
                })
            }
        }
        
        //After the add button is tapped it should be hidden again for the next user.
        add.isEnabled = false
        
        //Declares variables to add to person struct.
        let name = validationModel.simpleCheck(string: nameTextField.text!)
        let username = validationModel.simpleCheck(string: usernameTextField.text!)
        let password = validationModel.passwordCheck(password: passwordTextField.text!)
        let email = validationModel.simpleCheck(string: emailAddressTextField.text!)
        let phoneNumber = validationModel.phoneNumberCheck(phoneNumber: phoneNumberTextField.text!)
        
        //Creates person struct to output information from one person.
        let person = validationModel.updateUser(name: name, username: username, password: password, emailaddress: email, phonenumber: phoneNumber)
        
        //Clears text fields for next user to enter information.
        nameTextField.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
        emailAddressTextField.text = ""
        phoneNumberTextField.text = ""
        
        //If the textview is empty output one user, if the textview is filled keep the remaining user(s) and add another.
        if textViewCheck.text.isEmpty {
            textViewCheck.text = "name: \(person.myName) username: \(person.myUsername) password: \(person.myPassword) email: \(person.myEmail) phone number: \(person.myPhoneNumber)"
            } else {
                textViewCheck.text = textViewCheck.text + "\nname: \(person.myName) username: \(person.myUsername) password: \(person.myPassword) email: \(person.myEmail) phone number: \(person.myPhoneNumber)"
        }
    }
    
    func tappedBackground(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        emailAddressTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        
        validateEntry()
    }
    
    func validateEntry() {
        let name = validationModel.simpleCheck(string: nameTextField.text!)
        let username = validationModel.simpleCheck(string: usernameTextField.text!)
        let password = validationModel.passwordCheck(password: passwordTextField.text!)
        let email = validationModel.simpleCheck(string: emailAddressTextField.text!)
        let phoneNumber = validationModel.phoneNumberCheck(phoneNumber: phoneNumberTextField.text!)
        
        if nameTextField.text != "" {
            if name == "False" {
                let alert = UIAlertController(title: "Invalid Entry", message: "Name must be at least 3 characters long", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        if usernameTextField.text != "" {
            if username == "False" {
                let alert = UIAlertController(title: "Invalid Entry", message: "Username must be at least 3 characters long", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                //print(username)
            }
        }
        
        if passwordTextField.text != "" {
            if password == "False" {
                let alert = UIAlertController(title: "Invalid Entry", message: "Password must be at least 7 characters long", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                //print(password)
            }
        }
        
        if emailAddressTextField.text != "" {
            if email == "False" {
                let alert = UIAlertController(title: "Invalid Entry", message: "Email Address must be at least 3 characters long", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                //print(email)
            }
        }
        
        if phoneNumberTextField.text != "" {
            if phoneNumber == "False" {
                let alert = UIAlertController(title: "Invalid Entry", message: "Email Address must be at least 3 characters long", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                //print(phoneNumber)
            }
            
            if name != "False" && username != "False" && password != "False" && email != "False" && phoneNumber != "False" {
                add.isEnabled = true
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        validateEntry()
        return true
    }
}



