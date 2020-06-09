//
//  EducationVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 02/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class ProfileEducationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var educationTableView: UITableView!
    @IBOutlet weak var educationTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileAttachmentTableView: UITableView!
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var profileAttachmentTableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attachmentView.layer.cornerRadius = 10
        attachmentView.layer.shadowRadius = 2
        attachmentView.layer.shadowColor = UIColor.gray.cgColor
        attachmentView.layer.shadowOpacity = 0.5
        attachmentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == profileAttachmentTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAttachmentTableViewCell", for: indexPath) as! ProfileAttachmentTableViewCell
            profileAttachmentTableViewHeight.constant = 2 * 80
            return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "EducationTableViewCell", for: indexPath) as! EducationTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        educationTableViewHeight.constant = 2 * 170
        tableView.separatorStyle = .none
        cell.selectionStyle = .none
        return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == profileAttachmentTableView{
            return 80
        }else{
        return 170
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "ProfileEducationDetailVC") as! ProfileEducationDetailVC
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
class EducationTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var batchDateLbl: UILabel!
}
class ProfileAttachmentTableViewCell: UITableViewCell {
    @IBOutlet weak var viewDocLbl: UILabel!
    @IBOutlet weak var docNameLbl: UILabel!
}
