//
//  PostAJob3VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 26/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class PostAJob3VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var expMinTF: MDCTextField!
    @IBOutlet weak var expMaxTF: MDCTextField!
    @IBOutlet weak var ageMinTF: MDCTextField!
    @IBOutlet weak var ageMaxTF: MDCTextField!
    @IBOutlet weak var genderPreferenceTF: MDCTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    var expMinController: MDCTextInputControllerOutlined!
    var expMaxController: MDCTextInputControllerOutlined!
    var genderPreferenceController: MDCTextInputControllerOutlined!
    var ageMinController: MDCTextInputControllerOutlined!
    var ageMaxController: MDCTextInputControllerOutlined!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        
        self.self.expMinController = MDCTextInputControllerOutlined(textInput: expMinTF)
        self.expMaxController = MDCTextInputControllerOutlined(textInput: expMaxTF)
        self.ageMaxController = MDCTextInputControllerOutlined(textInput: ageMaxTF)
        self.ageMinController = MDCTextInputControllerOutlined(textInput: ageMinTF)
        self.genderPreferenceController = MDCTextInputControllerOutlined(textInput: genderPreferenceTF)
        
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

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        expMinTF.resignFirstResponder()
        expMaxTF.resignFirstResponder()
        ageMinTF.resignFirstResponder()
        ageMaxTF.resignFirstResponder()
        genderPreferenceTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        expMinTF.resignFirstResponder()
        expMaxTF.resignFirstResponder()
        ageMinTF.resignFirstResponder()
        ageMaxTF.resignFirstResponder()
        genderPreferenceTF.resignFirstResponder()
        return true
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostAJob4VC") as! PostAJob4VC
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
