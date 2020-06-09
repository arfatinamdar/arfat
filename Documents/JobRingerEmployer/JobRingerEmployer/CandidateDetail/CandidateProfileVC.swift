//
//  UpdateProfileMainVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 12/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class CandidateProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var verifiedImg: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var aliasNamePositionsView: UIView!
    @IBOutlet weak var aliasNamePositionsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var formerAliasNameLbl: UILabel!
    @IBOutlet weak var lookingForPositionsLbl: UILabel!
    @IBOutlet weak var aboutCandidateSummaryView: UIView!
    @IBOutlet weak var aboutCandidateSummaryViewHeight: NSLayoutConstraint!
    @IBOutlet weak var aboutCandidateTextView: UITextView!
    @IBOutlet weak var candidatExpEducationPersonalView: UIView!
    @IBOutlet weak var candidatExpEducationPersonalViewHeight: NSLayoutConstraint!
    @IBOutlet weak var socialMediaTableView: UITableView!
    @IBOutlet weak var attchmentTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var socialMediaViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var attachmentsView: UIView!
    @IBOutlet weak var socialMediaView: UIView!
    @IBOutlet weak var attachmentsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var socialMediaTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var smsView: UIView!
    @IBOutlet weak var forwardView: UIView!
    @IBOutlet weak var downloadView: UIView!
    @IBOutlet weak var whatsappView: UIView!
    
    var fromVC = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        moreView.layer.cornerRadius = 5
        profilePic.image = UIImage(named: "abdul")
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        aliasNamePositionsView.layer.shadowColor = UIColor.gray.cgColor
        aliasNamePositionsView.layer.shadowRadius = 2
        aliasNamePositionsView.layer.shadowOpacity = 0.5
        aliasNamePositionsView.layer.shadowOffset = CGSize(width: -1, height: 1)
        aliasNamePositionsView.layer.cornerRadius = 10

        aboutCandidateSummaryView.layer.cornerRadius = 10
        aboutCandidateSummaryView.layer.shadowColor = UIColor.gray.cgColor
        aboutCandidateSummaryView.layer.shadowRadius = 2
        aboutCandidateSummaryView.layer.shadowOpacity = 0.5
        aboutCandidateSummaryView.layer.shadowOffset = CGSize(width: -1, height: 1)
        aboutCandidateTextView.layer.cornerRadius = 10
        aboutCandidateTextView.layer.shadowColor = UIColor.gray.cgColor
        aboutCandidateTextView.layer.shadowRadius = 2
        aboutCandidateTextView.layer.shadowOpacity = 0.5
        aboutCandidateTextView.layer.shadowOffset = CGSize(width: -1, height: 1)
        candidatExpEducationPersonalView.layer.cornerRadius = 10
        candidatExpEducationPersonalView.layer.shadowColor = UIColor.gray.cgColor
        candidatExpEducationPersonalView.layer.shadowRadius = 2
        candidatExpEducationPersonalView.layer.shadowOpacity = 0.5
        candidatExpEducationPersonalView.layer.shadowOffset = CGSize(width: -1, height: 1)
        socialMediaView.layer.cornerRadius = 10
        socialMediaView.layer.shadowColor = UIColor.gray.cgColor
        socialMediaView.layer.shadowRadius = 2
        socialMediaView.layer.shadowOpacity = 0.5
        socialMediaView.layer.shadowOffset = CGSize(width: -1, height: 1)
        attachmentsView.layer.cornerRadius = 10
        attachmentsView.layer.shadowColor = UIColor.gray.cgColor
        attachmentsView.layer.shadowRadius = 2
        attachmentsView.layer.shadowOpacity = 0.5
        attachmentsView.layer.shadowOffset = CGSize(width: -1, height: 1)
        scrollViewHeight.constant = view.intrinsicContentSize.height
        aliasNamePositionsView.layer.cornerRadius = 10
        candidatExpEducationPersonalView.layer.cornerRadius = 10
        aboutCandidateSummaryView.layer.cornerRadius = 10
        socialMediaView.layer.cornerRadius = 10
        attachmentsView.layer.cornerRadius = 10
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        
        let topColor = UIColor(red: (42/255.0), green: (77/255.0), blue:(246/255.0), alpha: 1)
        let bottomColor = UIColor(red: (93/255.0), green: (72/255.0), blue:(246/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 267)
            
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.profileView.layer.insertSublayer(gradientLayer, at: 0)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == socialMediaTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaTableViewCell") as! SocialMediaTableViewCell
            cell.textLabel?.text = "Facebook"
            socialMediaViewHeight.constant = 2 * 50 + 80
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentsInUpdateProfileTableViewCell") as! AttachmentsInUpdateProfileTableViewCell
            attachmentsTableViewHeight.constant = 2 * 80
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == socialMediaTableView{
            return 50
        }else{
        return 80
        }
    }
    @IBAction func deletePressed(_ sender: UIButton) {
    }
    @IBAction func morePressed(_ sender: UIButton) {
        moreView.isHidden = false
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        moreView.isHidden = true
    }
    
    @IBAction func moreBtnsPressed(_ sender: UIButton) {
        if sender.tag == 0{
            emailView.backgroundColor = UIColor(red: (229/255.0), green: (234/255.0), blue:(253/255.0), alpha: 1)
            smsView.backgroundColor = UIColor.white
            forwardView.backgroundColor = UIColor.white
            downloadView.backgroundColor = UIColor.white
            whatsappView.backgroundColor = UIColor.white
        }
        if sender.tag == 1{
            smsView.backgroundColor = UIColor(red: (229/255.0), green: (234/255.0), blue:(253/255.0), alpha: 1)
            emailView.backgroundColor = UIColor.white
            forwardView.backgroundColor = UIColor.white
            downloadView.backgroundColor = UIColor.white
            whatsappView.backgroundColor = UIColor.white
        }
        if sender.tag == 2{
            forwardView.backgroundColor = UIColor(red: (229/255.0), green: (234/255.0), blue:(253/255.0), alpha: 1)
            smsView.backgroundColor = UIColor.white
            emailView.backgroundColor = UIColor.white
            downloadView.backgroundColor = UIColor.white
            whatsappView.backgroundColor = UIColor.white
        }
        if sender.tag == 3{
            downloadView.backgroundColor = UIColor(red: (229/255.0), green: (234/255.0), blue:(253/255.0), alpha: 1)
            smsView.backgroundColor = UIColor.white
            forwardView.backgroundColor = UIColor.white
            emailView.backgroundColor = UIColor.white
            whatsappView.backgroundColor = UIColor.white
        }
        if sender.tag == 4{
            whatsappView.backgroundColor = UIColor(red: (229/255.0), green: (234/255.0), blue:(253/255.0), alpha: 1)
            smsView.backgroundColor = UIColor.white
            forwardView.backgroundColor = UIColor.white
            downloadView.backgroundColor = UIColor.white
            emailView.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CandidateDetailPressed(_ sender: UIButton) {
        //tages candidateDetail0, work exp1, education2 and personal info3
        if sender.tag == 0{
            let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "CandidateDetailsVC") as! CandidateDetailsVC
            present(vc, animated: true, completion: nil)
        }
        if sender.tag == 1{
            let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "WorkExperience1VC") as! WorkExperience1VC
            present(vc, animated: true, completion: nil)
        }
        if sender.tag == 2{
            let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "ProfileEducationVC") as! ProfileEducationVC
            present(vc, animated: true, completion: nil)
        }
        if sender.tag == 3{
            let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "PersonalInformationVC") as! PersonalInformationVC
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func barBtnsPressed(_ sender: UIButton) {
        //tags email 5, phone 6, chat 7, skype 8
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
class SocialMediaTableViewCell: UITableViewCell {
    
}
class AttachmentsInUpdateProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewDocLbl: UILabel!
    @IBOutlet weak var docNameLbl: UILabel!
}
