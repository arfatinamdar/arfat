//
//  FullDatabaseVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 20/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

var fullDatabaseCheck = false

class FullDatabaseVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var fullDatabaseTableView: UITableView!
    
    var isFrom = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFrom == "SubscriptionVC"{
         return 1
        }else{
            return 10
        }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FullDatabaseTableViewCell", for: indexPath) as! FullDatabaseTableViewCell
        
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "PackageDetailsVC") as! PackageDetailsVC
        //present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cartPressed(_ sender: Any) {
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
class FullDatabaseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var transactionIdLbl: UILabel!
    @IBOutlet weak var transactionDateLbl: UILabel!
    @IBOutlet weak var cutPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var percentageOffLbl: UILabel!
    @IBOutlet weak var activeExpiredLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var noOFResumeDownloadsLbl: UILabel!
    @IBOutlet weak var daysUnlimitedLbl: UILabel!
    @IBOutlet weak var allIndiaFullDayLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBAction func checkPressed(_ sender: UIButton) {
        fullDatabaseCheck = !fullDatabaseCheck
        if fullDatabaseCheck == true{
         checkBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                checkBtn.setImage(UIImage(named: "check"), for: .normal)
            }
    }
}
