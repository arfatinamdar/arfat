//
//  JobDetailsVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 31/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class JobDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var expLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var openingsLbl: UILabel!
    @IBOutlet weak var keywordsLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var cityBranchesLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var numberOfJobsLbl: UILabel!
    @IBOutlet weak var numberOfApplicationsLbl: UILabel!
    @IBOutlet weak var walkInLbl: UILabel!
    @IBOutlet weak var viewMoreDetailsBtn: UIButton!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var overviewTableView: UITableView!
    @IBOutlet weak var contactPersonCollectionView: UICollectionView!
    @IBOutlet weak var viewAllJobsBySameEmployerBtn: UIButton!
    @IBOutlet weak var viewAllSimilarJobsBtn: UIButton!
    @IBOutlet weak var overviewTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var similarJobsCollectionView: UICollectionView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var companyProfileImg: UIImageView!
    @IBOutlet weak var saveAndPostLaterBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    
    var overviewArr = NSArray()
    var numberOfJobs = 2003
    var overviewValueArr = NSArray()
    var contactPersonDict: [NSDictionary] = [["contactPersonName":"Ajay bhanushali","contactPersonDesignation":"Recruitment consultant","contactPersonEmail":"ajay@xyz.in","contactPersonMobile":"13","contactPersonWhatsapp":"24"],["contactPersonName":"Ajay bhanushali","contactPersonDesignation":"Recruitment consultant","contactPersonEmail":"ajay@xyz.in","contactPersonMobile":"13","contactPersonWhatsapp":"24"]]
    var similarJobsDict: [NSDictionary] = [["jobTitle": "iOS Developer", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "salary": "Not Disclosed", "city": "Mumbai", "jobPostedByAndDaysAgo": "Posted by Ajay Bhanushali, 1 day ago"],["jobTitle": "iOS Developer", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "salary": "Not Disclosed", "city": "Mumbai", "jobPostedByAndDaysAgo": "Posted by Ajay Bhanushali, 1 day ago"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyProfileImg.image = UIImage(named: "abdul")
        companyProfileImg.layer.cornerRadius = companyProfileImg.frame.height/2
        overviewArr = ["Functional Area","Industry","Job Role","Designation","Job Level","Role reports to","Team Management","Employement type","Job Type","Shifts","Work Days/Time","Degree of travel","Travel required to","Other Employee Benefits","Role and Responsibilities"]
        overviewValueArr = ["Manufacturing, production","Chemicals","head manufacturing","COO","top management","CMD","Yes","Parmanant, Contract, Internship","part time","General","Monday to friday 9am to 6pm(sunday closed) saturday 9am to 1:30pm","up to 50%","Outstation(within state","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"]
        expLbl.text = "0 - 2 Years"
        salaryLbl.text = "Not disclosed"
        openingsLbl.text = "100"
        if numberOfJobs > 2000{
            numberOfJobsLbl.text = "2000+ Job Views"
        }
        numberOfApplicationsLbl.text = "1200+ Applicants"
        checkBtn.setImage(UIImage(named: "check"), for: .normal)
        designationLbl.text = "iOS Developer"
        companyNameLbl.text = "Innovins Softtech Pvt. Ltd."
        cityBranchesLbl.text = "Mumbai/Hyderabad"
        expLbl.text = "0 - 2 Years"
        salaryLbl.text = "Not discosed"
        openingsLbl.text = "100"
        postBtn.layer.cornerRadius = postBtn.frame.height/2
        overviewView.layer.cornerRadius = 10
        overviewView.layer.shadowRadius = 2
        overviewView.layer.shadowColor = UIColor.gray.cgColor
        overviewView.layer.shadowOpacity = 0.5
        overviewView.layer.shadowOffset = .zero
        viewAllJobsBySameEmployerBtn.layer.borderWidth = 1
        viewAllJobsBySameEmployerBtn.layer.borderColor = UIColor.black.cgColor
        viewAllJobsBySameEmployerBtn.layer.cornerRadius = viewAllJobsBySameEmployerBtn.frame.height/2
        viewAllSimilarJobsBtn.layer.borderWidth = 1
        viewAllSimilarJobsBtn.layer.borderColor = UIColor.black.cgColor
        followBtn.layer.cornerRadius = followBtn.frame.height/2
        followBtn.layer.borderWidth = 1
        followBtn.layer.borderColor = UIColor.white.cgColor
        viewAllSimilarJobsBtn.layer.cornerRadius = viewAllSimilarJobsBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer.colors = [rightColor.cgColor, leftColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = postBtn.frame.height/2
        self.postBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        let topColor = UIColor(red: (42/255.0), green: (77/255.0), blue:(246/255.0), alpha: 1)
        let bottomColor = UIColor(red: (93/255.0), green: (72/255.0), blue:(246/255.0), alpha: 1)
        
        let gradientLayer1 = CAGradientLayer()
        
        gradientLayer1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 290)
        
        gradientLayer1.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer1.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer1.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.profileView.layer.insertSublayer(gradientLayer1, at: 0)
        
        let leftColor2 = UIColor(red: (43/255.0), green: (43/255.0), blue:(48/255.0), alpha: 1)
            let rightColor2 = UIColor(red: (137/255.0), green: (137/255.0), blue:(137/255.0), alpha: 1)

            let gradientLayer2 = CAGradientLayer()
            
            gradientLayer2.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
                
            gradientLayer2.colors = [leftColor2.cgColor, rightColor2.cgColor]
            gradientLayer2.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer2.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer2.cornerRadius = saveAndPostLaterBtn.frame.height/2
    self.saveAndPostLaterBtn.layer.insertSublayer(gradientLayer2, at: 0)
        saveAndPostLaterBtn.layer.cornerRadius = saveAndPostLaterBtn.frame.height/2
        scrollViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return overviewArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "OverviewCell")
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        cell.textLabel?.font = UIFont(name: "System", size: 14)
        cell.textLabel?.textColor = UIColor.gray
        cell.textLabel?.text = overviewArr[indexPath.row] as? String
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = overviewValueArr[indexPath.row] as? String
//        cell.contentView.layer.cornerRadius = 10
//        cell.contentView.layer.shadowRadius = 2
//        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
//        cell.contentView.layer.shadowOpacity = 0.5
//        cell.contentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        overviewTableViewHeight.constant = CGFloat(overviewArr.count * 100)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contactPersonCollectionView{
            return contactPersonDict.count
        }else{
            return similarJobsDict.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contactPersonCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactPersonCollectionViewCell", for: indexPath) as! ContactPersonCollectionViewCell
            cell.contentView.layer.cornerRadius = 10
            //            cell.contentView.layer.shadowColor = UIColor.gray.cgColor
            //            cell.contentView.layer.shadowRadius = 2
            //            cell.contentView.layer.shadowOpacity = 0.5
            cell.followBtn.layer.cornerRadius = cell.followBtn.frame.height/2
            cell.followBtn.layer.borderWidth = 1
            cell.followBtn.layer.borderColor = UIColor.green.cgColor
            cell.followBtn.tag = indexPath.item
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.shadowRadius = 2
            cell.containerView.layer.shadowColor = UIColor.gray.cgColor
            cell.containerView.layer.shadowOpacity = 0.5
            cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.contactPersonNameLbl.text = contactPersonDict[indexPath.item].value(forKey: "contactPersonName") as? String
            cell.contactPersonDesignationLbl.text = contactPersonDict[indexPath.item].value(forKey: "contactPersonDesignation") as? String
            cell.contactPersonEmailLbl.text = contactPersonDict[indexPath.item].value(forKey: "contactPersonEmail") as? String
            cell.contactPersonMobileLbl.text = contactPersonDict[indexPath.item].value(forKey: "contactPersonMobile") as? String
            cell.contactPersonWhatsappLbl.text = contactPersonDict[indexPath.item].value(forKey: "contactPersonWhatsapp") as? String
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarJobsCollectionViewCell", for: indexPath) as! SimilarJobsCollectionViewCell
            cell.contentView.layer.cornerRadius = 10
            //        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
            //        cell.contentView.layer.shadowRadius = 2
            //        cell.contentView.layer.shadowOpacity = 0.5
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.shadowRadius = 2
            cell.containerView.layer.shadowColor = UIColor.gray.cgColor
            cell.containerView.layer.shadowOpacity = 0.5
            cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.jobTitleLbl.text = similarJobsDict[indexPath.row].value(forKey: "jobTitle") as? String
            cell.companyNameLbl.text = similarJobsDict[indexPath.row].value(forKey: "companyName") as? String
            cell.expLbl.text = similarJobsDict[indexPath.row].value(forKey: "exp") as? String
            cell.salaryLbl.text = similarJobsDict[indexPath.row].value(forKey: "salary") as? String
            cell.cityLbl.text = similarJobsDict[indexPath.row].value(forKey: "city") as? String
            cell.applyBtn.layer.cornerRadius = cell.applyBtn.frame.height/2
            cell.applyBtn.layer.borderWidth = 1
            cell.applyBtn.layer.borderColor = UIColor.gray.cgColor
            cell.applyBtn.tag = indexPath.item
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contactPersonCollectionView {
            return CGSize(width: view.frame.width * 0.75, height: 200)
        }else{
            return CGSize(width: view.frame.width * 0.75, height: 250)
        }
    }
    
    @IBAction func followPressed(_ sender: UIButton) {
    }
    @IBAction func viewMoreJobDetailsBtn(_ sender: UIButton) {
        //let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyTabBarVC") as! CompanyTabBarVC
        //present(vc, animated: true, completion: nil)
    }
    @IBAction func candidatesCanConnectThroughBtns(_ sender: UIButton) {
        //tags email0, phone1, whatsapp2 ans sms3
    }
    @IBAction func sharePressed(_ sender: UIButton) {
    }
    
    @IBAction func viewAllJobsBySameEmployerPressed(_ sender: UIButton) {
    }
    @IBAction func sendMeJobsLikeThisOnMailPressed(_ sender: UIButton) {
    }
    @IBAction func bookmarkPressed(_ sender: UIButton) {
    }
    @IBAction func viewAllSimilarJobsPressed(_ sender: UIButton) {
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func saveAndPostLaterPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
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
    
    @IBAction func cellFollowPressed(_ sender: UIButton) {
    }
    @IBAction func cellApplyPressed(_ sender: UIButton) {
    }
}
class ContactPersonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var contactPersonNameLbl: UILabel!
    @IBOutlet weak var contactPersonDesignationLbl: UILabel!
    @IBOutlet weak var contactPersonEmailLbl: UILabel!
    @IBOutlet weak var contactPersonMobileLbl: UILabel!
    @IBOutlet weak var contactPersonWhatsappLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
}
class SimilarJobsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var jobTitleLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var expLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var jobPostedByAndDaysAgoLbl: UILabel!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
}
