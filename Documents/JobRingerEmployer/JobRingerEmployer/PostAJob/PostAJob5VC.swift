//
//  PostAJob5VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 26/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class PostAJob5VC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var otherEmpBenefitsTV: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var currencyTF: MDCTextField!
    @IBOutlet weak var salaryTF: MDCTextField!
    @IBOutlet weak var salaryFromTF: MDCTextField!
    @IBOutlet weak var salaryToTF: MDCTextField!
    @IBOutlet weak var hideSalaryDetailsBtn: UIButton!
    @IBOutlet weak var degreeOfTravelTF: MDCTextField!
    @IBOutlet weak var travelRequiredToTF: MDCTextField!
    
    var currencyController: MDCTextInputControllerOutlined!
    var salaryController: MDCTextInputControllerOutlined!
    var salaryFromController: MDCTextInputControllerOutlined!
    var salaryToController: MDCTextInputControllerOutlined!
    var degreeOfTravelController: MDCTextInputControllerOutlined!
    var travelRequiredToController: MDCTextInputControllerOutlined!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherEmpBenefitsTV.text = "Other Employee Benefits"
        otherEmpBenefitsTV.textColor = UIColor.lightGray
        otherEmpBenefitsTV.isEditable = true
        otherEmpBenefitsTV.layer.borderWidth = 1
        otherEmpBenefitsTV.layer.borderColor = UIColor.gray.cgColor
        otherEmpBenefitsTV.layer.cornerRadius = 10
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        
        self.currencyController = MDCTextInputControllerOutlined(textInput: currencyTF)
        self.salaryController = MDCTextInputControllerOutlined(textInput: salaryTF)
        self.salaryFromController = MDCTextInputControllerOutlined(textInput: salaryFromTF)
        self.salaryToController = MDCTextInputControllerOutlined(textInput: salaryToTF)
        self.degreeOfTravelController = MDCTextInputControllerOutlined(textInput: degreeOfTravelTF)
        self.travelRequiredToController = MDCTextInputControllerOutlined(textInput: travelRequiredToTF)
        
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
        currencyTF.resignFirstResponder()
        salaryTF.resignFirstResponder()
        salaryFromTF.resignFirstResponder()
        salaryToTF.resignFirstResponder()
        degreeOfTravelTF.resignFirstResponder()
        travelRequiredToTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currencyTF.resignFirstResponder()
        salaryTF.resignFirstResponder()
        salaryFromTF.resignFirstResponder()
        salaryToTF.resignFirstResponder()
        degreeOfTravelTF.resignFirstResponder()
        travelRequiredToTF.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if otherEmpBenefitsTV.textColor == UIColor.lightGray {
            otherEmpBenefitsTV.text = nil
            otherEmpBenefitsTV.textColor = UIColor.black
            otherEmpBenefitsTV.layer.borderWidth = 2
            otherEmpBenefitsTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if otherEmpBenefitsTV.text.isEmpty {
            otherEmpBenefitsTV.text = "Other Employee Benefits"
            otherEmpBenefitsTV.layer.borderWidth = 1
            otherEmpBenefitsTV.textColor = UIColor.lightGray
            otherEmpBenefitsTV.layer.borderColor = UIColor.gray.cgColor
            
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = 1000 - otherEmpBenefitsTV.text.count
        
        counterLbl.text =  "\(newLength)" + "/1000"
        if otherEmpBenefitsTV.text.count >= 1000{
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
        
//        let postAJob2 = PostAJob2Struct(shift: shiftTF.text ?? "", jobDesc: jobDescTV.text ?? "", industry: industryTF.text ?? "", functionalArea: functionalAreaTF.text ?? "", jobRole: jobRoleTF.text ?? "")
//        guard let uploadData = try? JSONEncoder().encode(postAJob2) else {
//            return
//        }
//        let url = URL(string: "https://example.com/post")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        let parameters: [String: Any] = [
//            "userid": "",
//            "name": ""
//        ]
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
//            if let error = error {
//                print ("error: \(error)")
//                self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
//                return
//            }
//            guard let response = response as? HTTPURLResponse,
//                (200...299).contains(response.statusCode) else {
//                    print ("server error")
//                    self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
//                    return
//            }
//            if let mimeType = response.mimeType,
//                mimeType == "application/json",
//                let data = data,
//                let dataString = String(data: data, encoding: .utf8) {
//                print ("got data: \(dataString)")
//            }
//        }
//        task.resume()
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostAJob6VC") as! PostAJob6VC
        present(vc, animated: true, completion: nil)
        //}
    }
    @IBAction func hideSalaryDetailsPressed(_ sender: UIButton) {
        
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
