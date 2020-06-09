//
//  EducationVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 27/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class EducationVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ugView: UIView!
    @IBOutlet weak var pgView: UIView!
    @IBOutlet weak var phdView: UIView!
    @IBOutlet weak var specifyUGHeight: NSLayoutConstraint!
    @IBOutlet weak var specifyPGHeight: NSLayoutConstraint!
    @IBOutlet weak var specifyPhDHeight: NSLayoutConstraint! //50,130
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint! //172,420
    @IBOutlet weak var nextBtn: UIButton!
    
    var isFrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if isFrom == "UGSpecification"{
            specifyPGHeight.constant = 50
            specifyUGHeight.constant = 130
            specifyPhDHeight.constant = 50
            ugView.isHidden = false
            pgView.isHidden = true
            phdView.isHidden = true
            containerViewHeight.constant = 252//172
            nextBtn.isHidden = false
        }else{
        specifyPGHeight.constant = 50
        specifyUGHeight.constant = 50
        specifyPhDHeight.constant = 50
        ugView.isHidden = true
        pgView.isHidden = true
        phdView.isHidden = true
        containerViewHeight.constant = 172
            nextBtn.isHidden = true
        }
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        // Do any additional setup after loading the view.
    }
    @IBAction func specifyQualifaicationPressed(_ sender: UIButton) {
        //tag UG0, PG1 and Ph.D2
        if sender.tag == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SelectionVC") as! SelectionVC
            vc.isFrom = "specifyUG"
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WhoCanApply1VC") as! WhoCanApply1VC
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
