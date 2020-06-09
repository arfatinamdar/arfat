//
//  WorkExperience1VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 02/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class WorkExperience1VC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var expView: UIView!
    @IBOutlet weak var totalExpView: UILabel!
    @IBOutlet weak var empExpLbl: UILabel!
    @IBOutlet weak var internExpLbl: UILabel!
    @IBOutlet weak var WorkExpTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var WorkExpTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expView.layer.cornerRadius = 10
        expView.layer.shadowRadius = 2
        expView.layer.shadowColor = UIColor.gray.cgColor
        expView.layer.shadowOpacity = 0.5
        expView.layer.shadowOffset = CGSize(width: -1, height: 1)
        scrollViewHeight.constant = view.intrinsicContentSize.height/2
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkExpTableViewCell", for: indexPath) as! WorkExpTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        WorkExpTableViewHeight.constant = 5 * 220
        tableView.separatorStyle = .none
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "WorkExperience2VC") as! WorkExperience2VC
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

}
class WorkExpTableViewCell: UITableViewCell {
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var vacanciesForLbl: UILabel!
    @IBOutlet weak var expDateFromToWithExpLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
}
