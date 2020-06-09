//
//  AddContactPerson2VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 29/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class AddContactPerson2VC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var nameTF: MDCTextField!
    @IBOutlet weak var designationTF: MDCTextField!
    @IBOutlet weak var emailIdTF: MDCTextField!
    @IBOutlet weak var mobileNoTF: MDCTextField!
    @IBOutlet weak var whatsAppNoTF: MDCTextField!
    @IBOutlet weak var landlineNoTF: MDCTextField!
    @IBOutlet weak var addBtn: UIButton!
    
    var nameController: MDCTextInputControllerOutlined!
    var designationController: MDCTextInputControllerOutlined!
    var emailIdController: MDCTextInputControllerOutlined!
    var mobileNoController: MDCTextInputControllerOutlined!
    var whatsAppNoController: MDCTextInputControllerOutlined!
    var landlineNoController: MDCTextInputControllerOutlined!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        self.nameController = MDCTextInputControllerOutlined(textInput: nameTF)
        self.designationController = MDCTextInputControllerOutlined(textInput: designationTF)
        self.emailIdController = MDCTextInputControllerOutlined(textInput: emailIdTF)
        self.mobileNoController = MDCTextInputControllerOutlined(textInput: mobileNoTF)
        self.whatsAppNoController = MDCTextInputControllerOutlined(textInput: whatsAppNoTF)
        self.landlineNoController = MDCTextInputControllerOutlined(textInput: landlineNoTF)
        
        scrollViewHeight.constant = view.intrinsicContentSize.height/2
        addBtn.layer.cornerRadius = addBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = addBtn.frame.height/2
        self.addBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        nameTF.resignFirstResponder()
        designationTF.resignFirstResponder()
        emailIdTF.resignFirstResponder()
        mobileNoTF.resignFirstResponder()
        whatsAppNoTF.resignFirstResponder()
        landlineNoTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        designationTF.resignFirstResponder()
        emailIdTF.resignFirstResponder()
        mobileNoTF.resignFirstResponder()
        whatsAppNoTF.resignFirstResponder()
        landlineNoTF.resignFirstResponder()
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
    
    @IBAction func addPressed(_ sender: UIButton) {
//        if nameTF.text?.count == 0 || designationTF.text?.count == 0 || emailIdTF.text?.count == 0 || mobileNoTF.text?.count == 0 || whatsAppNoTF.text?.count == 0{
//            customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
//        }else if emailIdTF.text?.isValidEmail == false{
//            customAlert(title: "Email ID is not Valid", msg: "Please provide a Valid Email ID")
//        }else if mobileNoTF.text?.isMobileValid == false{
//            customAlert(title: "Mobile No is not Valid", msg: "Please provide a Valid Mobile No")
//        }else if whatsAppNoTF.text?.isMobileValid == false{
//            customAlert(title: "WhatsApp No is not Valid", msg: "Please provide a Valid WhatsApp No")
//        }else{
            let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "AddContactPerson3VC") as! AddContactPerson3VC
            present(vc, animated: true, completion: nil)
       // }
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
