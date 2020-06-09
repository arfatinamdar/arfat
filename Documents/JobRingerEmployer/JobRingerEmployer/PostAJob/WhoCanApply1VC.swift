//
//  WhoCanApply1VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 28/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class WhoCanApply1VC: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var canApplyFromIndustryTF: MDCTextField!
    @IBOutlet weak var canApplyFromCompaniesTF: MDCTextField!
    @IBOutlet weak var canApplyFromFunctionalAreaTF: MDCTextField!
    @IBOutlet weak var candidateCurrentLastDesignationTF: MDCTextField!
    @IBOutlet weak var canApplyFromLocationTF: MDCTextField!
    @IBOutlet weak var canApplyFromAreaTF: MDCTextField!
    @IBOutlet weak var documentsRequiredTF: MDCTextField!
    
        var canApplyFromIndustryController: MDCTextInputControllerOutlined!
        var canApplyFromCompaniesController: MDCTextInputControllerOutlined!
        var canApplyFromFunctionalAreaController: MDCTextInputControllerOutlined!
        var candidateCurrentLastDesignationController: MDCTextInputControllerOutlined!
        var canApplyFromLocationController: MDCTextInputControllerOutlined!
        var canApplyFromAreaController: MDCTextInputControllerOutlined!
        var documentsRequiredController: MDCTextInputControllerOutlined!

        
        override func viewDidLoad() {
            super.viewDidLoad()
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tap.delegate = self as? UIGestureRecognizerDelegate
            view.addGestureRecognizer(tap)
            self.canApplyFromIndustryController = MDCTextInputControllerOutlined(textInput: canApplyFromIndustryTF)
            self.canApplyFromCompaniesController = MDCTextInputControllerOutlined(textInput: canApplyFromCompaniesTF)
            self.canApplyFromFunctionalAreaController = MDCTextInputControllerOutlined(textInput: canApplyFromFunctionalAreaTF)
            self.candidateCurrentLastDesignationController = MDCTextInputControllerOutlined(textInput: candidateCurrentLastDesignationTF)
            self.canApplyFromLocationController = MDCTextInputControllerOutlined(textInput: canApplyFromLocationTF)
            self.canApplyFromAreaController = MDCTextInputControllerOutlined(textInput: canApplyFromAreaTF)
            self.documentsRequiredController = MDCTextInputControllerOutlined(textInput: documentsRequiredTF)

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
            canApplyFromAreaTF.resignFirstResponder()
            canApplyFromCompaniesTF.resignFirstResponder()
            canApplyFromFunctionalAreaTF.resignFirstResponder()
            candidateCurrentLastDesignationTF.resignFirstResponder()
            canApplyFromLocationTF.resignFirstResponder()
            canApplyFromAreaTF.resignFirstResponder()
            documentsRequiredTF.resignFirstResponder()
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            canApplyFromAreaTF.resignFirstResponder()
            canApplyFromCompaniesTF.resignFirstResponder()
            canApplyFromFunctionalAreaTF.resignFirstResponder()
            candidateCurrentLastDesignationTF.resignFirstResponder()
            canApplyFromLocationTF.resignFirstResponder()
            canApplyFromAreaTF.resignFirstResponder()
            documentsRequiredTF.resignFirstResponder()
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
    @IBAction func nextPressed(_ sender: UIButton) {
    //if canApplyFromIndustryTF.text?.count == 0 || canApplyFromCompaniesTF.text?.count == 0 || canApplyFromFunctionalAreaTF.text?.count == 0 || candidateCurrentLastDesignationTF.text?.count == 0 || canApplyFromLocationTF.text?.count == 0 || canApplyFromAreaTF.text?.count == 0 || documentsRequiredTF.text?.count == 0{
      //          customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
      //  }else{
            let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "EmployerDetailsVC") as! EmployerDetailsVC
            present(vc, animated: true, completion: nil)
      //  }
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
