//
//  UserViewModel.swift
//  UnitTestCase
//
//  Created by Purva Ruparelia on 07/09/22.
//

import Foundation

// MARK: Enum for valid age
enum AgeError: LocalizedError {
    case notValidAge
}

class UserViewModel {
    
    // MARK: Validation method
    func validation(userModel: UserModel) throws -> Bool {
        if userModel.firstName.isEmpty {
            return false
        } else if try !validateAgeForVoting(age: userModel.age) {
            return false
        } else if userModel.email.isEmpty {
            return false
        } else if !validateEmail(email: userModel.email) {
            return false
        } else if userModel.password.isEmpty {
            return false
        } else if !validatePassword(password: userModel.password) {
            return false
        }
        return true
    }
    
    // MARK: Email validation method
    func validateEmail(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: email)
    }
     
    // MARK: Password validation method
    func validatePassword(password: String) -> Bool {
        let regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{6,}$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: password)
    }
    
    // MARK: Age validation method
    func validateAgeForVoting(age: Int) throws -> Bool {
        if age > 18 {
            return true
        }
        throw AgeError.notValidAge
    }
    
}
