//
//  CompanyProfileEditVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 14/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class CompanyProfileEditVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var profilePicImg: UIImageView!
    @IBOutlet weak var profileEditImg: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var indianCoBtn: UIButton!
    @IBOutlet weak var indianMNCBtn: UIButton!
    @IBOutlet weak var foreignMNCBtn: UIButton!
    @IBOutlet weak var recruitmentAgencyBtn: UIButton!
    @IBOutlet weak var directEmployerBtn: UIButton!
    @IBOutlet weak var companyIdTF: MDCTextField!
    @IBOutlet weak var companyNameTF: MDCTextField!
    @IBOutlet weak var addressTF: MDCTextField!
    @IBOutlet weak var superUserEmailIDTF: MDCTextField!
    @IBOutlet weak var companyURLTF: MDCTextField!
    
    var addressController: MDCTextInputControllerOutlined!
    var superUserEmailIDController: MDCTextInputControllerOutlined!
    var companyURLController: MDCTextInputControllerOutlined!
    var companyIdController: MDCTextInputControllerOutlined!
    var companyNameController: MDCTextInputControllerOutlined!
    var indianCo = false
    var indianMNC = false
    var foreignMNC = false
    var directEmployee = false
    var recruitmentAgency = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        
        indianMNC = false
        foreignMNC = false
        indianCo = true
        indianMNCBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        foreignMNCBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        indianCoBtn.setImage(UIImage(named: "check"), for: .normal)
        profilePicImg.layer.cornerRadius = profilePicImg.frame.height/2
        profileEditImg.layer.cornerRadius = profileEditImg.frame.height/2
        
        self.addressController = MDCTextInputControllerOutlined(textInput: addressTF)
        self.superUserEmailIDController = MDCTextInputControllerOutlined(textInput: superUserEmailIDTF)
        self.companyURLController = MDCTextInputControllerOutlined(textInput: companyURLTF)
        self.companyNameController = MDCTextInputControllerOutlined(textInput: companyNameTF)
        self.companyIdController = MDCTextInputControllerOutlined(textInput: companyIdTF)
        
        
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        companyIdTF.resignFirstResponder()
        companyNameTF.resignFirstResponder()
        addressTF.resignFirstResponder()
        superUserEmailIDTF.resignFirstResponder()
        companyURLTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        companyIdTF.resignFirstResponder()
        companyNameTF.resignFirstResponder()
        addressTF.resignFirstResponder()
        superUserEmailIDTF.resignFirstResponder()
        companyURLTF.resignFirstResponder()
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
    
    @IBAction func radioButtons(_ sender: UIButton) {
        //tag direct employee 0 recruitment agency 1 indian co 2 indian MNC 3 foreign MNC 4
        if sender.tag == 0{
            directEmployee = true
            recruitmentAgency = false
            directEmployerBtn.setImage(UIImage(named: "check"), for: .normal)
            recruitmentAgencyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
        if sender.tag == 1{
            directEmployee = false
            recruitmentAgency = true
            directEmployerBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            recruitmentAgencyBtn.setImage(UIImage(named: "check"), for: .normal)
        }
        if sender.tag == 2{
            indianMNC = false
            foreignMNC = false
            indianCo = true
            indianMNCBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            foreignMNCBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            indianCoBtn.setImage(UIImage(named: "check"), for: .normal)
        }
        if sender.tag == 3{
            indianMNC = true
            foreignMNC = false
            indianCo = false
            indianMNCBtn.setImage(UIImage(named: "check"), for: .normal)
            foreignMNCBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            indianCoBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
        if sender.tag == 4{
            indianMNC = false
            foreignMNC = true
            indianCo = false
            indianMNCBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            foreignMNCBtn.setImage(UIImage(named: "check"), for: .normal)
            indianCoBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
    
    @IBAction func profileEditBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Please Select Profile Picture", message: "From any of these paths", preferredStyle: UIAlertController.Style.actionSheet)
        
        let okAction = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //Perform Action
            // if UIImagePickerController.SourceType.camera{
            //            let alert = UIAlertController(title: "Alert", message: "Enter Email-ID and Password", preferredStyle: .alert)
            //            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            //                self.present(alert, animated: true, completion: nil)
            //}else{
            let myPickerController = UIImagePickerController()
            myPickerController.sourceType = UIImagePickerController.SourceType.camera
            
            self.present(myPickerController, animated: true, completion: nil)
            //}
        })
        let okAction1 = UIAlertAction(title: "Gallary", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //Perform Action
            //            let myPickerController = UIImagePickerController()
            //            myPickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate;
            //            myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            //
            //            self.present(myPickerController, animated: true, completion: nil)
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = true
            self.present(imgPicker, animated: true, completion: nil)
            
        })
        alert.addAction(okAction)
        alert.addAction(okAction1)
        let removeAction = UIAlertAction(title: "Remove Profile Picture", style: .destructive) { (alert: UIAlertAction!) -> Void in
            //perform action
        }
        alert.addAction(removeAction)
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = sender
            
            popoverController.sourceRect = sender.bounds
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel imagepicker")
        
        picker.dismiss(animated: true , completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("img select \(info)")
        profilePicImg.image = info[.editedImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if companyIdTF.text?.count == 0 || companyNameTF.text?.count == 0 || addressTF.text?.count == 0 || superUserEmailIDTF.text?.count == 0 || companyURLTF.text?.count == 0{
            customAlert(title: "All Fields are compulsory", msg: "Please enter all the fields")
        }else if superUserEmailIDTF.text?.isValidEmail == false{
            customAlert(title: "EmailID is not Valid", msg: "Please provide a Valid Email Address")
        }else{
            //                struct RegisterFifthStuct: Codable {
            //                    let industryType: String
            //                    let product: String
            //                    let brands: String
            //                }
            //
            //                let registerFifth = RegisterFifthStuct(industryType: industryTypeTF.text ?? "", product: productTF.text ?? "", brands: brandsTF.text ?? "")
            //                guard let uploadData = try? JSONEncoder().encode(registerFifth) else {
            //                    return
            //                }
            //                let url = URL(string: "https://example.com/post")!
            //                var request = URLRequest(url: url)
            //                request.httpMethod = "POST"
            //                let parameters: [String: Any] = [
            //                    "userid": "",
            //                    "name": ""
            //                ]
            //
            //                do {
            //                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            //                } catch let error {
            //                    print(error.localizedDescription)
            //                }
            //                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //
            //                let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            //                    if let error = error {
            //                        print ("error: \(error)")
            //                        self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
            //                        return
            //                    }
            //                    guard let response = response as? HTTPURLResponse,
            //                        (200...299).contains(response.statusCode) else {
            //                        print ("server error")
            //                            self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
            //                        return
            //                    }
            //                    if let mimeType = response.mimeType,
            //                        mimeType == "application/json",
            //                        let data = data,
            //                        let dataString = String(data: data, encoding: .utf8) {
            //                        print ("got data: \(dataString)")
            //                    }
            //                }
            //                task.resume()
            let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterFifthVC") as! RegisterFifthVC
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
