//
//  ContactVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 19/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class ContactVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nameTF: MDCTextField!
    @IBOutlet weak var emailIdTF: MDCTextField!
    @IBOutlet weak var phoneNumberTF: MDCTextField!
    @IBOutlet weak var feedbackTV: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    var nameController: MDCTextInputControllerOutlined!
    var emailIdController: MDCTextInputControllerOutlined!
    var phoneNumberController: MDCTextInputControllerOutlined!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameController = MDCTextInputControllerOutlined(textInput: nameTF)
        self.emailIdController = MDCTextInputControllerOutlined(textInput: emailIdTF)
        self.phoneNumberController = MDCTextInputControllerOutlined(textInput: phoneNumberTF)
        
        sendBtn.layer.cornerRadius = sendBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = sendBtn.frame.height/2
        self.sendBtn.layer.insertSublayer(gradientLayer, at: 0)
        feedbackTV.text = "Feedback"
        feedbackTV.textColor = UIColor.lightGray
        feedbackTV.isEditable = true
        feedbackTV.layer.borderWidth = 1
        feedbackTV.layer.borderColor = UIColor.gray.cgColor
        feedbackTV.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if feedbackTV.textColor == UIColor.lightGray {
            feedbackTV.text = nil
            feedbackTV.textColor = UIColor.black
            feedbackTV.layer.borderWidth = 2
            feedbackTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if feedbackTV.text.isEmpty {
            feedbackTV.text = "Feedback"
            feedbackTV.layer.borderWidth = 1
            feedbackTV.textColor = UIColor.lightGray
            feedbackTV.layer.borderColor = UIColor.gray.cgColor
        }
    }

    
    @IBAction func sendPressed(_ sender: UIButton) {
        if nameTF.text?.count == 0 || emailIdTF.text?.count == 0 || phoneNumberTF.text?.count == 0 || feedbackTV.text.count == 0 || feedbackTV?.text == "Feedback"{
            customAlert(title: "All fields are compulsary", msg: "Please enter all the details")
        }else if emailIdTF.text?.isValidEmail == false{
            customAlert(title: "Email is not Valid", msg: "Please provide valid Email Address")
        }else if phoneNumberTF.text?.isMobileValid == false{
            customAlert(title: "Mobile No is not Valid", msg: "Please provide valid mobile number")
        }else{
            struct ContactStruct: Codable {
                let candidateName: String
                let emailId: String
                let phoneNumber: String
                let feedback: String
            }

            let contact = ContactStruct(candidateName: nameTF.text ?? "", emailId: emailIdTF.text ?? "", phoneNumber: phoneNumberTF.text ?? "", feedback: feedbackTV.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(contact) else {
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
            nameTF.text = ""
            emailIdTF.text = ""
            phoneNumberTF.text = ""
            feedbackTV.text = ""
            customAlert(title: "Your response is recorded", msg: "Thank you for your feedback")
        }
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
