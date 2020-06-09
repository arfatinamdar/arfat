//
//  DesiredCandidateSpecifications1VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 27/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class DesiredCandidateSpecifications1VC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var keywordsTF: MDCTextField!
    @IBOutlet weak var candidateProfileTV: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    
    var keywordsController: MDCTextInputControllerOutlined!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        
        keywordsController = MDCTextInputControllerOutlined.init(textInput: keywordsTF)
        candidateProfileTV.text = "Candidate Profile / Specification"
        candidateProfileTV.textColor = UIColor.lightGray
        candidateProfileTV.isEditable = true
        candidateProfileTV.layer.borderWidth = 1
        candidateProfileTV.layer.borderColor = UIColor.gray.cgColor
        candidateProfileTV.layer.cornerRadius = 10
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
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
        keywordsTF.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keywordsTF.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if candidateProfileTV.textColor == UIColor.lightGray {
            candidateProfileTV.text = nil
            candidateProfileTV.textColor = UIColor.black
            candidateProfileTV.layer.borderWidth = 2
            candidateProfileTV.layer.borderColor = UIColor.blue.cgColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if candidateProfileTV.text.isEmpty {
            candidateProfileTV.text = "Candidate Profile / Specification"
            candidateProfileTV.layer.borderWidth = 1
            candidateProfileTV.textColor = UIColor.lightGray
            candidateProfileTV.layer.borderColor = UIColor.gray.cgColor

        }
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EducationVC") as! EducationVC
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
