//
//  ContactPersonEditVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 14/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class ContactPersonEditVC: UIViewController, UITextFieldDelegate {

   @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var autofillCheckBtn: UIButton!
    @IBOutlet weak var contactPersonNameTF: MDCTextField!
    @IBOutlet weak var designationTF: MDCTextField!
    @IBOutlet weak var roleTF: MDCTextField!
    @IBOutlet weak var companyURLTF: MDCTextField!
    @IBOutlet weak var superUserEmailIDTF: MDCTextField!
    @IBOutlet weak var emailIDForCommunicationTF: MDCTextField!
    @IBOutlet weak var phoneTF: MDCTextField!
    @IBOutlet weak var mobileNumberTF: MDCTextField!
    @IBOutlet weak var emailId1: MDCTextField!
    @IBOutlet weak var emailId2TF: MDCTextField!
    
        var contactPersonNameController: MDCTextInputControllerOutlined!
        var designationController: MDCTextInputControllerOutlined!
        var roleController: MDCTextInputControllerOutlined!
        var companyURLController: MDCTextInputControllerOutlined!
        var superUserEmailIDController: MDCTextInputControllerOutlined!
        var emailIDForCommunicationController: MDCTextInputControllerOutlined!
        var phoneController: MDCTextInputControllerOutlined!
        var mobileNumberController: MDCTextInputControllerOutlined!
        var emailId1Controller: MDCTextInputControllerOutlined!
        var emailId2Controller: MDCTextInputControllerOutlined!
    var autofill = false

        
        override func viewDidLoad() {
            super.viewDidLoad()
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tap.delegate = self as? UIGestureRecognizerDelegate
            view.addGestureRecognizer(tap)
            self.contactPersonNameController = MDCTextInputControllerOutlined(textInput: contactPersonNameTF)
            self.designationController = MDCTextInputControllerOutlined(textInput: designationTF)
            self.roleController = MDCTextInputControllerOutlined(textInput: roleTF)
            self.companyURLController = MDCTextInputControllerOutlined(textInput: companyURLTF)
            self.superUserEmailIDController = MDCTextInputControllerOutlined(textInput: superUserEmailIDTF)
            self.emailIDForCommunicationController = MDCTextInputControllerOutlined(textInput: emailIDForCommunicationTF)
            self.phoneController = MDCTextInputControllerOutlined(textInput: phoneTF)
            self.mobileNumberController = MDCTextInputControllerOutlined(textInput: mobileNumberTF)
            self.emailId1Controller = MDCTextInputControllerOutlined(textInput: emailId1)
            self.emailId2Controller = MDCTextInputControllerOutlined(textInput: emailId2TF)
            scrollViewHeight.constant = view.intrinsicContentSize.height/2
            nextBtn.layer.cornerRadius = nextBtn.frame.height/2
            let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
            let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

            let gradientLayer = CAGradientLayer()
            
            gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
                
            gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.cornerRadius = nextBtn.frame.height/2
            self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)

            // Do any additional setup after loading the view.
        }
    
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            contactPersonNameTF.resignFirstResponder()
            designationTF.resignFirstResponder()
            roleTF.resignFirstResponder()
            companyURLTF.resignFirstResponder()
            superUserEmailIDTF.resignFirstResponder()
            emailIDForCommunicationTF.resignFirstResponder()
            phoneTF.resignFirstResponder()
            mobileNumberTF.resignFirstResponder()
            emailId1.resignFirstResponder()
            emailId2TF.resignFirstResponder()
        }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            contactPersonNameTF.resignFirstResponder()
            designationTF.resignFirstResponder()
            roleTF.resignFirstResponder()
            companyURLTF.resignFirstResponder()
            superUserEmailIDTF.resignFirstResponder()
            emailIDForCommunicationTF.resignFirstResponder()
            phoneTF.resignFirstResponder()
            mobileNumberTF.resignFirstResponder()
            emailId1.resignFirstResponder()
            emailId2TF.resignFirstResponder()
            return true
        }
    
        func textFieldDidBeginEditing(_ textField: UITextField) {
            UIView.animate(withDuration: 0.5) {
                self.view.frame.origin.y = -330
            }
        }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
            UIView.animate(withDuration: 0.5) {
                self.view.frame.origin.y = 0
            }
        }
    
    @IBAction func autofillCheck(_ sender: UIButton) {
        autofill = true
        autofill = !autofill
        if autofill == true{
            autofillCheckBtn.setImage(UIImage(named: "check"), for: .normal)
        }else{
            autofillCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
    func customAlert(title:String, msg:String){
              let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
        @IBAction func savePressed(_ sender: UIButton) {
        if contactPersonNameTF.text?.count == 0 || designationTF.text?.count == 0 || roleTF.text?.count == 0 || companyURLTF.text?.count == 0 || superUserEmailIDTF.text?.count == 0 || emailIDForCommunicationTF.text?.count == 0 || phoneTF.text?.count == 0 || mobileNumberTF.text?.count == 0 || emailId1.text?.count == 0 || emailId2TF.text?.count == 0{
                customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
        }else if superUserEmailIDTF.text?.isValidEmail == false{
            customAlert(title: "Super User Email-ID is not Valid", msg: "Please enter a Valid Super User Email-ID")
        }else if emailIDForCommunicationTF.text?.isValidEmail == false{
        customAlert(title: "Super User Email-ID is not Valid", msg: "Please enter a Valid Super User Email-ID")
        }else if emailId1.text?.isValidEmail == false{
            customAlert(title: "Super User Email-Id 1 is not Valid", msg: "Please enter a Valid Super User Email-ID")
        }else if emailId2TF.text?.isValidEmail == false{
            customAlert(title: "Super User Email-Id 2 is not Valid", msg: "Please enter a Valid Super User Email-ID")
        }else{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileVC") as! CompanyProfileVC
            present(vc, animated: true, completion: nil)
        }
        }
        
    @IBAction func clearAllPressed(_ sender: UIButton) {
        contactPersonNameTF.text = ""
        designationTF.text = ""
        roleTF.text = ""
        companyURLTF.text = ""
        superUserEmailIDTF.text = ""
        emailIDForCommunicationTF.text = ""
        phoneTF.text = ""
        mobileNumberTF.text = ""
        emailId1.text = ""
        emailId2TF.text = ""
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
            dismiss(animated: true, completion: nil)
        }

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
