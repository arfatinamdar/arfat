//
//  AddContactPerson3VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 29/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class AddContactPerson3VC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contactPersonTableView: UITableView!
    @IBOutlet weak var emailCheckImg: UIImageView!
    @IBOutlet weak var whatsAppCheckImg: UIImageView!
    @IBOutlet weak var callCheckImg: UIImageView!
    @IBOutlet weak var smsCheckImg: UIImageView!
    @IBOutlet weak var addMoreBtn: UIButton!
    @IBOutlet weak var contactPersonTableViewHeight: NSLayoutConstraint!
    
    var canConnectEmail = false
    var canConnectCall = false
    var canConnectWhatsApp = false
    var canConnectSMS = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        addMoreBtn.layer.cornerRadius = addMoreBtn.frame.height/2
        addMoreBtn.layer.borderWidth = 1
        addMoreBtn.layer.borderColor = UIColor.black.cgColor
        scrollViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostContactPersonTableViewCell", for: indexPath) as! PostContactPersonTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        tableView.separatorStyle = .none
        cell.selectionStyle = .none
        contactPersonTableViewHeight.constant = 2 * 200
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func checkPressed(_ sender: UIButton) {
    //email0, call1, whatsapp2 and sms3
        if sender.tag == 0{
        canConnectEmail = !canConnectEmail
        if canConnectEmail == true{
            emailCheckImg.image = UIImage(named: "check")
        }else{
            emailCheckImg.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 1{
        canConnectCall = !canConnectCall
        if canConnectCall == true{
            callCheckImg.image = UIImage(named: "check")
        }else{
            callCheckImg.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 2{
        canConnectWhatsApp = !canConnectWhatsApp
        if canConnectWhatsApp == true{
            whatsAppCheckImg.image = UIImage(named: "check")
        }else{
            whatsAppCheckImg.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 3{
        canConnectSMS = !canConnectSMS
        if canConnectSMS == true{
            smsCheckImg.image = UIImage(named: "check")
        }else{
            smsCheckImg.image = UIImage(named: "uncheck")
            }
        }
    }
    @IBAction func addMoreContactPersonsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "AddContactPerson2VC") as! AddContactPerson2VC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func savePressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "WhoCanApply2VC") as! WhoCanApply2VC
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

    @IBAction func cellEditPressed(_ sender: UIButton) {
    }
}
class PostContactPersonTableViewCell: UITableViewCell {
    //contact person
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobAndLandlineNoLbl: UILabel!
    @IBOutlet weak var whatsAppNoLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var editBtn: UIButton!
}
