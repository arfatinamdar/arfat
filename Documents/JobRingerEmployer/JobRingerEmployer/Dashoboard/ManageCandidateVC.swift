//
//  QuickSearchResultVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 11/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class ManageCandidateVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var jobOrCompanyLbl: UILabel!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var searchResultTableVeiw: UITableView!
    @IBOutlet weak var searchResultTableVeiwHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var appliedSuccessfullyPopup: UIView!
    @IBOutlet weak var sortByPopup: UIView!
    @IBOutlet weak var loginPopupView: UIView!
    @IBOutlet weak var noResultsView: UIView!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var manageCandidateTableView: UITableView!
    @IBOutlet weak var manageCandidateTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var prospectLbl: UILabel!
    @IBOutlet weak var appliedNotMatchingLbl: UILabel!
    @IBOutlet weak var appliedMatchingLbl: UILabel!
    @IBOutlet weak var shortlistedLbl: UILabel!
    @IBOutlet weak var onHoldLbl: UILabel!
    
    var isFrom = ""
    var manageCandidateDict: [NSDictionary] = [["candidateName": "Arfat Inamdar", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "notDisclosed": "Not Disclosed", "city": "Mumbai", "postedByAndDaysAgo": "Posted by Ajay Bhanushali, 1 day ago"],["candidateName": "Arfat Inamdar", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "notDisclosed": "Not Disclosed", "city": "Mumbai", "appliedOn": "17.05.2020"]]
    var candidateArr = [String]()
    var sortBy = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortBy = "designation"
        noResultsView.isHidden = true
        if candidateArr.isEmpty{
        }else{
            designationLbl.text = candidateArr[0]
        }
        
        sortByPopup.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        applyBtn.layer.cornerRadius = applyBtn.frame.height/2
        appliedSuccessfullyPopup.isHidden = true
        loginPopupView.isHidden = true
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
        
        gradientLayer.colors = [rightColor.cgColor, leftColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = applyBtn.frame.height/2
        self.applyBtn.layer.insertSublayer(gradientLayer, at: 0)
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        appliedSuccessfullyPopup.isHidden = true
        loginPopupView.isHidden = true
        sortByPopup.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageCandidateDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageCandidateTableViewCell", for: indexPath) as! ManageCandidateTableViewCell
        tableView.separatorStyle = .none

        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        //name 2 designation 0 location 3 experience 1
        //if isFrom == "WithoutLogin"{
            cell.candidateName.text = manageCandidateDict[indexPath.row].value(forKey: "candidateName") as? String
            cell.companynNameLbl.text = manageCandidateDict[indexPath.row].value(forKey: "companyName") as? String
            cell.experienceLbl.text = manageCandidateDict[indexPath.row].value(forKey: "exp") as? String
            cell.notDicslosedLbl.text = manageCandidateDict[indexPath.row].value(forKey: "notDisclosed") as? String
            cell.cityLbl.text = manageCandidateDict[indexPath.row].value(forKey: "city") as? String
        cell.appliedOnLbl.text = "Applied on " + "\(String(describing: manageCandidateDict[indexPath.row].value(forKey: "appliedOn") as? String ?? ""))"
            manageCandidateTableViewHeight.constant = CGFloat(manageCandidateDict.count * 250)
//        }else{
//        if sortBy == "designation"{
//            searchResultTableVeiw.isHidden = false
//            noResultsView.isHidden = true
//            applyBtn.isHidden = false
//            if searchArr[0] == manageCandidateDict[indexPath.row].value(forKey: "designation") as? String || searchArr[1] == manageCandidateDict[indexPath.row].value(forKey: "exp") as? String || searchArr[2] == quickSearchResultDict[indexPath.row].value(forKey: "companyName") as? String || searchArr[3] == manageCandidateDict[indexPath.row].value(forKey: "city") as? String{
//                cell.designationLbl.text = manageCandidateDict[indexPath.row].value(forKey: "designation") as? String
//                cell.companynNameLbl.text = manageCandidateDict[indexPath.row].value(forKey: "companyName") as? String
//                cell.experienceLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "exp") as? String
//                cell.notDicslosedLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "notDisclosed") as? String
//                cell.cityLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "city") as? String
//                cell.postedByWithDateLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "postedByAndDaysAgo") as? String
//                cell.shareBtn.tag = indexPath.row
//                cell.bookmarkBtn.tag = indexPath.row
//                searchResultTableVeiwHeight.constant = CGFloat(quickSearchResultDict.count * 250)
//                scrollViewHeight.constant = searchResultTableVeiwHeight.constant
//            }else{
//                searchResultTableVeiw.isHidden = true
//                noResultsView.isHidden = false
//                applyBtn.isHidden = true
//            }
//        }else if sortBy == "name"{
//            searchResultTableVeiw.isHidden = false
//            noResultsView.isHidden = true
//            applyBtn.isHidden = false
//            if searchArr[2] == quickSearchResultDict[indexPath.row].value(forKey: "companyName") as? String{
//                cell.designationLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "designation") as? String
//                cell.companynNameLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "companyName") as? String
//                cell.experienceLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "exp") as? String
//                cell.notDicslosedLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "notDisclosed") as? String
//                cell.cityLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "city") as? String
//                cell.postedByWithDateLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "postedByAndDaysAgo") as? String
//                cell.shareBtn.tag = indexPath.row
//                cell.bookmarkBtn.tag = indexPath.row
//                searchResultTableVeiwHeight.constant = CGFloat(quickSearchResultDict.count * 250)
//                scrollViewHeight.constant = searchResultTableVeiwHeight.constant
//            }else{
//                searchResultTableVeiw.isHidden = true
//                noResultsView.isHidden = false
//                applyBtn.isHidden = true
//            }
//
//        }else if sortBy == "location"{
//            searchResultTableVeiw.isHidden = false
//            noResultsView.isHidden = true
//            applyBtn.isHidden = false
//            if searchArr[3] == quickSearchResultDict[indexPath.row].value(forKey: "city") as? String{
//                cell.designationLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "designation") as? String
//                cell.companynNameLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "companyName") as? String
//                cell.experienceLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "exp") as? String
//                cell.notDicslosedLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "notDisclosed") as? String
//                cell.cityLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "city") as? String
//                cell.postedByWithDateLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "postedByAndDaysAgo") as? String
//                cell.shareBtn.tag = indexPath.row
//                cell.bookmarkBtn.tag = indexPath.row
//                searchResultTableVeiwHeight.constant = CGFloat(quickSearchResultDict.count * 250)
//                scrollViewHeight.constant = searchResultTableVeiwHeight.constant
//            }else{
//                searchResultTableVeiw.isHidden = true
//                noResultsView.isHidden = false
//                applyBtn.isHidden = true
//            }
//        }else{
//            searchResultTableVeiw.isHidden = false
//            noResultsView.isHidden = true
//            applyBtn.isHidden = false
//            if searchArr[1] == quickSearchResultDict[indexPath.row].value(forKey: "exp") as? String{
//                cell.designationLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "designation") as? String
//                cell.companynNameLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "companyName") as? String
//                cell.experienceLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "exp") as? String
//                cell.notDicslosedLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "notDisclosed") as? String
//                cell.cityLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "city") as? String
//                cell.postedByWithDateLbl.text = quickSearchResultDict[indexPath.row].value(forKey: "postedByAndDaysAgo") as? String
//                cell.shareBtn.tag = indexPath.row
//                cell.bookmarkBtn.tag = indexPath.row
//                searchResultTableVeiwHeight.constant = CGFloat(quickSearchResultDict.count * 250)
//                scrollViewHeight.constant = searchResultTableVeiwHeight.constant
//            }else{
                //manageCandidateTableView.isHidden = true
                noResultsView.isHidden = true
           // }
       // }
        //}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    @IBAction func emailPressed(_ sender: UIButton) {
    }
    @IBAction func smsPressed(_ sender: UIButton) {
    }
    
    @IBAction func applyPressed(_ sender: UIButton) {
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterFirst") as! RegisterFirst
        present(vc, animated: true, completion: nil)
    }
    @IBAction func applyWithoutRegistrationPressed(_ sender: UIButton) {
        //let vc = UIStoryboard(name: "WithoutLogin", bundle: nil).instantiateViewController(withIdentifier: "ApplyWithoutRegistrationVC") as! ApplyWithoutRegistrationVC
        //present(vc, animated: true, completion: nil)
    }
    @IBAction func sortByPressed(_ sender: UIButton) {
        sortByPopup.isHidden = false
    }
    
    @IBAction func sortByPopupBtns(_ sender: UIButton) {
        //tags prospect 0, applied - not matching 1, applied - matching 2, Shortlisted 3 and on hold 4.
        sortBy = ""
        if sender.tag == 0{
            sortBy = "manageCandidate"
            prospectLbl.textColor = UIColor.red
            appliedNotMatchingLbl.textColor = UIColor.black
            appliedMatchingLbl.textColor = UIColor.black
            shortlistedLbl.textColor = UIColor.black
            onHoldLbl.textColor = UIColor.black
            manageCandidateTableView.reloadData()
        }else if sender.tag == 1{
            sortBy = "notMatching"
            prospectLbl.textColor = UIColor.black
            appliedNotMatchingLbl.textColor = UIColor.red
            appliedMatchingLbl.textColor = UIColor.black
            shortlistedLbl.textColor = UIColor.black
            onHoldLbl.textColor = UIColor.black
            manageCandidateTableView.reloadData()
        }else if sender.tag == 2{
            sortBy = "matching"
            prospectLbl.textColor = UIColor.black
            appliedNotMatchingLbl.textColor = UIColor.black
            appliedMatchingLbl.textColor = UIColor.red
            shortlistedLbl.textColor = UIColor.black
            onHoldLbl.textColor = UIColor.black
            manageCandidateTableView.reloadData()
        }else if sender.tag == 3{
            sortBy = "shortlisted"
            prospectLbl.textColor = UIColor.black
            appliedNotMatchingLbl.textColor = UIColor.black
            appliedMatchingLbl.textColor = UIColor.black
            shortlistedLbl.textColor = UIColor.red
            onHoldLbl.textColor = UIColor.black
            manageCandidateTableView.reloadData()
        }else{
            sortBy = "onHold"
            prospectLbl.textColor = UIColor.black
            appliedNotMatchingLbl.textColor = UIColor.black
            appliedMatchingLbl.textColor = UIColor.black
            shortlistedLbl.textColor = UIColor.black
            onHoldLbl.textColor = UIColor.red
            manageCandidateTableView.reloadData()
        }
        UIView.animate(withDuration: 0.5) {
            self.sortByPopup.isHidden = true
        }
    }
    
    @IBAction func filtersPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "FiltersVC") as! FiltersVC
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
class ManageCandidateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companynNameLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var notDicslosedLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var experienceLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var alreadyAppliedLbl: UILabel!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var postedByWithDateLbl: UILabel!
    @IBOutlet weak var verifyImg: UIImageView!
    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet weak var appliedOnLbl: UILabel!
    
    var candidateChecked = false
    
    
    @IBAction func checkPressed(_ sender: UIButton) {
        candidateChecked = !candidateChecked
        if candidateChecked == true{
            checkBtn.setImage(UIImage(named: "check"), for: .normal)
        }else{
            checkBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
        }
    }
}
