//
//  SubscriptionVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 18/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

var subHistoryCheck = false

class SubscriptionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var subscriptionTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var subscriptionTableView: UITableView!
    @IBOutlet weak var addNewPackageBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var isFrom = ""
    var subscriptionActiveDict:[NSDictionary] = [["transationSubName":"some name","transactionId": "838913","transactionDate":"05/06/2020","cutPrice":"280","price":"100","percentageOff":"60%","activeExpired":"Active"]]
    
    var subscriptionDict:[NSDictionary] = [["transationSubName":"some name","transactionId": "838913","transactionDate":"05/06/2020","cutPrice":"280","price":"100","percentageOff":"60%","activeExpired":"Expired"],["transationSubName":"some name","transactionId": "83891","transactionDate":"05/06/2020","cutPrice":"280","price":"100","percentageOff":"60%","activeExpired":"Expired"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewPackageBtn.isHidden = true
        if isFrom == "SubscriptionVC"{
            deleteBtn.isHidden = true
            addNewPackageBtn.isHidden = false
            headerLbl.text = "Subscription"
        }
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = addNewPackageBtn.frame.height/2
        addNewPackageBtn.layer.cornerRadius = addNewPackageBtn.frame.height/2
        self.addNewPackageBtn.layer.insertSublayer(gradientLayer, at: 0)
        scrollViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFrom == "SubscriptionVC"{
         return 1
        }else{
            return subscriptionDict.count
        }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionTableViewCell", for: indexPath) as! subscriptionTableViewCell
        if isFrom == "SubscriptionVC"{
            cell.checkBtn.isHidden = true
            cell.activeExpiredLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "activeExpired") as? String
            cell.transationSubNameLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "transationSubName") as? String
            cell.transactionIdLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "transactionId") as? String
            cell.transactionDateLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "transactionDate") as? String
            cell.cutPriceLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "cutPrice") as? String
            cell.priceLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "price") as? String
            cell.percentageOffLbl.text = subscriptionActiveDict[indexPath.row].value(forKey: "percentageOff") as? String
            cell.activeExpiredView.backgroundColor = UIColor.green
            subscriptionTableViewHeight.constant = 1 * 130
        }else{
            cell.activeExpiredLbl.text = subscriptionDict[indexPath.row].value(forKey: "activeExpired") as? String
            cell.transationSubNameLbl.text = subscriptionDict[indexPath.row].value(forKey: "transationSubName") as? String
            cell.transactionIdLbl.text = subscriptionDict[indexPath.row].value(forKey: "transactionId") as? String
            cell.transactionDateLbl.text = subscriptionDict[indexPath.row].value(forKey: "transactionDate") as? String
            cell.cutPriceLbl.text = subscriptionDict[indexPath.row].value(forKey: "cutPrice") as? String
            cell.priceLbl.text = subscriptionDict[indexPath.row].value(forKey: "price") as? String
            cell.percentageOffLbl.text = subscriptionDict[indexPath.row].value(forKey: "percentageOff") as? String
            cell.activeExpiredView.backgroundColor = UIColor.lightGray
            subscriptionTableViewHeight.constant = 2 * 130
        }
        cell.activeExpiredView.layer.cornerRadius = cell.activeExpiredView.frame.height/2
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "PackageDetailsVC")
            as! PackageDetailsVC
        vc.isFrom = isFrom
        if isFrom == "SubscriptionVC"{
            vc.subscriptionActiveDict = subscriptionActiveDict[indexPath.row]
        }else{
            vc.subscriptionDict = subscriptionDict[indexPath.row]
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "Do you want to remove the selected searches?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            
            for _ in 0..<self.subscriptionDict.count{
                if subHistoryCheck == true{
                self.subscriptionDict.remove(at: sender.tag)
                }
            }
            self.subscriptionTableView.reloadData()
        })
        
        
        let cancel = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessagedeletdirect.addAction(ok)
        dialogMessagedeletdirect.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessagedeletdirect, animated: true, completion: nil)
    }
    
    @IBAction func addNewPackagePressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "PricingPlanVC")
            as! PricingPlanVC
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
class subscriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var transactionIdLbl: UILabel!
    @IBOutlet weak var transactionDateLbl: UILabel!
    @IBOutlet weak var cutPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var percentageOffLbl: UILabel!
    @IBOutlet weak var activeExpiredLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var activeExpiredView: UIView!
    @IBOutlet weak var transationSubNameLbl: UILabel!
    @IBAction func checkPressed(_ sender: UIButton) {
        subHistoryCheck = !subHistoryCheck
        if subHistoryCheck == true{
            checkBtn.setImage(UIImage(named: "check"), for: .normal)
        }else{
            checkBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
}
