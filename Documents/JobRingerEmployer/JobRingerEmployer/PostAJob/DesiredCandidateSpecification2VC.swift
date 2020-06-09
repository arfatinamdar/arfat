//
//  DesiredCandidateSpecification2.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 27/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class DesiredCandidateSpecification2VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var specificCollegeTF: MDCTextField!
    @IBOutlet weak var ugBatchTF: MDCTextField!
    
    var ugBatchController: MDCTextInputControllerOutlined!
    var specificCollegeController: MDCTextInputControllerOutlined!
    
    var isFrom = ""
    
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
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        specificCollegeController = MDCTextInputControllerOutlined.init(textInput: specificCollegeTF)
        ugBatchController = MDCTextInputControllerOutlined(textInput: ugBatchTF)
        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        specificCollegeTF.resignFirstResponder()
        ugBatchTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        specificCollegeTF.resignFirstResponder()
        ugBatchTF.resignFirstResponder()
        return true
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "EducationVC") as! EducationVC
        vc.isFrom = isFrom
        present(vc, animated: true, completion: nil)
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
