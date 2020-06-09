//
//  CompanyDetailsVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 26/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class CompanyProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var CompanyProfilePic: UIImageView!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var companyMobileNumberLbl: UILabel!
    @IBOutlet weak var typeOfRecruiterLbl: UILabel!
    @IBOutlet weak var companyProfileView: UIView!
    @IBOutlet weak var companyDescView: UIView!
    @IBOutlet weak var companyDescLbl: UILabel!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var overviewTableView: UITableView!
    @IBOutlet weak var overviewViewHeight: NSLayoutConstraint!
    @IBOutlet weak var attachmentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var socialMediaLinksViewHeight: NSLayoutConstraint!
    @IBOutlet weak var companyDetailTableView: UITableView!
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var socialMediaTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var socialMediaView: UIView!
    @IBOutlet weak var companyDetailsView: UIView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addContactPersonBtn: UIButton!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var contactPersonTableView: UITableView!
    @IBOutlet weak var contactPersonTableViewHeight: NSLayoutConstraint!
    
    var overViewArr = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBtn.layer.cornerRadius = updateBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer1 = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer1.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer1.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer1.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer1.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer1.cornerRadius = updateBtn.frame.height/2
        self.updateBtn.layer.insertSublayer(gradientLayer1, at: 0)
        addContactPersonBtn.layer.cornerRadius = addContactPersonBtn.frame.height/2
        addContactPersonBtn.layer.borderColor = UIColor.black.cgColor
        addContactPersonBtn.layer.borderWidth = 1
        companyNameLbl.text = "Innovins Softtech pvt. Ltd"
        CompanyProfilePic.image = UIImage(named: "abdul")
        CompanyProfilePic.layer.cornerRadius = CompanyProfilePic.frame.height/2
        companyMobileNumberLbl.text = "7777777777/6666666666"
        typeOfRecruiterLbl.text = "Direct Employer"
        cityLbl.text = "Mumbai"
        overViewArr = ["Company Type","Category of Enterprices","Office Type","GSTIN","Pan No.","HQ Location","Country","City","Locality","Company Certification"]
        
        companyDescView.layer.shadowColor = UIColor.gray.cgColor
        companyDescView.layer.shadowRadius = 2
        companyDescView.layer.shadowOpacity = 0.5
        companyDescView.layer.cornerRadius = 10
        companyDescView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        overviewView.layer.shadowColor = UIColor.gray.cgColor
        overviewView.layer.shadowRadius = 2
        overviewView.layer.shadowOpacity = 0.5
        overviewView.layer.cornerRadius = 10
        overviewView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        companyDetailsView.layer.shadowColor = UIColor.gray.cgColor
        companyDetailsView.layer.shadowRadius = 2
        companyDetailsView.layer.shadowOpacity = 0.5
        companyDetailsView.layer.cornerRadius = 10
        companyDetailsView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        socialMediaView.layer.shadowColor = UIColor.gray.cgColor
        socialMediaView.layer.shadowRadius = 2
        socialMediaView.layer.shadowOpacity = 0.5
        socialMediaView.layer.cornerRadius = 10
        socialMediaView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        attachmentView.layer.shadowColor = UIColor.gray.cgColor
        attachmentView.layer.shadowRadius = 2
        attachmentView.layer.shadowOpacity = 0.5
        attachmentView.layer.cornerRadius = 10
        attachmentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        let topColor = UIColor(red: (42/255.0), green: (77/255.0), blue:(246/255.0), alpha: 1)
        let bottomColor = UIColor(red: (93/255.0), green: (72/255.0), blue:(246/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.companyProfileView.layer.insertSublayer(gradientLayer, at: 0)
        
        scrollViewHeight.constant = containerView.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == overviewTableView{
            return overViewArr.count
        }else if tableView == contactPersonTableView{
            return 2
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == overviewTableView{
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "OverviewCell")
            cell.textLabel?.font = UIFont(name: "System", size: 14)
            cell.textLabel?.textColor = UIColor.gray
            cell.textLabel?.text = overViewArr[indexPath.row] as? String
            cell.detailTextLabel?.font = UIFont(name: "System", size: 17)
            cell.detailTextLabel?.text = "Arfat"
            overviewViewHeight.constant = CGFloat(overViewArr.count * 50) + 80
            tableView.separatorStyle = .none
            return cell
        }else if tableView == socialMediaTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyDetailsSocialTableViewCell", for: indexPath) as! CompanyDetailsSocialTableViewCell
            socialMediaLinksViewHeight.constant = 50 * 2 + 80
            cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.height ?? 25)/2
            cell.socialMediaLbl.text = "Facebook"
            cell.socialIconsImg.image = UIImage(named: "abdul")
            cell.socialIconsImg.layer.cornerRadius = cell.socialIconsImg.frame.height/2
            return cell
        }else if tableView == contactPersonTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactPersonTableViewCell") as! ContactPersonTableViewCell
            cell.containerView.layer.shadowColor = UIColor.gray.cgColor
            cell.containerView.layer.shadowRadius = 2
            cell.containerView.layer.shadowOpacity = 0.5
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            contactPersonTableViewHeight.constant = 220 * 2
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyDetailAttachmentTableViewCell") as! CompanyDetailAttachmentTableViewCell
            cell.companyPresentationLbl.text = "Arfat"
            tableView.separatorStyle = .none
            attachmentViewHeight.constant = 100 * 2 + 80
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == overviewTableView || tableView == socialMediaTableView{
            return 50
        }else if tableView == contactPersonTableView{
            return 220
        }else{
            return 100
        }
    }
    @IBAction func editPressed(_ sender: UIButton) {
        //tag profile0, company desc1, overview2, contact person details3, social media links4 and attachments5.
        if sender.tag == 0{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileEditVC") as! CompanyProfileEditVC
            present(vc, animated: true, completion: nil)
        }
        if sender.tag == 2{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "OverviewEditVC") as! OverviewEditVC
            present(vc, animated: true, completion: nil)
        }
        if sender.tag == 5{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UploadDocumentsVC") as! UploadDocumentsVC
            vc.fromVC = "companyProfle"
            present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func updatePressed(_ sender: UIButton) {
    }
    
    @IBAction func addContactPersonPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ContactPersonEditVC") as! ContactPersonEditVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func companyMailPressed(_ sender: UIButton) {
    }
    @IBAction func worldPressed(_ sender: UIButton) {
    }
    @IBAction func companyDetailsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyDetailsVC") as! CompanyDetailsVC
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
    @IBAction func downloadPresentationLbl(_ sender: UIButton) {
    }
    @IBAction func attachmentDeletePressed(_ sender: UIButton) {
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "Do you want to delete this record?", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
                
                //self.portalArr.remove(at: sender.tag)
                self.companyDetailTableView.reloadData()
        
            })
                      
                      
                      let cancel = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
                          print("NO button tapped")
                      }
                      
                      //Add OK and Cancel button to dialog message
                      dialogMessagedeletdirect.addAction(ok)
                      dialogMessagedeletdirect.addAction(cancel)
                      
                      // Present dialog message to user
                      self.present(dialogMessagedeletdirect, animated: true, completion: nil)
                  }
    }
class ContactPersonTableViewCell: UITableViewCell {
    @IBOutlet weak var contactPersonNameLbl: UILabel!
    @IBOutlet weak var contactPersonDesignationLbl: UILabel!
    @IBOutlet weak var contactPersonEmailLbl: UILabel!
    @IBOutlet weak var contactPersonPhoneNoLbl: UILabel!
    @IBOutlet weak var contactPersonWANoLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
}
class CompanyDetailAttachmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyPresentationLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
}
class CompanyDetailsSocialTableViewCell: UITableViewCell {
    @IBOutlet weak var socialIconsImg: UIImageView!
    @IBOutlet weak var socialMediaLbl: UILabel!
    
}
