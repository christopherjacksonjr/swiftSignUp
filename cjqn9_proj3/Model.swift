//
//  Model.swift
//  cjqn9_proj3
//
//  Created by CJ on 6/26/17.
//  Copyright © 2017 CJ. All rights reserved.
//

import Foundation

class model {
    
    struct Person {
        var myName: String
        var myUsername: String
        var myPassword: String
        var myEmail: String
        var myPhoneNumber: String
        
        init(myName: String, myUsername: String, myPassword: String, myEmail: String, myPhoneNumber: String) {
            self.myName = myName
            self.myUsername = myUsername
            self.myPassword = myPhoneNumber
            self.myEmail = myEmail
            self.myPhoneNumber = myPhoneNumber
        }
    }
    
    //Checks that the name, username, & email address are at least 3 characters long.
    func simpleCheck(string: String) -> String {
        if string.characters.count < 3 {
            return "False"
        } else {
            return string
        }
    }
    
    //Checks that the password is at least 7 characters long.
    func passwordCheck(password: String) -> String {
        if password.characters.count < 7 {
            return "False"
        } else {
            return password
        }
    }
    
    //Checks that the phone number contains only digits and no letters.
    func phoneNumberCheck(phoneNumber: String) -> String {
        for variable in phoneNumber.characters {
            if variable != "1" || variable != "2" {
                //print("Not a number")
            } else {
            //print(variable)
            }
        }
        return phoneNumber
    }
    
    func updateUser(name: String, username: String, password: String, emailaddress: String, phonenumber: String) -> (myName: String, myUsername: String, myPassword: String, myEmail: String, myPhoneNumber: String) {
        var person = Person(myName: name, myUsername: username, myPassword: password, myEmail: emailaddress, myPhoneNumber: phonenumber)
        
        person.myName = name
        person.myUsername = username
        person.myPassword = password
        person.myEmail = emailaddress
        person.myPhoneNumber = phonenumber
        
        return (name, username, password, emailaddress, phonenumber)
    }
}
