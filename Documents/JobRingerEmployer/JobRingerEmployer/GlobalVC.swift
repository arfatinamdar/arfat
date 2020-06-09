//
//  GlobalVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 08/04/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration

extension String{
    var isValidEmail : Bool{
        
        let emailRegEx = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
        
    }
}
extension String{
    var isMobileValid : Bool{
        
        let mobileRegEx = "^[7-9][0-9]{9}$"
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", mobileRegEx)
        return mobileTest.evaluate(with: self)
        
    }
}
extension String{
    var isValidPincode : Bool{
        
        let emailRegEx = "^[1-9][0-9]{5}$"
        
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
        
    }
}
extension String{
    var isValidAadhar : Bool{
        
        let emailRegEx = "^[0-9]{16}$"
        
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
        
    }
}
extension String{
    var isValidPAN : Bool{
        
        let emailRegEx = "^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$"
        
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
        
    }
}
extension String{
    var isValidGST : Bool{
        
        let emailRegEx = "^([0][1-9]|[1-2][0-9]|[3][0-7])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$"
        
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
        
    }
}
struct RegisterFirstStruct: Codable {
    let directEmp: Bool
    let recruitmentAgency: Bool
    let companyName: String
    let companyID: String
    let superUserEmail: String
}
