//
//  WhoCanApply5VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 29/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class WhoCanApply5VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailSubjectLineTF: MDCTextField!
    @IBOutlet weak var vacancyReferenceCodeTF: MDCTextField!
    @IBOutlet weak var previewAndPostBtn: UIButton!
    @IBOutlet weak var saveAndPostLaterBtn: UIButton!
    
    var emailSubjectLineController: MDCTextInputControllerOutlined!
    var vacancyReferenceCodeController: MDCTextInputControllerOutlined!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = previewAndPostBtn.frame.height/2
        previewAndPostBtn.layer.cornerRadius = previewAndPostBtn.frame.height/2
        self.previewAndPostBtn.layer.insertSublayer(gradientLayer, at: 0)
        saveAndPostLaterBtn.layer.cornerRadius = saveAndPostLaterBtn.frame.height/2
        let leftColor1 = UIColor(red: (43/255.0), green: (43/255.0), blue:(48/255.0), alpha: 1)
        let rightColor1 = UIColor(red: (137/255.0), green: (137/255.0), blue:(137/255.0), alpha: 1)

        let gradientLayer1 = CAGradientLayer()
        
        gradientLayer1.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer1.colors = [leftColor1.cgColor, rightColor1.cgColor]
        gradientLayer1.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer1.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer1.cornerRadius = previewAndPostBtn.frame.height/2
    self.saveAndPostLaterBtn.layer.insertSublayer(gradientLayer1, at: 0)

        self.emailSubjectLineController = MDCTextInputControllerOutlined(textInput: emailSubjectLineTF)
        self.vacancyReferenceCodeController = MDCTextInputControllerOutlined(textInput: vacancyReferenceCodeTF)

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        emailSubjectLineTF.resignFirstResponder()
        vacancyReferenceCodeTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailSubjectLineTF.resignFirstResponder()
        vacancyReferenceCodeTF.resignFirstResponder()
        return true
    }
    @IBAction func previewAndPostPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "JobDetailsVC") as! JobDetailsVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func saveAndPostLaterPressed(_ sender: Any) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
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
