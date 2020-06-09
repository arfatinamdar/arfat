//
//  SelectionVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 26/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class SelectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    var isFrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
               let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

               let gradientLayer = CAGradientLayer()
               
               //gradientLayer.frame = self.loginBtn.bounds
               gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
                   
               gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
               gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
               gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
               gradientLayer.cornerRadius = saveBtn.frame.height/2
               self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2

        if isFrom == "selectJobsAutofillTF"{
            headerLbl.text = "Select Jobs to Autofill"
        }else if isFrom == "shiftTF"{
            headerLbl.text = "Select Shift"
        }else if isFrom == "specifyUG"{
            headerLbl.text = "Specify UG Qualification"
        }else if isFrom == "UGSpecification"{
            headerLbl.text = "Specifications of UG"
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "SearchTableView")
        cell.textLabel?.text = "Arfat"
        return cell
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if isFrom == "selectJobsAutofillTF"{
            
        }else if isFrom == "shiftTF"{
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostAJob2VC") as! PostAJob2VC
        present(vc, animated: true, completion: nil)
        }else if isFrom == "specifyUG"{
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectionVC") as! SelectionVC
            vc.isFrom = "UGSpecification"
        present(vc, animated: true, completion: nil)
        }else if isFrom == "UGSpecification"{
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "DesiredCandidateSpecification2VC") as! DesiredCandidateSpecification2VC
                vc.isFrom = "UGSpecification"
        present(vc, animated: true, completion: nil)
        }
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
