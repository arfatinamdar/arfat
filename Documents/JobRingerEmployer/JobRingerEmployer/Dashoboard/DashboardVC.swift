//
//  DashboardVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 09/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class DashboardVC:UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var designationLbl: UILabel!
    @IBOutlet weak var profileCompletionLbl: UILabel!
    @IBOutlet weak var profileProgressBar: UIProgressView!
    @IBOutlet weak var isGeniunUserImg: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var barBtnView: UIView!
    @IBOutlet weak var presentView: UIView!
    @IBOutlet weak var strip1: UIView!
    @IBOutlet weak var strip2: UIView!
    @IBOutlet weak var strip3: UIView!
    @IBOutlet weak var strip4: UIView!
    @IBOutlet weak var strip5: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var presentViewHeight: NSLayoutConstraint!
    
    
    var RecommendedJobsVC: UIViewController!
    var HomeVC: UIViewController!
    var selectedIndex = 0
    var percent = 0
    //var viewControllers = [UIViewController]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileCompletionLbl.text = "Profile Completion - \(percent)%"
        profileName.text = "Arfat Inamdar"
        isGeniunUserImg.image = UIImage(named: "Profile-checkmark")
        designationLbl.text = "iOS Developer in Innovins Softech Pvt Ltd"
        profileImg.image = UIImage(named: "abdul")
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        let leftColor = UIColor(red: (42/255.0), green: (77/255.0), blue:(246/255.0), alpha: 1)
        let rightColor = UIColor(red: (93/255.0), green: (72/255.0), blue:(246/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 220)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.profileView.layer.insertSublayer(gradientLayer, at: 0)
        
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        scrollView.isScrollEnabled = true
        //self.presentViewHeight.constant = vc.view.intrinsicContentSize.height
        self.addChild(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: self.presentView.frame.size.width, height: self.presentView.frame.size.height);
        presentViewHeight.constant = vc.view.frame.height
        scrollView.isScrollEnabled = true
        presentViewHeight.constant = vc.view.intrinsicContentSize.height
        presentView.frame = vc.view.bounds
        self.presentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        strip1.isHidden = false
        btn1.tintColor = UIColor.blue
        strip2.isHidden = true
        strip3.isHidden = true
        strip4.isHidden = true
        strip5.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    //    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    //
    //
    //         let child1 = UIStoryboard.init(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    //        strip1.isHidden = false
    //        strip2.isHidden = true
    //        strip3.isHidden = true
    //        strip4.isHidden = true
    //        strip5.isHidden = true
    //
    //        //child1.childNumber1 = "One"
    //
    //         let child2 = UIStoryboard.init(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "RecommendedJobsVC") as! RecommendedJobsVC
    //        strip1.isHidden = true
    //        strip2.isHidden = false
    //        strip3.isHidden = true
    //        strip4.isHidden = true
    //        strip5.isHidden = true
    
    //child2.childNumber1 = "Two"
    //presentView.inputViewController = RecommendedJobsVC
    //        let child3 = UIStoryboard.init(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ApplicationStatusVC") as! ApplicationStatusVC
    //        strip1.isHidden = true
    //        strip2.isHidden = true
    //        strip3.isHidden = false
    //        strip4.isHidden = true
    //        strip5.isHidden = true
    //
    //
    //        let child4 = UIStoryboard.init(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AboutCandidateVC") as! AboutCandidateVC
    //        strip1.isHidden = true
    //        strip2.isHidden = true
    //        strip3.isHidden = true
    //        strip4.isHidden = false
    //        strip5.isHidden = true
    //
    //
    //        let child5 = UIStoryboard.init(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DrawerVC") as! DrawerVC
    //        strip1.isHidden = true
    //        strip2.isHidden = true
    //        strip3.isHidden = true
    //        strip4.isHidden = true
    //        strip5.isHidden = false
    
    
    //         return [child1, child2]
    //    }
    //
    //    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    //           return IndicatorInfo(title: "check")
    //       }
    
    
    
    @IBAction func barBtnPressed(_ sender: UIButton) {
        if sender.tag == 0{
            if strip1.isHidden == true{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            UIView.transition(with: presentView,
                              duration: 0.5,
                              options: [.transitionFlipFromRight],
                              animations: {
                                
                               // self.goldenView.isHidden = true
            },
                              completion: nil)
            scrollViewHeight.constant = vc.view.intrinsicContentSize.height
            self.addChild(vc)
            vc.view.frame = CGRect(x: 0, y: 0, width: self.presentView.frame.size.width, height: self.presentView.frame.size.height);
            presentViewHeight.constant = vc.view.frame.height
            self.presentView.addSubview(vc.view)
            vc.didMove(toParent: self)
            strip1.isHidden = false
            strip2.isHidden = true
            strip3.isHidden = true
            strip4.isHidden = true
            strip5.isHidden = true
            }
        }
        if sender.tag == 1{
            if strip2.isHidden == true{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "RecommendedJobsVC") as! RecommendedJobsVC
            UIView.transition(with: presentView,
                              duration: 0.5,
                              options: [.transitionCrossDissolve],
                              animations: {
                                
                               // self.goldenView.isHidden = true
            },
                              completion: nil)
            scrollViewHeight.constant = vc.view.intrinsicContentSize.height
            self.addChild(vc)
            scrollViewHeight.constant = vc.view.intrinsicContentSize.height
            vc.view.frame = CGRect(x: 0, y: 0, width: self.presentView.frame.size.width, height: self.presentView.frame.size.height);
            self.presentView.addSubview(vc.view)
            vc.didMove(toParent: self)
            strip1.isHidden = true
            strip2.isHidden = false
            strip3.isHidden = true
            strip4.isHidden = true
            strip5.isHidden = true
            }
        }
        if sender.tag == 2{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ApplicationStatusVC") as! ApplicationStatusVC
            if strip3.isHidden == true{
            UIView.transition(with: presentView,
                                         duration: 0.5,
                                         options: [.transitionCurlUp, .showHideTransitionViews],
                                         animations: {
                                           
                                          // self.goldenView.isHidden = true
                       },
                                         completion: nil)
             scrollViewHeight.constant = vc.view.intrinsicContentSize.height
            self.addChild(vc)
            vc.view.frame = CGRect(x: 0, y: 0, width: self.presentView.frame.size.width, height: self.presentView.frame.size.height);
            self.presentView.addSubview(vc.view)
            vc.didMove(toParent: self)
            strip1.isHidden = true
            strip2.isHidden = true
            strip3.isHidden = false
            strip4.isHidden = true
            strip5.isHidden = true
            }
        }
        if sender.tag == 3{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AboutCandidateVC") as! AboutCandidateVC
            if strip4.isHidden == true{
            UIView.transition(with: presentView,
                              duration: 0.5,
                              options: [.transitionFlipFromRight],
                              animations: {
                                
                               // self.goldenView.isHidden = true
            },
                              completion: nil)
            
             scrollViewHeight.constant = vc.view.intrinsicContentSize.height
            self.addChild(vc)
            vc.view.frame = CGRect(x: 0, y: 0, width: self.presentView.frame.size.width, height: self.presentView.frame.size.height);
            self.presentView.addSubview(vc.view)
            vc.didMove(toParent: self)
            strip1.isHidden = true
            strip2.isHidden = true
            strip3.isHidden = true
            strip4.isHidden = false
            strip5.isHidden = true
        }
        }
        if sender.tag == 4{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DrawerVC") as! DrawerVC
            if strip5.isHidden == true{
             UIView.transition(with: presentView,
                                         duration: 0.5,
                                         options: [.transitionFlipFromRight],
                                         animations: {
                                           
                                          // self.goldenView.isHidden = true
                       },
                                         completion: nil)
             scrollViewHeight.constant = vc.view.intrinsicContentSize.height
            self.addChild(vc)
            vc.view.frame = CGRect(x: 0, y: 0, width: self.presentView.frame.size.width, height: self.presentView.frame.size.height);
            self.presentView.addSubview(vc.view)
            vc.didMove(toParent: self)
            strip1.isHidden = true
            strip2.isHidden = true
            strip3.isHidden = true
            strip4.isHidden = true
            strip5.isHidden = false
        }
        }
        
    }
    @IBAction func updateProfilePressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "UpdateProfile", bundle: nil).instantiateViewController(withIdentifier: "UpdateProfileMainVC") as! UpdateProfileMainVC
        self.present(vc, animated: true, completion: nil)
        
    }
    /*
     @IBAction func profileUpdatePressed(_ sender: UIButton) {
     }
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
