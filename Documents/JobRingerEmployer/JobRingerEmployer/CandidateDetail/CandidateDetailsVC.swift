//
//  CandidateDetailsVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 18/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class CandidateDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var candidateDetailView: UIView!
    @IBOutlet weak var expView: UIView!
    @IBOutlet weak var totalExpLbl: UILabel!
    @IBOutlet weak var empExpLbl: UILabel!
    @IBOutlet weak var internExpLbl: UILabel!
    @IBOutlet weak var currentSalaryLbl: UILabel!
    @IBOutlet weak var noticePeriodLbl: UILabel!
    @IBOutlet weak var buyOutLbl: UILabel!
    @IBOutlet weak var candidateInfoTableView: UITableView!
    @IBOutlet weak var candidateDetailTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var expViewHeight: NSLayoutConstraint!
    var textLblArr = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateDetailView.layer.cornerRadius = 10
               candidateDetailView.layer.shadowColor = UIColor.gray.cgColor
               candidateDetailView.layer.shadowRadius = 2
               candidateDetailView.layer.shadowOpacity = 0.5
               candidateDetailView.layer.shadowOffset = CGSize(width: -1, height: 1)
        expView.layer.cornerRadius = 10
        expView.layer.shadowColor = UIColor.gray.cgColor
        expView.layer.shadowRadius = 2
        expView.layer.shadowOpacity = 0.5
        expView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        textLblArr = ["I am","Current Payroll","Current Industry","Preferred Industry","Functional Area","Job Role","Current Location","Preferred Location","Keywords for job search/Profile","Techno-Functional Skills"]
        
        scrollViewHeight.constant = view.intrinsicContentSize.height

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textLblArr.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CandidateDetailsTableViewCell", for: indexPath) as! CandidateDetailsTableViewCell
        cell.textLbl.text = textLblArr[indexPath.row] as? String
        
        candidateDetailTableViewHeight.constant = CGFloat(textLblArr.count * 80)
        
        return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
class CandidateDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var detailedTextLbl: UILabel!
}
