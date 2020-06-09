//
//  WorkExperience2VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 03/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class WorkExperience2VC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var wetherCurrentEmpLbl: UILabel!
    @IBOutlet weak var fromToDateWithExpLbl: UILabel!
    @IBOutlet weak var businessHouseLbl: UILabel!
    @IBOutlet weak var industryLbl: UILabel!
    @IBOutlet weak var businessUnitLbl: UILabel!
    @IBOutlet weak var brandsProductsLbl: UILabel!
    @IBOutlet weak var expDetailsLessTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var expDetailsLessTableView: UITableView!
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var attachmentTableView: UITableView!
    @IBOutlet weak var attachmentTableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attachmentView.layer.cornerRadius = 10
        attachmentView.layer.shadowColor = UIColor.gray.cgColor
        attachmentView.layer.shadowRadius = 2
        attachmentView.layer.shadowOpacity = 0.5
        attachmentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == expDetailsLessTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpDetailsLessTableViewCell", for: indexPath) as! ExpDetailsLessTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.viewAllBtn.tag = indexPath.row
        expDetailsLessTableViewHeight.constant = 2 * 420
        tableView.separatorStyle = .none
        cell.selectionStyle = .none
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentTableViewCell", for: indexPath) as! AttachmentTableViewCell
            attachmentTableViewHeight.constant = 2 * 100
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == expDetailsLessTableView{
        return 420
        }else{
            return 100
        }
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
    @IBAction func cellViewAllPressed(_ sender: UIButton) {
        // viewAllBtn tagged
        let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "WorkExperience3VC") as! WorkExperience3VC
        present(vc, animated: true, completion: nil)
    }
    
}
class ExpDetailsLessTableViewCell: UITableViewCell {
    @IBOutlet weak var expPeriodLbl: UILabel!
    @IBOutlet weak var currentPreviousDesignationLbl: UILabel!
    @IBOutlet weak var empTypeLbl: UILabel!
    @IBOutlet weak var jobTypeLbl: UILabel!
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var viewAllBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
}
class AttachmentTableViewCell: UITableViewCell {
    @IBOutlet weak var viewDocLbl: UILabel!
    @IBOutlet weak var docNameLbl: UILabel!
}
