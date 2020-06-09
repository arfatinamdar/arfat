//
//  EditCandidateDetailsVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 18/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class OverviewEditVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var companyCertificationTF: MDCTextField!
    @IBOutlet weak var localityTF: MDCTextField!
    @IBOutlet weak var cityTF: MDCTextField!
    @IBOutlet weak var countryTF: MDCTextField!
    @IBOutlet weak var panNoTF: MDCTextField!
    @IBOutlet weak var HqLocationTF: MDCTextField!
    @IBOutlet weak var GSTINTF: MDCTextField!
    @IBOutlet weak var headOfficeTF: MDCTextField!
    @IBOutlet weak var categoryOfEnterpricesTF: MDCTextField!
    @IBOutlet weak var companyTypeTF: MDCTextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var companyTypeController: MDCTextInputControllerOutlined!
    var categoryOfEnterpricesController: MDCTextInputControllerOutlined!
    var headOfficeController: MDCTextInputControllerOutlined!
    var GSTINController: MDCTextInputControllerOutlined!
    var HqLocationController: MDCTextInputControllerOutlined!
    var panNoController: MDCTextInputControllerOutlined!
    var countryController: MDCTextInputControllerOutlined!
    var cityController: MDCTextInputControllerOutlined!
    var localityController: MDCTextInputControllerOutlined!
    var companyCertificationController: MDCTextInputControllerOutlined!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        self.companyTypeController = MDCTextInputControllerOutlined(textInput: companyTypeTF)
        self.categoryOfEnterpricesController = MDCTextInputControllerOutlined(textInput: categoryOfEnterpricesTF)
        self.headOfficeController = MDCTextInputControllerOutlined(textInput: headOfficeTF)
        self.GSTINController = MDCTextInputControllerOutlined(textInput: GSTINTF)
        self.HqLocationController = MDCTextInputControllerOutlined(textInput: HqLocationTF)
        self.panNoController = MDCTextInputControllerOutlined(textInput: panNoTF)
        self.countryController = MDCTextInputControllerOutlined(textInput: countryTF)
        self.cityController = MDCTextInputControllerOutlined(textInput: cityTF)
        self.localityController = MDCTextInputControllerOutlined(textInput: localityTF)
        self.companyCertificationController = MDCTextInputControllerOutlined(textInput: companyCertificationTF)
        scrollViewHeight.constant = view.intrinsicContentSize.height/2
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = nextBtn.frame.height/2
        self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        companyTypeTF.resignFirstResponder()
        categoryOfEnterpricesTF.resignFirstResponder()
        headOfficeTF.resignFirstResponder()
        GSTINTF.resignFirstResponder()
        panNoTF.resignFirstResponder()
        HqLocationTF.resignFirstResponder()
        countryTF.resignFirstResponder()
        cityTF.resignFirstResponder()
        localityTF.resignFirstResponder()
        companyCertificationTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        companyTypeTF.resignFirstResponder()
        categoryOfEnterpricesTF.resignFirstResponder()
        headOfficeTF.resignFirstResponder()
        GSTINTF.resignFirstResponder()
        panNoTF.resignFirstResponder()
        HqLocationTF.resignFirstResponder()
        countryTF.resignFirstResponder()
        cityTF.resignFirstResponder()
        localityTF.resignFirstResponder()
        companyCertificationTF.resignFirstResponder()
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
   func customAlert(title:String, msg:String){
          let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }
    @IBAction func savePressed(_ sender: UIButton) {
    if companyTypeTF.text?.count == 0 || categoryOfEnterpricesTF.text?.count == 0 || headOfficeTF.text?.count == 0 || GSTINTF.text?.count == 0 || panNoTF.text?.count == 0 || HqLocationTF.text?.count == 0 || countryTF.text?.count == 0 || cityTF.text?.count == 0 || localityTF.text?.count == 0 || companyCertificationTF.text?.count == 0{
            customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
    }else if GSTINTF.text?.isValidGST == false{
        customAlert(title: "GST No is not Valid", msg: "Please enter a Valid GST number")
    }else if panNoTF.text?.isValidPAN == false{
        customAlert(title: "PAN No is not Valid", msg: "Please provide a Valid PAN number")
    }else{
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileVC") as! CompanyProfileVC
        present(vc, animated: true, completion: nil)
    }
    }
    
    @IBAction func clearAllPressed(_ sender: UIButton) {
        companyTypeTF.text = ""
        categoryOfEnterpricesTF.text = ""
        headOfficeTF.text = ""
        GSTINTF.text = ""
        panNoTF.text = ""
        HqLocationTF.text = ""
        countryTF.text = ""
        cityTF.text = ""
        localityTF.text = ""
        companyCertificationTF.text = ""
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
