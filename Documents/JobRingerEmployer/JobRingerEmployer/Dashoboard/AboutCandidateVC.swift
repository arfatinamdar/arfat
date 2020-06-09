//
//  AboutCandidateVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 11/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class AboutCandidateVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var savedSearchBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedSearchBtn.layer.borderWidth = 1
        savedSearchBtn.layer.borderColor = UIColor.black.cgColor
        savedSearchBtn.layer.cornerRadius = savedSearchBtn.frame.height/2
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        containerView.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    @IBAction func quickSearchPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "QuickSearchVC") as! QuickSearchVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func advancedSearchPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AdvanceSearchVC") as! AdvanceSearchVC
               present(vc, animated: true, completion: nil)
    }
    @IBAction func saveSearchPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "SavedSearchesVC") as! SavedSearchesVC
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
