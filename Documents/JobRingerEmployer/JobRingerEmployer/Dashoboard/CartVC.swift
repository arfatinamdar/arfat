//
//  CartVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 27/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var cartTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var proceedToCheckoutBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ScrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var subtotalLbl: UILabel!
    @IBOutlet weak var taxLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    var jobSeekerServiceSelected = ""
    var portalArr:[NSArray] = [["Status-Active","10 days","Rs. 20","Rs. 10","20% off"],["Featured Resume","1 day","Rs. 200","Rs. 100","20% off"],["Star Applicant","1 day","Rs. 200","Rs. 100","20% off"],["Jobling","1 day","Rs. 200","Rs. 100","20% off"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proceedToCheckoutBtn.layer.cornerRadius = proceedToCheckoutBtn.frame.height/2
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = proceedToCheckoutBtn.frame.height/2
        self.proceedToCheckoutBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        ScrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portalArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.containerView.layer.shadowRadius = 2
        cell.containerView.layer.shadowColor = UIColor.gray.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.cornerRadius = 10
        cell.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.deleteBtn.tag = indexPath.row
        cell.packageNameLbl.text = portalArr[indexPath.row][0] as? String
        cell.forDaysLbl.text = portalArr[indexPath.row][1] as? String
        cell.cutPriceLbl.text = portalArr[indexPath.row][2] as? String
        cell.priceLbl.text = portalArr[indexPath.row][3] as? String
        cell.offInPercentageLbl.text = portalArr[indexPath.row][3] as? String
        cell.bottomLbl.text = "1 Job Posting"
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        cartTableViewHeight.constant = CGFloat(portalArr.count * 180)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func proceedToCheckoutPressed(_ sender: UIButton) {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func cartClosePressed(_ sender: UIButton) {
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "Do you want to delete this record?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            
            self.portalArr.remove(at: sender.tag)
            self.cartTableView.reloadData()
    
        })
                  
                  
                  let cancel = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
                      print("NO button tapped")
                  }
                  
                  //Add OK and Cancel button to dialog message
                  dialogMessagedeletdirect.addAction(ok)
                  dialogMessagedeletdirect.addAction(cancel)
                  
                  // Present dialog message to user
                  self.present(dialogMessagedeletdirect, animated: true, completion: nil)
              }
    
}
class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var packageNumberLbl: UILabel!
    @IBOutlet weak var packageNameLbl: UILabel!
    @IBOutlet weak var cutPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var offInPercentageLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var forDaysLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var bottomLbl: UILabel!
}
