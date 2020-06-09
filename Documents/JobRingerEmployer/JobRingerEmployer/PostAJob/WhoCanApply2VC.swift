//
//  WhoCanApply2VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 28/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class WhoCanApply2VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var companyWebsiteTF: MDCTextField!
    @IBOutlet weak var companyAddressTF: MDCTextField!
    @IBOutlet weak var picodeTF: MDCTextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var addWorkDaysBtn: UIButton!
    @IBOutlet weak var addContactPersonBtn: UIButton!
    
    var companyWebsiteController: MDCTextInputControllerOutlined!
    var companyAddressController: MDCTextInputControllerOutlined!
    var picodeController: MDCTextInputControllerOutlined!
    
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
        gradientLayer.cornerRadius = nextBtn.frame.height/2
        self.nextBtn.layer.insertSublayer(gradientLayer, at: 0)
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        addWorkDaysBtn.layer.borderWidth = 1
        addWorkDaysBtn.layer.borderColor = UIColor.black.cgColor
        addWorkDaysBtn.layer.cornerRadius = addWorkDaysBtn.frame.height/2
        addContactPersonBtn.layer.borderWidth = 1
        addContactPersonBtn.layer.borderColor = UIColor.black.cgColor
        addContactPersonBtn.layer.cornerRadius = addContactPersonBtn.frame.height/2
        companyWebsiteController = MDCTextInputControllerOutlined(textInput: companyWebsiteTF)
        companyAddressController = MDCTextInputControllerOutlined(textInput: companyAddressTF)
        picodeController = MDCTextInputControllerOutlined(textInput: picodeTF)

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        companyWebsiteTF.resignFirstResponder()
        companyAddressTF.resignFirstResponder()
        picodeTF.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        companyWebsiteTF.resignFirstResponder()
        companyAddressTF.resignFirstResponder()
        picodeTF.resignFirstResponder()
        return true
    }
    
    @IBAction func addWorkDaysPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "WorkDaysVC") as! WorkDaysVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func addContactPersonPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "AddContactPerson1VC") as! AddContactPerson1VC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "WhoCanApply5VC") as! WhoCanApply5VC
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
