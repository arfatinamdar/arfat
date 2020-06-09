//
//  UserLoginVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 27/02/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class UserLoginVC: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userIdTextField: MDCTextField!
    @IBOutlet weak var passwordTextField: MDCTextField!
    @IBOutlet weak var loginWithGoogleBtn: UIButton!
    @IBOutlet weak var salesEnquiryBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    
    var userIdController: MDCTextInputControllerOutlined?
    var passwordController: MDCTextInputControllerOutlined?
    var isFrom = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userIdController = MDCTextInputControllerOutlined(textInput: self.userIdTextField)
        self.passwordController = MDCTextInputControllerOutlined(textInput: self.passwordTextField)
        
        registerBtn.layer.cornerRadius = registerBtn.bounds.height/2
        registerBtn.layer.borderWidth = 1.0
        registerBtn.layer.borderColor = UIColor.gray.cgColor
        
        loginBtn.layer.cornerRadius = registerBtn.frame.height/2
        loginBtn.layer.borderWidth = 1.0
        loginBtn.layer.borderColor = UIColor.gray.cgColor
        
        searchBtn.layer.cornerRadius = searchBtn.frame.height/2
        searchBtn.layer.borderWidth = 1.0
        searchBtn.layer.borderColor = UIColor.gray.cgColor
        
        salesEnquiryBtn.layer.cornerRadius = salesEnquiryBtn.frame.height/2
        salesEnquiryBtn.layer.borderWidth = 1.0
        salesEnquiryBtn.layer.borderColor = UIColor.gray.cgColor
        
        loginWithGoogleBtn.layer.cornerRadius = 10
        loginWithGoogleBtn.layer.shadowColor = UIColor.gray.cgColor
        loginWithGoogleBtn.layer.shadowRadius = 2
        loginWithGoogleBtn.layer.shadowOpacity = 0.5
        loginWithGoogleBtn.layer.shadowOffset = CGSize(width: -1, height: 1)
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = loginBtn.frame.height/2
        self.loginBtn.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
    }
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func loginWithGooglePressed(_ sender: UIButton) {
    }
    @IBAction func skipPressed(_ sender: UIButton) {
        //let vc = UIStoryboard(name: "WithoutLogin", bundle: nil).instantiateViewController(withIdentifier: "WithoutLoginHomeVC") as! WithoutLoginHomeVC
        //present(vc, animated: true, completion: nil)
    }
    @IBAction func salesEnquiryPressed(_ sender: UIButton) {
    }
    @IBAction func searchPressed(_ sender: UIButton) {
    }
    
    @IBAction func forgotPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        if userIdTextField.text?.count == 0 && passwordTextField.text?.count == 0{
            customAlert(title: "", msg: "Please enter Email ID and Passwoerd")
        }else if userIdTextField.text?.isValidEmail == false{
            customAlert(title: "Email-ID is not valid", msg: "Please enter a valid Email Address")
        }else if passwordTextField.text?.count ?? 0 < 5 {
        customAlert(title: "Password Incorrect", msg: "Your password should not be less than 5 digits")
        }else{
           // let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            //present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterFirst") as! RegisterFirst
        present(vc, animated: true, completion: nil)
    }
   
    @IBAction func backPressed(_ sender: UIButton) {
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
