//
//  ManageSubUsersVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 18/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

var manageSubUsersCheck = false
class ManageSubUsersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var manageSubUsersTableView: UITableView!
    
    var subUsersArr = ["hindco_r0","innovins","hindco_r0","innovins","hindco_r0","innovins","hindco_r0","innovins","hindco_r0","innovins"]
    var subUsersDict:NSDictionary = ["hindco_r0":"resume@hindco.com","innovins":"resume@innivins.com","hindco_r0":"resume@hindco.com","innovins":"resume@innivins.com","hindco_r0":"resume@hindco.com","innovins":"resume@innivins.com","hindco_r0":"resume@hindco.com","innovins":"resume@innivins.com","hindco_r0":"resume@hindco.com","innovins":"resume@innivins.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subUsersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageSubUsersTableViewCell", for: indexPath) as! ManageSubUsersTableViewCell
        cell.selectionStyle = .none
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.companyNameLbl.text = subUsersArr[indexPath.row]
        cell.companyEmailIdLbl.text = subUsersDict.value(forKey: subUsersArr[indexPath.row]) as? String
        cell.checkBtn.tag = indexPath.row
        tableView.separatorStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "SubUserDetailVC") as! SubUserDetailVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "Do you want to remove the selected Users?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            
            for _ in 0..<self.subUsersArr.count{
                if manageSubUsersCheck == true{
                self.subUsersArr.remove(at: sender.tag)
                }
            }
            self.manageSubUsersTableView.reloadData()
        })
        
        
        let cancel = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessagedeletdirect.addAction(ok)
        dialogMessagedeletdirect.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessagedeletdirect, animated: true, completion: nil)
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
    @IBAction func editPressed(_ sender: UIButton) {
    }
    
}
class ManageSubUsersTableViewCell: UITableViewCell {
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var companyEmailIdLbl: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var checkImg: UIImageView!
    @IBAction func checkPressed(_ sender: UIButton) {
        manageSubUsersCheck = !manageSubUsersCheck
        if manageSubUsersCheck == true{
            checkImg.image = UIImage(named: "check")
        }else{
            checkImg.image = UIImage(named: "uncheck")
        }
    }
}
