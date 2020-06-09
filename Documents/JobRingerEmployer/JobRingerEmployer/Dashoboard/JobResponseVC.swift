//
//  JobResponseVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 12/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class JobResponseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var jobResponseTableView: UITableView!
    
    var jobResponseDict: [NSDictionary] = [["designation": "iOS Developer", "companyName": "Innovins Softech Pvt Ltd", "city": "Mumbai", "postedOn":"june 3, 2020"],["designation": "iOS Developer", "companyName": "Innovins Softech Pvt Ltd", "city": "Mumbai", "postedOn":"june 3, 2020"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobResponseTableViewCell") as! JobResponseTableViewCell
        tableView.separatorStyle = .none
        cell.selectionStyle = .none
        cell.containerView.layer.cornerRadius = 10
                   cell.containerView.layer.shadowRadius = 2
                   cell.containerView.layer.shadowColor = UIColor.gray.cgColor
                   cell.containerView.layer.shadowOpacity = 0.5
                   cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.designationLbl.text = jobResponseDict[indexPath.item].value(forKey: "designation") as? String
        cell.companyNameLbl.text = jobResponseDict[indexPath.item].value(forKey: "companyName") as? String
        cell.responseLbl.text = "4"
        cell.postedOnLbl.text = "Posted On, " + "\(jobResponseDict[indexPath.item].value(forKey: "postedOn") as! String)"
        cell.responseView.layer.cornerRadius = cell.responseView.frame.height/2
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "JobResponseListingVC") as! JobResponseListingVC
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
class JobResponseTableViewCell: UITableViewCell {
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var postedOnLbl: UILabel!
    @IBOutlet weak var responseLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var responseView: UIView!
}
