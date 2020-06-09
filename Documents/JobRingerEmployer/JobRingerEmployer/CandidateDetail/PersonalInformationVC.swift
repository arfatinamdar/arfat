//
//  PersonalInformationVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 02/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class PersonalInformationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var personalInfoTableView: UITableView!
    @IBOutlet weak var personalInfoTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var languageKnownTableView: UITableView!
    @IBOutlet weak var languageKnownTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var personalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        personalView.layer.cornerRadius = 10
        personalView.layer.shadowRadius = 2
        personalView.layer.shadowColor = UIColor.gray.cgColor
        personalView.layer.shadowOpacity = 0.5
        personalView.layer.shadowOffset = CGSize(width: -1, height: 1)
        scrollViewHeight.constant = view.intrinsicContentSize.height/2
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == personalInfoTableView{
            let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "personalInfoTableViewCell")
            cell.textLabel?.textColor = UIColor.gray
            cell.textLabel?.font = UIFont(name: "system", size: 17)
            cell.detailTextLabel?.font = UIFont(name: "system", size: 20)
            cell.textLabel?.text = "Name"
            cell.detailTextLabel?.text = "Arfat Inamdar"
            personalInfoTableViewHeight.constant = 5 * 80
            return cell
            
        }else{
            
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "languageKnownTableViewCell")
        cell.textLabel?.textColor = UIColor.gray
        cell.textLabel?.font = UIFont(name: "system", size: 17)
        cell.detailTextLabel?.font = UIFont(name: "system", size: 20)
        cell.textLabel?.text = "English"
        cell.detailTextLabel?.text = "Read,Write,Proficient"
        languageKnownTableViewHeight.constant = 5 * 80
        return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "CandidateDetail", bundle: nil).instantiateViewController(withIdentifier: "ProfileEducationDetailVC") as! ProfileEducationDetailVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: Any) {
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
