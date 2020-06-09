//
//  SubUserDetailVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 04/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class SubUserDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var companyProfileImg: UIImageView!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var companyEmailLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var permissionsTableView: UITableView!
    @IBOutlet weak var permissionsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var companyNameView: UIView!
    @IBOutlet weak var permissionsView: UIView!
    
    var permissionsArr = ["Job Posting", "Manage / Post Job", "Saved Searches", "Manage Candidate", "Search", "Company Profile", "Subscription", "Discount & Offer", "Subscription History"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyNameView.layer.cornerRadius = 10
        companyNameView.layer.shadowRadius = 2
        companyNameView.layer.shadowColor = UIColor.gray.cgColor
        companyNameView.layer.shadowOpacity = 0.5
        companyNameView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        permissionsView.layer.cornerRadius = 10
        permissionsView.layer.shadowRadius = 2
        permissionsView.layer.shadowColor = UIColor.gray.cgColor
        permissionsView.layer.shadowOpacity = 0.5
        permissionsView.layer.shadowOffset = CGSize(width: -1, height: 1)

        scrollViewHeight.constant = view.intrinsicContentSize.height/2
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissionsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "PermissionsTableViewCell")
        cell.textLabel?.text = permissionsArr[indexPath.row]
        cell.selectionStyle = .none
        permissionsTableViewHeight.constant = CGFloat(permissionsArr.count * 50)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = permissionsTableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType == .checkmark{
        cell.accessoryType = .none
             }else{
        cell.accessoryType = .checkmark
             }
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
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
class PermissionsTableViewCell: UITableViewCell {
    
}
