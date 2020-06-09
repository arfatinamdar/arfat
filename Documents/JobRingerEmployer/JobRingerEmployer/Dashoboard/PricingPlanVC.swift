//
//  PricingPlanVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 27/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

var comboPackagesCheck = false
var jobPostingCheck = false

class PricingPlanVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var comboPackagesTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var comboPackagesTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var databaseSearchView: UIView!
    @IBOutlet weak var comboPackagesView: UIView!
    @IBOutlet weak var databaseSearchTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var databaseSearchTableView: UITableView!
    @IBOutlet weak var addToCartPopupView: UIView!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var forDaysLbl: UILabel!
    @IBOutlet weak var cutPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var offPercentLbl: UILabel!
    @IBOutlet weak var popupTableView: UITableView!
    @IBOutlet weak var jobPostingCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var jobPostingView: UIView!
    
    @IBOutlet weak var jobPostingCollectionView: UICollectionView!
    
    var pricingPlanArr = NSArray()
    var databaseSearch = NSArray()
    var addToCartDict = [NSDictionary]()
    var istitleLblCheck = false
    var index = 0
    var comboPackagesIndex = 0
    var jobSeekerServiceSelected = ""
    var portalArr:[NSArray] = [["Status-Active","10 days","Rs. 20","Rs. 10","20% off"],["Featured Resume","1 day","Rs. 200","Rs. 100","20% off"],["Star Applicant","1 day","Rs. 200","Rs. 100","20% off"],["Jobling","1 day","Rs. 200","Rs. 100","20% off"]]
    var comboPackagesArr: [NSArray] = [["Package 1","10 days","Rs. 20","Rs. 10","20% off"],["Package 2","10 days","Rs. 300","Rs. 250","20% off"],["Package 3","20 days","Rs. 450","Rs. 400","20% off"]]
    var jobPostingArr = [["Package 1","Rs. 500", "Rs. 100", "20% off", "JobDisplay / 10 days","Pack Validity / 10 days","1 Job Posting"],["Package 1","Rs. 500", "Rs. 100", "20% off", "JobDisplay / 10 days","Pack Validity / 10 days","1 Job Posting"],["Package 1","Rs. 500", "Rs. 100", "20% off", "JobDisplay / 10 days","Pack Validity / 10 days","1 Job Posting"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comboPackagesView.isHidden = false
        databaseSearchView.isHidden = true
        jobPostingView.isHidden = true
        pricingPlanArr = ["Combo Packages","Job Posting","Database Search","Mass Emails, SMS and Excel"]
        databaseSearch = ["Full Database","Database","Database","Top-up Packages"]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        addToCartPopupView.addGestureRecognizer(tap)
        addToCartBtn.layer.cornerRadius = addToCartBtn.frame.height/2
        addToCartPopupView.isHidden = true
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = addToCartBtn.frame.height/2
        self.addToCartBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        addToCartPopupView.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == jobPostingCollectionView{
            return jobPostingArr.count
        }else{
            return pricingPlanArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == jobPostingCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobPostingCollectionViewCell", for: indexPath) as! JobPostingCollectionViewCell
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.shadowRadius = 2
            cell.containerView.layer.shadowColor = UIColor.gray.cgColor
            cell.containerView.layer.shadowOpacity = 0.5
            cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.packageNameLbl.text = jobPostingArr[indexPath.item][0]
            cell.cutPriceBtn.text = jobPostingArr[indexPath.item][1]
            cell.priceLbl.text = jobPostingArr[indexPath.item][2]
            cell.percentageOffLbl.text = jobPostingArr[indexPath.item][3]
            cell.jobDisplayLbl.text = jobPostingArr[indexPath.item][4]
            cell.packValidityLbl.text = jobPostingArr[indexPath.item][5]
            cell.jobPostingLbl.text = jobPostingArr[indexPath.item][6]
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PricingPlanCollectionViewCell", for: indexPath) as! PricingPlanCollectionViewCell
            cell.strip.isHidden = true
            //if indexPath.item == 0{
            let cell1 = collectionView.cellForItem(at: indexPath)
            cell1?.layer.borderWidth = 2.0
            cell1?.layer.borderColor = UIColor.init(red: 250/256, green: 250/256, blue: 250/256, alpha: 1).cgColor
            //}
            cell.titleLbl.text = pricingPlanArr[indexPath.item] as? String
            cell.strip.tag = indexPath.item
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == jobPostingCollectionView{
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PricingPlanCollectionViewCell", for: indexPath) as! PricingPlanCollectionViewCell
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView.allowsMultipleSelection = false
           
            
            if indexPath.item == 0{
                let cell1 = collectionView.cellForItem(at: indexPath)
                cell1?.layer.borderWidth = 2.0
                cell1?.layer.borderColor = UIColor.blue.cgColor
                cell.titleLbl.textColor = UIColor.blue
                //self.collectionView.reloadData()
            }
            comboPackagesIndex = indexPath.item
            comboPackagesTableView.reloadData()
            if indexPath.item == 0{
                comboPackagesView.isHidden = false
                databaseSearchView.isHidden = true
                jobPostingView.isHidden = true
            }else if indexPath.item == 1{
                jobPostingView.isHidden = false
                comboPackagesView.isHidden = true
                databaseSearchView.isHidden = true
            }else if indexPath.item == 2{
                cell.strip.isHidden = false
                jobPostingView.isHidden = true
                comboPackagesView.isHidden = true
                databaseSearchView.isHidden = false
                //           companiesFollowingBtn.titleLabel?.textColor = UIColor(displayP3Red: 20/256, green: 69/256, blue: 245/256, alpha: 1)
                //           companiesFollowingStrip.backgroundColor = UIColor(displayP3Red: 20/256, green: 69/256, blue: 245/256, alpha: 1)
            }else if indexPath.item == 3 {
                comboPackagesIndex = indexPath.item
                jobPostingView.isHidden = true
                comboPackagesView.isHidden = false
                databaseSearchView.isHidden = true
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == jobPostingCollectionView{
            return CGSize(width: (view.frame.width-30)/2, height: (view.frame.height-360)/2)
        }else{
            return CGSize(width: view.frame.width-90/2, height:50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let cell1 = collectionView.cellForItem(at: indexPath)
        cell1?.layer.borderWidth = 2.0
        cell1?.layer.borderColor = UIColor.blue.cgColor
        self.collectionView.allowsMultipleSelection = false
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PricingPlanCollectionViewCell", for: indexPath) as! PricingPlanCollectionViewCell
        cell.titleLbl.textColor = UIColor.blue
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell1 = collectionView.cellForItem(at: indexPath)
        cell1?.layer.borderWidth = 2.0
        cell1?.layer.borderColor = UIColor.init(red: 250/256, green: 250/256, blue: 250/256, alpha: 1).cgColor
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PricingPlanCollectionViewCell", for: indexPath) as! PricingPlanCollectionViewCell
        cell.titleLbl.textColor = UIColor.black
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell1 = collectionView.cellForItem(at: indexPath)
        cell1?.layer.borderWidth = 2.0
        cell1?.layer.borderColor = UIColor.init(red: 250/256, green: 250/256, blue: 250/256, alpha: 1).cgColor
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == comboPackagesTableView{
            if comboPackagesIndex == 0{
                return comboPackagesArr.count
            }else{
                return comboPackagesArr.count
            }
        }else if tableView == databaseSearchTableView{
            return databaseSearch.count
        }else{
            return portalArr.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if comboPackagesIndex == 3{
            return 3
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if comboPackagesIndex == 3{
            return "Mass Mails"
        }else{
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == comboPackagesTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ComboPackagesTableViewCell", for: indexPath) as! ComboPackagesTableViewCell
            if comboPackagesIndex == 0{
                cell.packageLbl.text = comboPackagesArr[indexPath.row][0] as? String
                cell.forDaysLbl.text = comboPackagesArr[indexPath.row][1] as? String
                cell.cutPriceLbl.text = comboPackagesArr[indexPath.row][2] as? String
                cell.priceLbl.text = comboPackagesArr[indexPath.row][3] as? String
                cell.offInPercentageLbl.text = comboPackagesArr[indexPath.row][4] as? String
                //comboPackagesTableViewHeight.constant = CGFloat(comboPackagesArr.count * 120)
            }else{
                cell.packageLbl.text = comboPackagesArr[indexPath.row][0] as? String
                cell.forDaysLbl.text = comboPackagesArr[indexPath.row][1] as? String
                cell.cutPriceLbl.text = comboPackagesArr[indexPath.row][2] as? String
                cell.priceLbl.text = comboPackagesArr[indexPath.row][3] as? String
                cell.offInPercentageLbl.text = comboPackagesArr[indexPath.row][4] as? String
                // comboPackagesTableViewHeight.constant = CGFloat((comboPackagesArr.count + 4) * 120)
            }
            cell.container.layer.cornerRadius = 10
            cell.container.layer.shadowRadius = 2
            cell.container.layer.shadowColor = UIColor.gray.cgColor
            cell.container.layer.shadowOpacity = 0.5
            cell.container.layer.shadowOffset = CGSize(width: -1, height: 1)
            tableView.separatorStyle = .none
            return cell
        }else if tableView == databaseSearchTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DatabaseSearchTableViewCell", for: indexPath) as! DatabaseSearchTableViewCell
            cell.titleLbl.text = databaseSearch[indexPath.row] as? String
            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.shadowRadius = 2
            cell.containerView.layer.shadowColor = UIColor.gray.cgColor
            cell.containerView.layer.shadowOpacity = 0.5
            cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            tableView.separatorStyle = .none
            //cell.selectionStyle = .none
            databaseSearchTableViewHeight.constant = CGFloat(databaseSearch.count * 120)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopupTableViewCell", for: indexPath) as! PopupTableViewCell
            cell.textLabel?.text = portalArr[indexPath.row][0] as? String
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == comboPackagesTableView{
            return 120
        }else if tableView == databaseSearchTableView{
            return 80
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == comboPackagesTableView{
            //let cell = tableView.dequeueReusableCell(withIdentifier: "ComboPackagesTableViewCell", for: indexPath) as! ComboPackagesTableViewCell
            //cell.checkBtn.tag = indexPath.row
            //comboPackagesTableView.reloadData()
            index = indexPath.row
            updateField()
        }else if tableView == databaseSearchTableView{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "FullDatabaseVC") as! FullDatabaseVC
            //jobSeekerServiceSelected = databaseSearch[indexPath.row] as? String ?? ""
            //vc.jobSeekerServiceSelected = jobSeekerServiceSelected
            present(vc, animated: true, completion: nil)
        }
    }
    
    func updateField(){
        productLbl.text = comboPackagesArr[index][0] as? String
        forDaysLbl.text = comboPackagesArr[index][1] as? String
        cutPriceLbl.text = comboPackagesArr[index][2] as? String
        priceLbl.text = comboPackagesArr[index][3] as? String
        offPercentLbl.text = comboPackagesArr[index][4] as? String
        addToCartPopupView.isHidden = false
    }
    
    @IBAction func cartPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func termsAndConditionPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AboutUsTCPrivacyPolicyVC") as! AboutUsTCPrivacyPolicyVC
        vc.isFrom = "Terms & Conditions"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToCartPressed(_ sender: UIButton) {
        //subscriptionActiveDict = addToCartDict
        //let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "PricingPlanVC") as! PricingPlanVC
        //present(vc, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    //    @IBAction func checkPressed(_ sender: UIButton) {
    //        istitleLblCheck = !istitleLblCheck
    //        if istitleLblCheck == true{
    //            titleLblCheckBtn.setImage(UIImage(named: "check"), for: .normal)
    //        }else{
    //            titleLblCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
    //        }
    //    }
    
}
class PricingPlanCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var strip: UIView!
}
class ComboPackagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var packageLbl: UILabel!
    @IBOutlet weak var forDaysLbl: UILabel!
    @IBOutlet weak var offInPercentageLbl: UILabel!
    @IBOutlet weak var cutPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var checkboxImg: UIImageView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBAction func checkPressed(_ sender: UIButton) {
        comboPackagesCheck = !comboPackagesCheck
        if comboPackagesCheck == true{
            checkboxImg.image = UIImage(named: "check")
        }else{
            checkboxImg.image = UIImage(named: "uncheck")
        }
    }
}
class DatabaseSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailTextLbl: UILabel!
}
class PopupTableViewCell: UITableViewCell {
    
}
class JobPostingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var packageNameLbl: UILabel!
    @IBOutlet weak var cutPriceBtn: UILabel!
    @IBOutlet weak var percentageOffLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var jobDisplayLbl: UILabel!
    @IBOutlet weak var packValidityLbl: UILabel!
    @IBOutlet weak var jobPostingLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBAction func checkPressed(_ sender: UIButton) {
        jobPostingCheck = !jobPostingCheck
        if jobPostingCheck == true{
            checkBtn.setImage(UIImage(named: "check"), for: .normal)
        }else{
            checkBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
}
