//
//  ManageJobsVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 15/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class ManageJobsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var activeLbl: UILabel!
    @IBOutlet weak var sortByPopupView: UIView!
    @IBOutlet weak var manageJobsTableView: UITableView!
    @IBOutlet weak var activeBtn: UIButton!
    @IBOutlet weak var inactiveLbl: UILabel!
    @IBOutlet weak var inactiveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        sortByPopupView.addGestureRecognizer(tap)
        sortByPopupView.isHidden = true

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        sortByPopupView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageJobsTableViewCell") as! ManageJobsTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.moreView.isHidden = true
        cell.activeInactiveStatusBtn.layer.cornerRadius = cell.activeInactiveStatusBtn.frame.height/2
        cell.activeInactiveStatusBtn.layer.borderWidth = 1
        cell.activeInactiveStatusBtn.layer.borderColor = UIColor.gray.cgColor
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    @IBAction func sortByPressed(_ sender: UIButton) {
        sortByPopupView.isHidden = false
    }
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func deletePressed(_ sender: UIButton) {
    }
    @IBAction func searchPressed(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func activeInactiveStatusPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func cellDeletePressed(_ sender: UIButton) {
    }
    
}
class ManageJobsTableViewCell: UITableViewCell {
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var jobFieldLbl: UILabel!
    @IBOutlet weak var referenceCodeLbl: UILabel!
    @IBOutlet weak var applicationLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var byCompanyNameSoftwareLbl: UILabel!
    @IBOutlet weak var activeInactiveStatusBtn: UIButton!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBAction func morePressed(_ sender: UIButton) {
        moreView.isHidden = false
    }
}
