//
//  JobResponseListingVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 01/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class JobResponseListingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

        @IBOutlet weak var jobOrCompanyLbl: UILabel!
        @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
        @IBOutlet weak var noResultsView: UIView!
        @IBOutlet weak var designationLbl: UILabel!
        @IBOutlet weak var manageCandidateTableView: UITableView!
    @IBOutlet weak var jobResponseListingTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var jobResponseListingTableView: UITableView!
    @IBOutlet weak var selectStatusBtn: UIButton!
    
        var isFrom = ""
        var jobResponseArr: [NSDictionary] = [["candidateName": "Arfat Inamdar", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "notDisclosed": "Not Disclosed", "city": "Mumbai", "postedByAndDaysAgo": "Posted by Ajay Bhanushali, 1 day ago"],["candidateName": "Arfat Inamdar", "companyName":"Innovins Softech Pvt Ltd", "exp":"0 - 2 years", "notDisclosed": "Not Disclosed", "city": "Mumbai", "appliedOn": "17.05.2020"]]
        var responseArr = [String]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            selectStatusBtn.layer.cornerRadius = selectStatusBtn.frame.height/2
            let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
            let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)
            
            let gradientLayer = CAGradientLayer()
            
            gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
            gradientLayer.colors = [rightColor.cgColor, leftColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.cornerRadius = selectStatusBtn.frame.height/2
            self.selectStatusBtn.layer.insertSublayer(gradientLayer, at: 0)
            scrollViewHeight.constant = view.intrinsicContentSize.height
            
            // Do any additional setup after loading the view.
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return jobResponseArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JobResponseListingTableViewCell", for: indexPath) as! JobResponseListingTableViewCell
            tableView.separatorStyle = .none

            cell.containerView.layer.cornerRadius = 10
            cell.containerView.layer.shadowRadius = 2
            cell.containerView.layer.shadowColor = UIColor.gray.cgColor
            cell.containerView.layer.shadowOpacity = 0.5
            cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            //name 2 designation 0 location 3 experience 1
            //if isFrom == "WithoutLogin"{
                cell.candidateName.text = jobResponseArr[indexPath.row].value(forKey: "candidateName") as? String
                cell.companynNameLbl.text = jobResponseArr[indexPath.row].value(forKey: "companyName") as? String
                cell.experienceLbl.text = jobResponseArr[indexPath.row].value(forKey: "exp") as? String
                cell.notDicslosedLbl.text = jobResponseArr[indexPath.row].value(forKey: "notDisclosed") as? String
                cell.cityLbl.text = jobResponseArr[indexPath.row].value(forKey: "city") as? String
            cell.appliedOnLbl.text = "Applied on " + "\(String(describing: jobResponseArr[indexPath.row].value(forKey: "appliedOn") as? String ?? ""))"
                jobResponseListingTableViewHeight.constant = CGFloat(jobResponseArr.count * 250)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "CandidateProfileVC") as! CandidateProfileVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        
    }
    
        @IBAction func backPressed(_ sender: UIButton) {
            dismiss(animated: true, completion: nil)
        }

    @IBAction func selectStatusPressed(_ sender: UIButton) {
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
    class JobResponseListingTableViewCell: UITableViewCell {
        
        @IBOutlet weak var companynNameLbl: UILabel!
        @IBOutlet weak var designationLbl: UILabel!
        @IBOutlet weak var checkBtn: UIButton!
        @IBOutlet weak var notDicslosedLbl: UILabel!
        @IBOutlet weak var containerView: UIView!
        @IBOutlet weak var experienceLbl: UILabel!
        @IBOutlet weak var cityLbl: UILabel!
        @IBOutlet weak var postedByWithDateLbl: UILabel!
        @IBOutlet weak var verifyImg: UIImageView!
        @IBOutlet weak var candidateName: UILabel!
        @IBOutlet weak var appliedOnLbl: UILabel!
        
        var responseChecked = false
        
        
        @IBAction func checkPressed(_ sender: UIButton) {
            responseChecked = !responseChecked
            if responseChecked == true{
                checkBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                checkBtn.setImage(UIImage(named: "uncheck"), for: .normal)
                
            }
        }
    }
