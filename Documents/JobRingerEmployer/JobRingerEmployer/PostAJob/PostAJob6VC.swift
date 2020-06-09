//
//  PostAJob6VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 27/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class PostAJob6VC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var interviewProcessTV: UITextView!
    @IBOutlet weak var addWalkinBtn: UIButton!
    @IBOutlet weak var venueTV: UITextView!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addWalkinBtn.layer.cornerRadius = 5
        interviewProcessTV.text = "Interview Process | Additional Information"
        interviewProcessTV.textColor = UIColor.lightGray
        interviewProcessTV.isEditable = true
        interviewProcessTV.layer.borderWidth = 1
        interviewProcessTV.layer.borderColor = UIColor.gray.cgColor
        interviewProcessTV.layer.cornerRadius = 10
        venueTV.text = "Venue"
        venueTV.textColor = UIColor.lightGray
        venueTV.isEditable = true
        venueTV.layer.borderWidth = 1
        venueTV.layer.borderColor = UIColor.gray.cgColor
        venueTV.layer.cornerRadius = 10
        
        addWalkinBtn.layer.cornerRadius = addWalkinBtn.frame.height/2
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
        scrollViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == interviewProcessTV{
            if interviewProcessTV.textColor == UIColor.lightGray {
                interviewProcessTV.text = nil
                interviewProcessTV.textColor = UIColor.black
                interviewProcessTV.layer.borderWidth = 2
                interviewProcessTV.layer.borderColor = UIColor.blue.cgColor
            }
        }else{
            if venueTV.textColor == UIColor.lightGray {
                venueTV.text = nil
                venueTV.textColor = UIColor.black
                venueTV.layer.borderWidth = 2
                venueTV.layer.borderColor = UIColor.blue.cgColor
            }
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == interviewProcessTV{
            if interviewProcessTV.text.isEmpty {
                interviewProcessTV.text = "Interview Process | Additional Information"
                interviewProcessTV.layer.borderWidth = 1
                interviewProcessTV.textColor = UIColor.lightGray
                interviewProcessTV.layer.borderColor = UIColor.gray.cgColor
            }
        }else{
            if venueTV.text.isEmpty {
                venueTV.text = "Venue"
                venueTV.layer.borderWidth = 1
                venueTV.textColor = UIColor.lightGray
                venueTV.layer.borderColor = UIColor.gray.cgColor
            }
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = 1000 - interviewProcessTV.text.count
        
        counterLbl.text =  "\(newLength)" + "/1000"
        if interviewProcessTV.text.count >= 1000{
            return false
        }
        // Set value of the label
        // myCounter = newLength // Optional: Save this value
        // return newLength <= 25 // Optional: Set limits on input.
        return true
    }
    @IBAction func twoWalkinPressed(_ sender: UIButton) {
    }
    
    @IBAction func addWalkinPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddWalkinDateVC") as! AddWalkinDateVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func nextPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DesiredCandidateSpecifications1VC") as! DesiredCandidateSpecifications1VC
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
