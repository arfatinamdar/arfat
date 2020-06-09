//
//  SavedSearchesVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 15/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

var savedSearchesCheck = false

class SavedSearchesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var savedSearchesTableView: UITableView!
    
    var savedSearchesDict:[NSDictionary] = [["jobField": "iOS Developer", "referenceCode": "#0002234", "date": "04/06/2020", "byCompanyNameSoftware": "by Hindcor0@gmail.com"],["jobField": "iOS Developer", "referenceCode": "#0002234", "date": "04/06/2020", "byCompanyNameSoftware": "by Hindcor0@gmail.com"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedSearchesDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SevedSearchesTableViewCell") as! SevedSearchesTableViewCell
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.selectionStyle = .none
        cell.searchBtn.layer.borderWidth = 1
        cell.searchBtn.layer.borderColor = UIColor.black.cgColor
        cell.searchBtn.layer.cornerRadius = cell.searchBtn.frame.height/2
        cell.jobFieldLbl.text = savedSearchesDict[indexPath.row].value(forKey: "jobField") as? String
        cell.referenceCodeLbl.text = savedSearchesDict[indexPath.row].value(forKey: "referenceCode") as? String
        cell.dateLbl.text = savedSearchesDict[indexPath.row].value(forKey: "date") as? String
        cell.byCompanyNameSoftwareLbl.text = savedSearchesDict[indexPath.row].value(forKey: "byCompanyNameSoftware") as? String
        tableView.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "Do you want to remove the selected searches?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            
            for _ in 0..<self.savedSearchesDict.count{
                if manageSubUsersCheck == true{
                self.savedSearchesDict.remove(at: sender.tag)
                }
            }
            self.savedSearchesTableView.reloadData()
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
  
    @IBAction func cellSearchPressed(_ sender: UIButton) {
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
    }
    
}
class SevedSearchesTableViewCell: UITableViewCell {
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var jobFieldLbl: UILabel!
    @IBOutlet weak var referenceCodeLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var byCompanyNameSoftwareLbl: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    @IBAction func checkImg(_ sender: Any) {
        savedSearchesCheck = !savedSearchesCheck
        if savedSearchesCheck == true{
            checkImg.image = UIImage(named: "check")
        }else{
            checkImg.image = UIImage(named: "uncheck")
        }
    }
}
