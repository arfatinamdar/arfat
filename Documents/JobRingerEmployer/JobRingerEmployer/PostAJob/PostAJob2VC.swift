//
//  PostAJob2VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 26/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class PostAJob2VC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var jobDescTV: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var shiftTF: MDCTextField!
    @IBOutlet weak var industryTF: MDCTextField!
    @IBOutlet weak var functionalAreaTF: MDCTextField!
    @IBOutlet weak var jobRoleTF: MDCTextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var counterLbl: UILabel!
    
    var shiftController: MDCTextInputControllerOutlined!
    var industryController: MDCTextInputControllerOutlined!
    var functionalAreaController: MDCTextInputControllerOutlined!
    var jobRoleController: MDCTextInputControllerOutlined!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
        tap1.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap1)
        
        jobDescTV.text = "job Description"
        jobDescTV.textColor = UIColor.lightGray
        jobDescTV.isEditable = true
        jobDescTV.layer.borderWidth = 1
        jobDescTV.layer.borderColor = UIColor.gray.cgColor
        jobDescTV.layer.cornerRadius = 10
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               tap.delegate = self as? UIGestureRecognizerDelegate
               shiftTF.addGestureRecognizer(tap)
        
        self.shiftController = MDCTextInputControllerOutlined(textInput: shiftTF)
        self.industryController = MDCTextInputControllerOutlined(textInput: industryTF)
        self.functionalAreaController = MDCTextInputControllerOutlined(textInput: functionalAreaTF)
        self.jobRoleController = MDCTextInputControllerOutlined(textInput: jobRoleTF)
        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = nextBtn.frame.height/2
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap1(_ sender: UITapGestureRecognizer) {
        shiftTF.resignFirstResponder()
        jobDescTV.resignFirstResponder()
        industryTF.resignFirstResponder()
        functionalAreaTF.resignFirstResponder()
        jobRoleTF.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shiftTF.resignFirstResponder()
        jobDescTV.resignFirstResponder()
        industryTF.resignFirstResponder()
        functionalAreaTF.resignFirstResponder()
        jobRoleTF.resignFirstResponder()
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
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
    let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "SelectionVC") as! SelectionVC
    vc.isFrom = "shiftTF"
    present(vc, animated: true, completion: nil)
    }
        
    func textViewDidBeginEditing(_ textView: UITextView) {
        if jobDescTV.textColor == UIColor.lightGray {
            jobDescTV.text = nil
            jobDescTV.textColor = UIColor.black
            jobDescTV.layer.borderWidth = 2
            jobDescTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if jobDescTV.text.isEmpty {
            jobDescTV.text = "Job Description"
            jobDescTV.layer.borderWidth = 1
            jobDescTV.textColor = UIColor.lightGray
            jobDescTV.layer.borderColor = UIColor.gray.cgColor

        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = 1000 - jobDescTV.text.count

        counterLbl.text =  "\(newLength)" + "/1000"
        if jobDescTV.text.count >= 1000{
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
    @IBAction func nextPressed(_ sender: UIButton) {
        //if shiftTF.text?.count == 0 || jobDescTV.text == "" || jobDescTV.text == "Job Description" || industryTF.text?.count == 0 || functionalAreaTF.text?.count == 0 || jobRoleTF.text?.count == 0{
    //customAlert(title: "All the fields are compulsory", msg: "Please enter all the details")
        //}else{
            struct PostAJob2Struct: Codable {
                let shift: String
                let jobDesc: String
                let industry: String
                let functionalArea: String
                let jobRole: String
            }

            // ...

            let postAJob2 = PostAJob2Struct(shift: shiftTF.text ?? "", jobDesc: jobDescTV.text ?? "", industry: industryTF.text ?? "", functionalArea: functionalAreaTF.text ?? "", jobRole: jobRoleTF.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(postAJob2) else {
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
            let vc = storyboard?.instantiateViewController(withIdentifier: "PostAJob3VC") as! PostAJob3VC
            present(vc, animated: true, completion: nil)
    //}
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
