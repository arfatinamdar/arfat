//
//  SettingVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 19/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var settingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView.layer.cornerRadius = 10
        settingView.layer.shadowRadius = 5
        settingView.layer.shadowColor = UIColor.gray.cgColor
        settingView.layer.shadowOpacity = 0.5

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TAndCPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AboutUsTCPrivacyPolicyVC") as! AboutUsTCPrivacyPolicyVC
        vc.isFrom = "Terms & Conditions"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func privacyPolicyPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AboutUsTCPrivacyPolicyVC") as! AboutUsTCPrivacyPolicyVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func contactPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
        present(vc, animated: true, completion: nil)
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logOutPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Confirm", message: "do you want to Logout?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "YES", style: .destructive, handler: { (action) -> Void in
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
            self.present(vc, animated: true, completion: nil)
        })
        
        let cancel = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
        }
        
        //Add OK and Cancel button to dialog message
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // Present dialog message to user
        self.present(alert, animated: true, completion: nil)
        
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
