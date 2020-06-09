//
//  AddContactPerson1VC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 29/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class AddContactPerson1VC: UIViewController {

    @IBOutlet weak var addContactPersonBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContactPersonBtn.layer.cornerRadius = addContactPersonBtn.frame.height/2
        addContactPersonBtn.layer.borderWidth = 1
        addContactPersonBtn.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addContactPersonPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "AddContactPerson2VC") as! AddContactPerson2VC
        present(vc, animated: true, completion: nil)
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
