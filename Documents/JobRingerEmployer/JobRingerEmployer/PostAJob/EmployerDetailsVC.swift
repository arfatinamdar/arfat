//
//  RegisterFourth.swift
//  JobRingerEmployee
//
//  Created by MAC on 02/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class EmployerDetailsVC: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var profilePicImg: UIImageView!
    @IBOutlet weak var profileEditImg: UIImageView!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var companyNameTF: MDCTextField!
    @IBOutlet weak var hiringForTF: MDCTextField!
    @IBOutlet weak var aboutCompanyTV: UITextView!
    @IBOutlet weak var addWalkinDAndTBtn: UIButton!
    @IBOutlet weak var pickFromEmployerProfileCheckBtn: UIButton!
    
    var companyNameController: MDCTextInputControllerOutlined!
    var hiringForController: MDCTextInputControllerOutlined!
    var pickFromEmployerProfile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        profilePicImg.layer.cornerRadius = profilePicImg.frame.height/2
        profileEditImg.layer.cornerRadius = profileEditImg.frame.height/2
        
        self.companyNameController = MDCTextInputControllerOutlined(textInput: companyNameTF)
        self.hiringForController = MDCTextInputControllerOutlined(textInput: hiringForTF)
        
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        addWalkinDAndTBtn.layer.cornerRadius = 20
        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = nextBtn.frame.height/2
        self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)

               aboutCompanyTV.text = "About Company"
               aboutCompanyTV.textColor = UIColor.lightGray
               aboutCompanyTV.isEditable = true
               aboutCompanyTV.layer.borderWidth = 1
               aboutCompanyTV.layer.borderColor = UIColor.gray.cgColor
               aboutCompanyTV.layer.cornerRadius = 10
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        
        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        companyNameTF.resignFirstResponder()
        hiringForTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        companyNameTF.resignFirstResponder()
        hiringForTF.resignFirstResponder()
        return true
    }
    
    @IBAction func profileEditBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Please Select Profile Picture", message: "From any of these paths", preferredStyle: UIAlertController.Style.actionSheet)
        
        //let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: view.frame.width - 20, height: 140))
        // alert.view.addSubview(pickerFrame)
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
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//
//        self.profilePicImg.image = UIImagePickerController.InfoKey.originalImage as? UIImage
//        self.dismiss(animated: true, completion: nil)
//
//    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        profilePicImg.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//        //self.dismiss(animated: true, completion: nil)
//    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel imagepicker")
        
        picker.dismiss(animated: true , completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("img select \(info)")
        profilePicImg.image = info[.editedImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if aboutCompanyTV.textColor == UIColor.lightGray {
            aboutCompanyTV.text = nil
            aboutCompanyTV.textColor = UIColor.black
            aboutCompanyTV.layer.borderWidth = 2
            aboutCompanyTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if aboutCompanyTV.text.isEmpty {
            aboutCompanyTV.text = "About Company"
            aboutCompanyTV.layer.borderWidth = 1
            aboutCompanyTV.textColor = UIColor.lightGray
            aboutCompanyTV.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func pickFromEmployerProfileCheck(_ sender: UIButton) {
        pickFromEmployerProfile = !pickFromEmployerProfile
        if pickFromEmployerProfile == true{
            pickFromEmployerProfileCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }else{
            pickFromEmployerProfileCheckBtn.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    
    @IBAction func addWalkinDAndTPRessed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UploadDocumentsVC") as! UploadDocumentsVC
        vc.fromVC = "PostAJob"
        present(vc, animated: true, completion: nil)
       }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
//        if aboutCompanyTV.text == "About Company" || aboutCompanyTV.text == "" || companyNameTF.text?.count == 0 || hiringForTF.text?.count == 0{
//            customAlert(title: "All Fields are compulsory", msg: "Please enter all the fields")
//        }else{
//            struct RegisterFourthStuct: Codable {
//                let profileSummary: String
//                let iAmCountry: String
//                let currentPayRoll: String
//            }
//
//            let registerFourth = RegisterFourthStuct(profileSummary: profileSummaryTV.text ?? "", iAmCountry: iAmCountryTextField.text ?? "", currentPayRoll: currentPayrollTextField.text ?? "")
//            guard let uploadData = try? JSONEncoder().encode(registerFourth) else {
//                return
//            }
//            let url = URL(string: "https://example.com/post")!
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            let parameters: [String: Any] = [
//                "userid": "",
//                "name": ""
//            ]
//
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
//                if let error = error {
//                    print ("error: \(error)")
//                    self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
//                    return
//                }
//                guard let response = response as? HTTPURLResponse,
//                    (200...299).contains(response.statusCode) else {
//                    print ("server error")
//                        self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
//                    return
//                }
//                if let mimeType = response.mimeType,
//                    mimeType == "application/json",
//                    let data = data,
//                    let dataString = String(data: data, encoding: .utf8) {
//                    print ("got data: \(dataString)")
//                }
//            }
//            task.resume()
        let vc = storyboard?.instantiateViewController(withIdentifier: "WhoCanApply2VC") as! WhoCanApply2VC
        present(vc, animated: true, completion: nil)
        //}
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
