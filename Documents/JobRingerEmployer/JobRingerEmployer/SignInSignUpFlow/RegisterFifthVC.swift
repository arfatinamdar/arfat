//
//  RegisterEducationThirdVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 04/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class RegisterFifthVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var uploadDocumentsBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addSocialMediaBtn: UIButton!
    @IBOutlet weak var hqLocationTF: MDCTextField!
    @IBOutlet weak var operationTF: MDCTextField!
    @IBOutlet weak var turnoverTF: MDCTextField!
    @IBOutlet weak var accreditationTF: MDCTextField!
    @IBOutlet weak var companyURL: MDCTextField!
    @IBOutlet weak var companyDescriptionTV: UITextView!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    var hqLocationController: MDCTextInputControllerOutlined!
    var operationController: MDCTextInputControllerOutlined!
    var turnoverController: MDCTextInputControllerOutlined!
    var accreditationController: MDCTextInputControllerOutlined!
    var companyURLController: MDCTextInputControllerOutlined!
    var fromVC = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        companyDescriptionTV.text = "Company DescriptionTV"
        companyDescriptionTV.textColor = UIColor.lightGray
        companyDescriptionTV.isEditable = true
        companyDescriptionTV.layer.borderWidth = 1
        companyDescriptionTV.layer.borderColor = UIColor.gray.cgColor
        companyDescriptionTV.layer.cornerRadius = 10
        uploadDocumentsBtn.layer.cornerRadius = 20
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        addSocialMediaBtn.layer.cornerRadius = addSocialMediaBtn.frame.height/2
        self.hqLocationController = MDCTextInputControllerOutlined(textInput: hqLocationTF)

        self.operationController = MDCTextInputControllerOutlined(textInput: operationTF)
        self.turnoverController = MDCTextInputControllerOutlined(textInput: turnoverTF)
        self.accreditationController = MDCTextInputControllerOutlined(textInput: accreditationTF)
        self.companyURLController = MDCTextInputControllerOutlined(textInput: companyURL)
        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        companyDescriptionTV.text = "Achievements"
        companyDescriptionTV.textColor = UIColor.lightGray
        companyDescriptionTV.isEditable = true
        companyDescriptionTV.layer.borderWidth = 1
        companyDescriptionTV.layer.borderColor = UIColor.gray.cgColor
        companyDescriptionTV.layer.cornerRadius = 10

        uploadDocumentsBtn.layer.cornerRadius = 5
        scrollViewHeight.constant = view.intrinsicContentSize.height

        // Do any additional setup after loading the view.
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if companyDescriptionTV.textColor == UIColor.lightGray {
            companyDescriptionTV.text = nil
            companyDescriptionTV.textColor = UIColor.black
            companyDescriptionTV.layer.borderWidth = 2
            companyDescriptionTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if companyDescriptionTV.text.isEmpty {
            companyDescriptionTV.text = "Achievements"
            companyDescriptionTV.layer.borderWidth = 1
            companyDescriptionTV.textColor = UIColor.lightGray
            companyDescriptionTV.layer.borderColor = UIColor.gray.cgColor

        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = 1000 - companyDescriptionTV.text.count

        counterLbl.text =  "\(newLength)" + "/1000"
        if companyDescriptionTV.text.count >= 1000{
            return false
        }
        // Set value of the label
        // myCounter = newLength // Optional: Save this value
        // return newLength <= 25 // Optional: Set limits on input.
        return true
    }

    @IBAction func uploadDocumentsPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UploadDocumentsVC") as! UploadDocumentsVC
        present(vc, animated: true, completion: nil)
    }
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func savePressed(_ sender: UIButton) {
        if hqLocationTF.text?.count == 0 || operationTF.text?.count == 0 || turnoverTF.text?.count == 0 || accreditationTF.text?.count == 0 || companyURL.text?.count == 0 || companyDescriptionTV.text == "Company Description" || companyDescriptionTV.text == ""{
            customAlert(title: "All the fields are compulsory", msg: "Please enter all the details")
        }else{
            struct RegisterEducationThirdStruct: Codable {
                let hqLocation: String
                let operation: String
                let turnover: String
                let accreditation: String
                let companyURL: String
                let companyDescription: String
            }

            // ...

            let registerEducationThird = RegisterEducationThirdStruct(hqLocation: hqLocationTF.text ?? "", operation: operationTF.text ?? "", turnover: turnoverTF.text ?? "", accreditation: accreditationTF.text ?? "", companyURL: companyURL.text ?? "", companyDescription: companyDescriptionTV.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(registerEducationThird) else {
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
        present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func addSocialMediaPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddSocialMedia") as! AddSocialMedia
        present(vc, animated: true, completion: nil)
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
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
