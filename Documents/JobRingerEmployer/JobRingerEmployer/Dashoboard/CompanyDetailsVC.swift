//
//  CompanyDetailsVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 15/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class CompanyDetailsVC: UIViewController {
    
    @IBOutlet weak var employeeCapacityTF: MDCTextField!
    @IBOutlet weak var businessTurnoverTF: MDCTextField!
    @IBOutlet weak var operationsTF: MDCTextField!
    @IBOutlet weak var brandsTF: MDCTextField!
    @IBOutlet weak var productTF: MDCTextField!
    @IBOutlet weak var industryTypeTF: MDCTextField!
    @IBOutlet weak var businessHouseTF: MDCTextField!
    @IBOutlet weak var alternateCompanyNameTF: MDCTextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var alternateCompanyNameController: MDCTextInputControllerOutlined!
    var industryTypeController: MDCTextInputControllerOutlined!
    var productController: MDCTextInputControllerOutlined!
    var brandsController: MDCTextInputControllerOutlined!
    var operationsController: MDCTextInputControllerOutlined!
    var businessTurnoverController: MDCTextInputControllerOutlined!
    var employeeCapacityController: MDCTextInputControllerOutlined!
    var businessHouseController: MDCTextInputControllerOutlined!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        self.alternateCompanyNameController = MDCTextInputControllerOutlined(textInput: alternateCompanyNameTF)
        self.industryTypeController = MDCTextInputControllerOutlined(textInput: industryTypeTF)
        self.productController = MDCTextInputControllerOutlined(textInput: productTF)
        self.brandsController = MDCTextInputControllerOutlined(textInput: brandsTF)
        self.operationsController = MDCTextInputControllerOutlined(textInput: operationsTF)
        self.businessTurnoverController = MDCTextInputControllerOutlined(textInput: businessTurnoverTF)
        self.employeeCapacityController = MDCTextInputControllerOutlined(textInput: employeeCapacityTF)
        self.businessHouseController = MDCTextInputControllerOutlined(textInput: businessHouseTF)
    
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
        alternateCompanyNameTF.resignFirstResponder()
        businessHouseTF.resignFirstResponder()
        industryTypeTF.resignFirstResponder()
        productTF.resignFirstResponder()
        brandsTF.resignFirstResponder()
        operationsTF.resignFirstResponder()
        businessTurnoverTF.resignFirstResponder()
        employeeCapacityTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        alternateCompanyNameTF.resignFirstResponder()
        businessHouseTF.resignFirstResponder()
        industryTypeTF.resignFirstResponder()
        productTF.resignFirstResponder()
        brandsTF.resignFirstResponder()
        operationsTF.resignFirstResponder()
        businessTurnoverTF.resignFirstResponder()
        employeeCapacityTF.resignFirstResponder()
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
        if alternateCompanyNameTF.text?.count == 0 || businessHouseTF.text?.count == 0 || productTF.text?.count == 0 || industryTypeTF.text?.count == 0 || brandsTF.text?.count == 0 || operationsTF.text?.count == 0 || businessTurnoverTF.text?.count == 0 || employeeCapacityTF.text?.count == 0{
            customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
        }else{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileVC") as! CompanyProfileVC
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearAllPressed(_ sender: UIButton) {
        alternateCompanyNameTF.text = ""
        businessHouseTF.text = ""
        industryTypeTF.text = ""
        productTF.text = ""
        brandsTF.text = ""
        operationsTF.text = ""
        businessTurnoverTF.text = ""
        employeeCapacityTF.text = ""
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
