//
//  EditCandidateDetailsVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 18/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class PostAJob1VC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var selectJobsAutofillTF: MDCTextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var jobTitleTF: MDCTextField!
    @IBOutlet weak var jobLevel: MDCTextField!
    @IBOutlet weak var employementTypeTF: MDCTextField!
    @IBOutlet weak var jobTypeTF: MDCTextField!
    @IBOutlet weak var roleReportsToTF: MDCTextField!
    @IBOutlet weak var teamManagementTF: MDCTextField!
    @IBOutlet weak var noOfOpeningTF: MDCTextField!
    @IBOutlet weak var headerView: UIView!
    
    var selectJobsAutofillController: MDCTextInputControllerOutlined!
    var jobTitleController: MDCTextInputControllerOutlined!
    var employementTypeController: MDCTextInputControllerOutlined!
    var jobTypeController: MDCTextInputControllerOutlined!
    var jobLevelController: MDCTextInputControllerOutlined!
    var roleReportsToController: MDCTextInputControllerOutlined!
    var teamManagementController: MDCTextInputControllerOutlined!
    var noOfOpeningController: MDCTextInputControllerOutlined!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
        tap1.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap1)
        headerView.layer.cornerRadius = 10
        headerView.layer.shadowRadius = 2
        headerView.layer.shadowColor = UIColor.gray.cgColor
        headerView.layer.shadowOpacity = 0.5
        headerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        selectJobsAutofillTF.addGestureRecognizer(tap)
        self.selectJobsAutofillController = MDCTextInputControllerOutlined(textInput: selectJobsAutofillTF)
        self.jobTitleController = MDCTextInputControllerOutlined(textInput: jobTitleTF)
        self.employementTypeController = MDCTextInputControllerOutlined(textInput: employementTypeTF)
        self.jobTypeController = MDCTextInputControllerOutlined(textInput: jobTypeTF)
        self.jobLevelController = MDCTextInputControllerOutlined(textInput: jobLevel)
        self.roleReportsToController = MDCTextInputControllerOutlined(textInput: roleReportsToTF)
        self.teamManagementController = MDCTextInputControllerOutlined(textInput: teamManagementTF)
        self.noOfOpeningController = MDCTextInputControllerOutlined(textInput: noOfOpeningTF)
        
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
    @objc func handleTap1(_ sender: UITapGestureRecognizer) {
        selectJobsAutofillTF.resignFirstResponder()
        jobTitleTF.resignFirstResponder()
        employementTypeTF.resignFirstResponder()
        jobTypeTF.resignFirstResponder()
        jobLevel.resignFirstResponder()
        roleReportsToTF.resignFirstResponder()
        teamManagementTF.resignFirstResponder()
        noOfOpeningTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        selectJobsAutofillTF.resignFirstResponder()
        jobTitleTF.resignFirstResponder()
        employementTypeTF.resignFirstResponder()
        jobTypeTF.resignFirstResponder()
        jobLevel.resignFirstResponder()
        roleReportsToTF.resignFirstResponder()
        teamManagementTF.resignFirstResponder()
        noOfOpeningTF.resignFirstResponder()
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
        vc.isFrom = "selectJobsAutofillTF"
        present(vc, animated: true, completion: nil)
    }
   func customAlert(title:String, msg:String){
          let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        //if jobTitleTF.text?.count == 0 || employementTypeTF.text?.count == 0 || jobTypeTF.text?.count == 0 || jobLevel.text?.count == 0 || roleReportsToTF.text?.count == 0 || teamManagementTF.text?.count == 0 || noOfOpeningTF.text?.count == 0{
            //customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
        //}
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "PostAJob2VC") as! PostAJob2VC
        present(vc, animated: true, completion: nil)
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
