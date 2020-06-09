//
//  DrawerVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 11/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class DrawerVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    
  override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    @IBAction func drawerBtnsPressed(_ sender: UIButton) {
        //tag companies0, job alerts1, subscription status2, saved jobs3, pricing plan4, about us5 and setting6
        if sender.tag == 0{
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompaniesDrawerVC") as! CompaniesDrawerVC
        present(vc, animated: true, completion: nil)
        }
        if sender.tag == 1{
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AddJobAlert") as! AddJobAlert
        present(vc, animated: true, completion: nil)
        }
        if sender.tag == 3{
               let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "SavedJobsVC") as! SavedJobsVC
               present(vc, animated: true, completion: nil)
               }
        if sender.tag == 4{
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "PricingPlanVC") as! PricingPlanVC
        present(vc, animated: true, completion: nil)
        }
        if sender.tag == 5{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutUsTCPrivacyPolicyVC") as! AboutUsTCPrivacyPolicyVC
        present(vc, animated: true, completion: nil)
        }
        if sender.tag == 6{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            present(vc, animated: true, completion: nil)
        }
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
