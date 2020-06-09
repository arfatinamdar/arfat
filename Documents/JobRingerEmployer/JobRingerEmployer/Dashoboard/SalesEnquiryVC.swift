//
//  SalesEnquiryVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 18/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class SalesEnquiryVC: UIViewController, UITextFieldDelegate {

        @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var companyNameTF: MDCTextField!
    @IBOutlet weak var locationTF: MDCTextField!
    @IBOutlet weak var personNameTF: MDCTextField!
    @IBOutlet weak var designationTF: MDCTextField!
    @IBOutlet weak var phoneNoTF: MDCTextField!
    @IBOutlet weak var emailIdTF: MDCTextField!
    @IBOutlet weak var interestedInTF: MDCTextField!
    @IBOutlet weak var requirementTF: MDCTextField!
    @IBOutlet weak var otherTF: MDCTextField!
    @IBOutlet weak var bestTimeToContactTF: MDCTextField!
    
        var companyNameController: MDCTextInputControllerOutlined!
        var locationController: MDCTextInputControllerOutlined!
        var personNameController: MDCTextInputControllerOutlined!
        var designationController: MDCTextInputControllerOutlined!
        var phoneNoController: MDCTextInputControllerOutlined!
        var emailIdController: MDCTextInputControllerOutlined!
        var interestedInController: MDCTextInputControllerOutlined!
        var requirementController: MDCTextInputControllerOutlined!
        var otherController: MDCTextInputControllerOutlined!
        var bestTimeToContactController: MDCTextInputControllerOutlined!

        
        override func viewDidLoad() {
            super.viewDidLoad()
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tap.delegate = self as? UIGestureRecognizerDelegate
            view.addGestureRecognizer(tap)
            self.companyNameController = MDCTextInputControllerOutlined(textInput: companyNameTF)
            self.locationController = MDCTextInputControllerOutlined(textInput: locationTF)
            self.personNameController = MDCTextInputControllerOutlined(textInput: personNameTF)
            self.designationController = MDCTextInputControllerOutlined(textInput: designationTF)
            self.phoneNoController = MDCTextInputControllerOutlined(textInput: phoneNoTF)
            self.emailIdController = MDCTextInputControllerOutlined(textInput: emailIdTF)
            self.interestedInController = MDCTextInputControllerOutlined(textInput: interestedInTF)
            self.requirementController = MDCTextInputControllerOutlined(textInput: requirementTF)
            self.otherController = MDCTextInputControllerOutlined(textInput: otherTF)
            self.bestTimeToContactController = MDCTextInputControllerOutlined(textInput: bestTimeToContactTF)
            scrollViewHeight.constant = view.intrinsicContentSize.height/2
            submitBtn.layer.cornerRadius = submitBtn.frame.height/2
            let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
            let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

            let gradientLayer = CAGradientLayer()
            
            gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
                
            gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.cornerRadius = submitBtn.frame.height/2
            self.submitBtn.layer.insertSublayer(gradientLayer, at: 0)

            // Do any additional setup after loading the view.
        }
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            companyNameTF.resignFirstResponder()
            locationTF.resignFirstResponder()
            personNameTF.resignFirstResponder()
            designationTF.resignFirstResponder()
            phoneNoTF.resignFirstResponder()
            emailIdTF.resignFirstResponder()
            interestedInTF.resignFirstResponder()
            requirementTF.resignFirstResponder()
            otherTF.resignFirstResponder()
            bestTimeToContactTF.resignFirstResponder()
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            companyNameTF.resignFirstResponder()
            locationTF.resignFirstResponder()
            personNameTF.resignFirstResponder()
            designationTF.resignFirstResponder()
            phoneNoTF.resignFirstResponder()
            emailIdTF.resignFirstResponder()
            interestedInTF.resignFirstResponder()
            requirementTF.resignFirstResponder()
            otherTF.resignFirstResponder()
            bestTimeToContactTF.resignFirstResponder()
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
       func customAlert(title:String, msg:String){
              let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
    @IBAction func submitPressed(_ sender: UIButton) {
    if companyNameTF.text?.count == 0 || locationTF.text?.count == 0 || personNameTF.text?.count == 0 || designationTF.text?.count == 0 || phoneNoTF.text?.count == 0 || emailIdTF.text?.count == 0 || interestedInTF.text?.count == 0 || requirementTF.text?.count == 0 || otherTF.text?.count == 0 || bestTimeToContactTF.text?.count == 0{
                customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
        }else if phoneNoTF.text?.isMobileValid == false{
            customAlert(title: "Mobile No is not Valid", msg: "Please enter your Valid Mobile number")
        }else if emailIdTF.text?.isValidEmail == false{
            customAlert(title: "Email-Id is not Valid", msg: "Please provide a Valid Email Address")
        }else{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileVC") as! CompanyProfileVC
            present(vc, animated: true, completion: nil)
        }
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
