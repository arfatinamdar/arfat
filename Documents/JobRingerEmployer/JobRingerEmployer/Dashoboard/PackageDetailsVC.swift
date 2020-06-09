//
//  PackageDetailsVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 19/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class PackageDetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var transactionIdLbl: UILabel!
    @IBOutlet weak var packageDetailsTableView: UITableView!
    @IBOutlet weak var packageDetailsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var transactionDateLbl: UILabel!
    @IBOutlet weak var cutPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var percentageOffLbl: UILabel!
    @IBOutlet weak var activeExpiredLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var transationSubNameLbl: UILabel!
    @IBOutlet weak var activeExpiredView: UIView!
    
    var isFrom = ""
    var subscriptionActiveDict = NSDictionary()
    var subscriptionDict = NSDictionary()
    
    override func viewDidLoad() {
 
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        scrollViewHeight.constant = view.intrinsicContentSize.height
        if isFrom == "SubscriptionVC"{
            transationSubNameLbl.text = subscriptionActiveDict.value(forKey: "transationSubName") as? String
            transactionIdLbl.text = subscriptionActiveDict.value(forKey: "transactionId") as? String
            transactionDateLbl.text = subscriptionActiveDict.value(forKey: "transactionDate") as? String
            cutPriceLbl.text = subscriptionActiveDict.value(forKey: "cutPrice") as? String
            priceLbl.text = subscriptionActiveDict.value(forKey: "price") as? String
            percentageOffLbl.text = subscriptionActiveDict.value(forKey: "percentageOff") as? String
            activeExpiredLbl.text = subscriptionActiveDict.value(forKey: "activeExpired") as? String
            deleteBtn.isHidden = true
            headerLbl.text = "Subscription"
            //activeExpiredLbl.text = "Active"
            activeExpiredView.backgroundColor = UIColor.green
            activeExpiredView.layer.cornerRadius = activeExpiredView.frame.height/2
        }else{
            transationSubNameLbl.text = subscriptionDict.value(forKey: "transationSubName") as? String
            transactionIdLbl.text = subscriptionDict.value(forKey: "transactionId") as? String
            transactionDateLbl.text = subscriptionDict.value(forKey: "transactionDate") as? String
            cutPriceLbl.text = subscriptionDict.value(forKey: "cutPrice") as? String
            priceLbl.text = subscriptionDict.value(forKey: "price") as? String
            percentageOffLbl.text = subscriptionDict.value(forKey: "percentageOff") as? String
            activeExpiredLbl.text = subscriptionDict.value(forKey: "activeExpired") as? String
            deleteBtn.isHidden = true
            headerLbl.text = "Subscription History"
            //activeExpiredLbl.text = "Expired"
            activeExpiredView.backgroundColor = UIColor.lightGray
            activeExpiredView.layer.cornerRadius = activeExpiredView.frame.height/2
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 2
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackageDetailsTableViewCell", for: indexPath) as! PackageDetailsTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        packageDetailsTableViewHeight.constant = 2 * 350
        return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
      
      
    @IBAction func deletePressed(_ sender: UIButton) {
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

class PackageDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var packageName: UILabel!
    @IBOutlet weak var validityLbl: UILabel!
    @IBOutlet weak var jobPostingLbl: UILabel!
    @IBOutlet weak var unlimitedDatabaseSearchLbl: UILabel!
    @IBOutlet weak var resumeDownloadLbl: UILabel!
    @IBOutlet weak var massMailLbl: UILabel!
    @IBOutlet weak var smsLbl: UILabel!
    @IBOutlet weak var excellDownloadLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
}
