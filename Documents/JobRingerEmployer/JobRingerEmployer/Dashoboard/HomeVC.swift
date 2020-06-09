//
//  HomeVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 09/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class HomeVC: UIViewController ,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var rcommendedJobsLbl: UILabel!
    @IBOutlet weak var recommendedJobsTableView: UITableView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewAllRecommendedJobsBtn: UIButton!
    @IBOutlet weak var savedJobsView: UIView!
    @IBOutlet weak var jobAlertsLbl: UILabel!
    @IBOutlet weak var applicationsLbl: UILabel!
    @IBOutlet weak var applicationsCollectionView: UICollectionView!
    @IBOutlet weak var jobAlertsTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var jobAlertsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var applicationsCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var recommendedTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewAllApplicationsBtn: UIButton!
    @IBOutlet weak var viewAllAlertJobsBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var recommendedJobsDict: [NSDictionary] = [["designation": "iOS Developer", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "notDisclosed": "Not Disclosed", "city": "Mumbai", "postedByAndDaysAgo": "Posted by Ajay Bhanushali, 1 day ago"],["designation": "iOS Developer", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "notDisclosed": "Not Disclosed", "city": "Mumbai", "postedByAndDaysAgo": "Posted by Ajay Bhanushali, 1 day ago"]]
    
    var jobAlertDict: [NSDictionary] = [["designation": "Social Media Expert", "vancancyFor": "Accountants|Designer|Developer|Marketing manager", "address": "Eureka tower, Mind space, nehru nagar kurla east"],["designation": "Social Media Expert", "vancancyFor": "Accountants|Designer", "address": "Eureka tower, Mind space."]]
    
    var applicationStatusDict: [NSDictionary] = [["designation": "iOS Developer", "companyName": "Innovins Softech Pvt Ltd", "city": "Mumbai"],["designation": "iOS Developer", "companyName": "Innovins Softech Pvt Ltd", "city": "Mumbai"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rcommendedJobsLbl.text = "15"
        applicationsLbl.text = "3"
        jobAlertsLbl.text = "20"
        savedJobsView.layer.cornerRadius = 5
        viewAllRecommendedJobsBtn.layer.cornerRadius = viewAllRecommendedJobsBtn.frame.height/2
        viewAllApplicationsBtn.layer.cornerRadius = viewAllApplicationsBtn.frame.height/2
        viewAllAlertJobsBtn.layer.borderColor = UIColor.black.cgColor
        viewAllAlertJobsBtn.layer.borderWidth = 1
        viewAllApplicationsBtn.layer.borderColor = UIColor.black.cgColor
        viewAllApplicationsBtn.layer.borderWidth = 1
        viewAllRecommendedJobsBtn.layer.borderColor = UIColor.black.cgColor
        viewAllRecommendedJobsBtn.layer.borderWidth = 1
        viewAllAlertJobsBtn.layer.cornerRadius = viewAllAlertJobsBtn.frame.height/2
        savedJobsView.layer.cornerRadius = 10
        savedJobsView.layer.shadowRadius = 2
        savedJobsView.layer.shadowColor = UIColor.gray.cgColor
        savedJobsView.layer.shadowOpacity = 0.5
        savedJobsView.layer.shadowOffset = CGSize(width: -1, height: 1)

        //viewAllAlertJobsBtn.layer.cornerRadius = viewAllAlertJobsBtn.frame.height/2
        scrollViewHeight.constant = view.intrinsicContentSize.height
       // scrollView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recommendedJobsTableView{
        return recommendedJobsDict.count
        }
        return jobAlertDict.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recommendedJobsTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedJobsTableViewCell", for: indexPath) as! RecommendedJobsTableViewCell
            recommendedTableViewHeight.constant = CGFloat(recommendedJobsDict.count * 250)
            cell.applyBtn.layer.cornerRadius = cell.applyBtn.frame.height/2
            tableView.isScrollEnabled = false
            cell.containerImg.layer.cornerRadius = 10
            cell.containerImg.layer.shadowRadius = 2
            cell.containerImg.layer.shadowColor = UIColor.gray.cgColor
            cell.containerImg.layer.shadowOpacity = 0.5
            cell.containerImg.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.containerImg.layer.cornerRadius = 10
            cell.designationLbl.text = recommendedJobsDict[indexPath.row].value(forKey: "designation") as? String
            cell.companyNameLbl.text = recommendedJobsDict[indexPath.row].value(forKey: "companyName") as? String
            cell.expLbl.text = recommendedJobsDict[indexPath.row].value(forKey: "exp") as? String
            cell.notDisclosedLbl.text = recommendedJobsDict[indexPath.row].value(forKey: "notDisclosed") as? String
            cell.cityLbl.text = recommendedJobsDict[indexPath.row].value(forKey: "city") as? String
            cell.postedByAndDaysAgoLbl.text = recommendedJobsDict[indexPath.row].value(forKey: "postedByAndDaysAgo") as? String
            tableView.separatorStyle = .none
            cell.selectionStyle = .none
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "JobAllertsTableViewCell", for: indexPath) as! JobAllertsTableViewCell
            jobAlertsTableViewHeight.constant = CGFloat(jobAlertDict.count * 150)
            scrollViewHeight.constant = recommendedTableViewHeight.constant + applicationsCollectionViewHeight.constant + jobAlertsTableViewHeight.constant
            cell.moreView.isHidden = true
            cell.moreView.layer.cornerRadius = 5
            cell.containedView.layer.cornerRadius = 10
            cell.containedView.layer.shadowRadius = 2
            cell.containedView.layer.shadowColor = UIColor.gray.cgColor
            cell.containedView.layer.shadowOpacity = 0.5
            cell.containedView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.moreView.layer.cornerRadius = 10
            cell.moreView.layer.shadowRadius = 2
            cell.moreView.layer.shadowColor = UIColor.gray.cgColor
            cell.moreView.layer.shadowOpacity = 0.5
            cell.moreView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.designationLbl.text = jobAlertDict[indexPath.row].value(forKey: "designation") as? String
            cell.vancancyForLbl.text = jobAlertDict[indexPath.row].value(forKey: "vancancyFor") as? String
            cell.addressLbl.text = jobAlertDict[indexPath.row].value(forKey: "address") as? String
            cell.deleteBtn.tag = indexPath.row
            
            tableView.isScrollEnabled = false
            cell.selectionStyle = .none
            tableView.separatorStyle = .none

            return cell
        }
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == jobAlertsTableView{
            return 150
        }
        return 250
    }
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return applicationStatusDict.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApplicationStatusCollectionViewCell", for: indexPath) as! ApplicationStatusCollectionViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.designationLbl.text = applicationStatusDict[indexPath.item].value(forKey: "designation") as? String
        cell.companyNameLbl.text = applicationStatusDict[indexPath.item].value(forKey: "companyName") as? String
        cell.cityLbl.text = applicationStatusDict[indexPath.item].value(forKey: "city") as? String
        cell.applicationSentBtn.layer.cornerRadius = cell.applicationSentBtn.frame.height/2
        cell.applicationSentBtn.layer.borderWidth = 1
        cell.applicationSentBtn.layer.borderColor = UIColor.gray.cgColor
        return cell
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: containerView.frame.width * 0.75, height: 150)
       }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ApplicationStatusWithContactPersonVC") as! ApplicationStatusWithContactPersonVC
           present(vc, animated: true, completion: nil)
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func viewAllRecommendedJobsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "RecommendedJobsVC") as! RecommendedJobsVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func viewAllApplicationsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ApplicationStatusVC") as! ApplicationStatusVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func viewAllJobAlertsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AddJobAlert") as! AddJobAlert
        present(vc, animated: true, completion: nil)
    }
    @IBAction func savedJobsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "SavedJobsVC") as! SavedJobsVC
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
    @IBAction func recommendedSharePressed(_ sender: UIButton) {
    }
    
    @IBAction func recommededBookmarkPresed(_ sender: UIButton) {
    }
    
    @IBAction func recommendedApplyPressed(_ sender: UIButton) {
    }
    @IBAction func jobAlertDeletePressed(_ sender: UIButton) {
        
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "do you want to delete this record?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            print("yes button tapped")

            self.jobAlertDict.remove(at: sender.tag)
            self.jobAlertsTableView.reloadData()
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
class RecommendedJobsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var expLbl: UILabel!
    @IBOutlet weak var notDisclosedLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var postedByAndDaysAgoLbl: UILabel!
    @IBOutlet weak var containerImg: UIImageView!
    @IBOutlet weak var applyLbl: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var bookmarkBtn: UIButton!
}

class ApplicationStatusCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var applicationSentBtn: UIButton!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
}
class JobAllertsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var vancancyForLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var containedView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBAction func morePressed(_ sender: UIButton) {
        moreView.isHidden = false
    }
}
