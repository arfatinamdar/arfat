//
//  ForgotPasswordVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 28/02/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var emailIDTextField: MDCTextField!
    
    var emailIDController: MDCTextInputControllerOutlined!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailIDController = MDCTextInputControllerOutlined(textInput: emailIDTextField)
        submitBtn.layer.borderWidth = 1.0
        submitBtn.layer.borderColor = UIColor.blue.cgColor
        submitBtn.layer.cornerRadius = submitBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = submitBtn.frame.height/2
        self.submitBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        registerBtn.layer.borderWidth = 1.0
        registerBtn.layer.borderColor = UIColor.gray.cgColor
        registerBtn.layer.cornerRadius = registerBtn.frame.height/2

        // Do any additional setup after loading the view.
    }
    func customAlert(title:String, msg:String){
           let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
//        if emailIDTextField.text?.isValidEmail == false{
//            customAlert(title: "Email-ID is not valid", msg: "Please enter a valid Email Address")
//        }
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        
                   present(vc, animated: true, completion: nil)
    }
    @IBAction func backToLoginBtnPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func registerBtnPressed(_ sender: UIButton) {
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
