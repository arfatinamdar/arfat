//
//  WorkExperience3VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 03/06/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class WorkExperience3VC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var workExpDetailMoreTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var workExpDetailMoreTableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowRadius = 2
            containerView.layer.shadowColor = UIColor.gray.cgColor
            containerView.layer.shadowOpacity = 0.5
            containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
            scrollViewHeight.constant = view.intrinsicContentSize.height/2
            // Do any additional setup after loading the view.
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return 10
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "WorkExpDetailMoreTableViewCell")
            cell.textLabel?.textColor = UIColor.gray
            cell.textLabel?.font = UIFont(name: "system", size: 17)
            cell.detailTextLabel?.font = UIFont(name: "system", size: 20)
            cell.textLabel?.text = "Name"
            cell.detailTextLabel?.text = "Arfat Inamdar"
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            workExpDetailMoreTableViewHeight.constant = 10 * 80
            return cell
         }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
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
    class WorkExpDetailMoreTableViewCell: UITableViewCell {
        
    }
