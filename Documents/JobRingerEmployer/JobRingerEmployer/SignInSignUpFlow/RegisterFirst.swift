//
//  RegisterFirst.swift
//  JobRingerEmployee
//
//  Created by MAC on 28/02/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class RegisterFirst: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var referalCodeCheckImg: UIImageView!
    @IBOutlet weak var companyNameTF: MDCTextField!
    @IBOutlet weak var companyID: MDCTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTF: MDCTextField!
    @IBOutlet weak var confirmPasswordTF: MDCTextField!
    @IBOutlet weak var superUserEmailTF: MDCTextField!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var directEmployerCheckImg: UIImageView!
    @IBOutlet weak var recruitmentAgencyCheckImg: UIImageView!
    
    var companyIDController: MDCTextInputControllerOutlined!
    var companyNameController: MDCTextInputControllerOutlined!
    var superUserEmailController: MDCTextInputControllerOutlined!
    var passwordController: MDCTextInputControllerOutlined!
    var confirmPasswordController: MDCTextInputControllerOutlined!
    
    var isDirectEmployer = false
    var isRecruitmentAgency = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isRecruitmentAgency = false
        isDirectEmployer = true
        recruitmentAgencyCheckImg.image = UIImage(named: "uncheck")
            directEmployerCheckImg.image = UIImage(named: "check")
        self.companyNameController = MDCTextInputControllerOutlined(textInput: self.companyNameTF)
        self.companyIDController = MDCTextInputControllerOutlined(textInput: self.companyID)
        self.superUserEmailController = MDCTextInputControllerOutlined(textInput: self.superUserEmailTF)
        self.passwordController = MDCTextInputControllerOutlined(textInput: self.passwordTF)
        self.confirmPasswordController = MDCTextInputControllerOutlined(textInput: self.confirmPasswordTF)
        
        scrollViewHeight.constant = containerView.intrinsicContentSize.height
        
        // uploadResumeBtn.layer.borderWidth = 1
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = nextBtn.frame.height/2
        self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        if sender.tag == 0{
            isRecruitmentAgency = false
            isDirectEmployer = true
            recruitmentAgencyCheckImg.image = UIImage(named: "uncheck")
                directEmployerCheckImg.image = UIImage(named: "check")
        }
        if sender.tag == 1{
            isDirectEmployer = false
            isRecruitmentAgency = true
            directEmployerCheckImg.image = UIImage(named: "uncheck")
                recruitmentAgencyCheckImg.image = UIImage(named: "check")
        }
    }
    @IBAction func updateResumePressed(_ sender: UIButton) {
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        //        else{
        //        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
        //         if error == nil {
        //           self.performSegue(withIdentifier: "signupToHome", sender: self)
        //                        }
        //         else{
        //           let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        //           let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        //
        //            alertController.addAction(defaultAction)
        //            self.present(alertController, animated: true, completion: nil)
        //               }
        //                    }
        //              }
        //            var password = self.paswwordTextField.text
        //             Validate the text fields
        
        if companyNameTF.text?.count == 0 || companyID.text?.count == 0 || superUserEmailTF.text?.count == 0 || passwordTF.text?.count == 0 || confirmPasswordTF.text?.count == 0{
            customAlert(title: "All fields are compulsory", msg: "Please enter all the fields")
            }else if superUserEmailTF.text!.isValidEmail == false{
            customAlert(title: "", msg: "Please enter a valid Email Address")
        }else if passwordTF.text?.count ?? 0 < 5 {
            
            customAlert(title: "Password Incorrect", msg: "Your password should not be less than 5 digits")
            
        }else if passwordTF.text != confirmPasswordTF.text {
        
        customAlert(title: "Password does'nt match", msg: "Please type the same password on both the field")
        }else{

            // ...

            let registerFirst = RegisterFirstStruct(directEmp: isDirectEmployer, recruitmentAgency: isRecruitmentAgency,companyName: companyNameTF.text ?? "",companyID: companyID.text ?? "", superUserEmail: superUserEmailTF.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(registerFirst) else {
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
            let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterSecondVC") as! RegisterSecondVC
            present(vc, animated: true, completion: nil)
        }
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
