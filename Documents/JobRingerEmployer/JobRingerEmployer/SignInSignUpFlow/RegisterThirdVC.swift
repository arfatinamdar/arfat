//
//  RegisterSecond.swift
//  JobRingerEmployee
//
//  Created by MAC on 28/02/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class RegisterThirdVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var officeAddressTV: UITextView!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var contactPersonNameTF: MDCTextField!
    @IBOutlet weak var contactPersonDesignationTF: MDCTextField!
    @IBOutlet weak var countryCodeTF: MDCTextField!
    @IBOutlet weak var mobileNumberTF: MDCTextField!
    @IBOutlet weak var emailIDTF: MDCTextField!
    @IBOutlet weak var emailForJobResponse1: MDCTextField!
    @IBOutlet weak var emailForJobResponse2: MDCTextField!
    @IBOutlet weak var landlineTF: MDCTextField!
    @IBOutlet weak var uploadDocumentsBtn: UIButton!
    
    var contactPersonNameController: MDCTextInputControllerOutlined!
    var contactPersonDesignationController: MDCTextInputControllerOutlined!
    var countryCodeController: MDCTextInputControllerOutlined!
    var mobileNumberController: MDCTextInputControllerOutlined!
    var landlineController: MDCTextInputControllerOutlined!
    var emailIDController: MDCTextInputControllerOutlined!
    var emailForJobResponse1Controller: MDCTextInputControllerOutlined!
    var emailForJobResponse2Controller: MDCTextInputControllerOutlined!
    let datePicker = UIDatePicker()
    var hideDOBFromEmployer = false
    var isDiferntlyAbled = false
    var male = false
    var female = false
    var other = false
    var gender = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadDocumentsBtn.layer.cornerRadius = 25
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        self.contactPersonNameController = MDCTextInputControllerOutlined(textInput: self.contactPersonNameTF)
        self.contactPersonDesignationController = MDCTextInputControllerOutlined(textInput: self.contactPersonDesignationTF)
        self.countryCodeController = MDCTextInputControllerOutlined(textInput: self.countryCodeTF)
        self.mobileNumberController = MDCTextInputControllerOutlined(textInput: self.mobileNumberTF)
        self.landlineController = MDCTextInputControllerOutlined(textInput: self.landlineTF)
        self.emailIDController = MDCTextInputControllerOutlined(textInput: self.emailIDTF)
        self.emailForJobResponse1Controller = MDCTextInputControllerOutlined(textInput: self.emailForJobResponse1)
        self.emailForJobResponse2Controller = MDCTextInputControllerOutlined(textInput: self.emailForJobResponse2)
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
    officeAddressTV.text = "Office Address"
        officeAddressTV.textColor = UIColor.lightGray
        officeAddressTV.isEditable = true
        officeAddressTV.layer.borderWidth = 1
        officeAddressTV.layer.borderColor = UIColor.gray.cgColor
        officeAddressTV.layer.cornerRadius = 10

        let gradientLayer = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = nextBtn.frame.height/2
        self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if officeAddressTV.textColor == UIColor.lightGray {
            officeAddressTV.text = nil
            officeAddressTV.textColor = UIColor.black
            officeAddressTV.layer.borderWidth = 2
            officeAddressTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if officeAddressTV.text.isEmpty {
            officeAddressTV.text = "Address"
            officeAddressTV.layer.borderWidth = 1
            officeAddressTV.textColor = UIColor.lightGray
            officeAddressTV.layer.borderColor = UIColor.gray.cgColor
            
            
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = 1000 - officeAddressTV.text.count

        counterLbl.text =  "\(newLength)" + "/1000"
        if officeAddressTV.text.count >= 1000{
            return false
        }
        // Set value of the label
        // myCounter = newLength // Optional: Save this value
        // return newLength <= 25 // Optional: Set limits on input.
        return true
    }
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if contactPersonNameTF.text?.count == 0 || contactPersonDesignationTF.text?.count == 0 || countryCodeTF.text?.count == 0 || mobileNumberTF.text?.count == 0 || landlineTF.text?.count == 0 || emailIDTF.text?.count == 0 || emailForJobResponse1.text?.count == 0 || emailForJobResponse2.text?.count == 0{
            customAlert(title: "All the  fields are compulsory", msg: "Please enter all the fields")
        }else if mobileNumberTF.text?.isMobileValid == false{
            customAlert(title: "Mobile number is not valid", msg: "Please enter tha Valid Mobile number")
        }else if emailIDTF.text?.isValidEmail == false{
            customAlert(title: "Email Address is not Valid", msg: "Please provide Valid Email Address")
        }else if emailForJobResponse1.text?.isValidEmail == false{
        customAlert(title: "Email ID for job response 1 is not Valid", msg: "Please provide Valid Email Address")
        }else if emailForJobResponse2.text?.isValidEmail == false{
        customAlert(title: "Email ID for job response 2 is not Valid", msg: "Please provide Valid Email Address")
        }else{
            struct RegisterSecondStuct: Codable {
                let contactPersonName: String
                let contactPersonDesignation: String
                let countryCode: String
                let mobileNumber: String
                let landline: String
                let emailID: String
                let emailForJobResponse1: String
                let emailForJobResponse2: String
            }

            let registerSecond = RegisterSecondStuct(contactPersonName: contactPersonNameTF.text ?? "", contactPersonDesignation: contactPersonDesignationTF.text ?? "", countryCode: countryCodeTF.text ?? "", mobileNumber: mobileNumberTF.text ?? "", landline: landlineTF.text ?? "", emailID: emailIDTF.text ?? "", emailForJobResponse1: emailForJobResponse1.text ?? "", emailForJobResponse2: emailForJobResponse2.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(registerSecond) else {
                return
            }
            let url = URL(string: "https://example.com/post")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let parameters: [String: Any] = [
                "userid": "",
                "name": ""
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
                if let error = error {
                    print ("error: \(error)")
                    self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
                    return
                }
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) else {
                    print ("server error")
                        self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
                    return
                }
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("got data: \(dataString)")
                }
            }
            task.resume()
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterThirdVC") as! RegisterThirdVC
        present(vc, animated: true, completion: nil)
        }
    }

    @IBAction func uploadDocumetsBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UploadDocumentsVC") as! UploadDocumentsVC
        present(vc, animated: true, completion: nil)
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
