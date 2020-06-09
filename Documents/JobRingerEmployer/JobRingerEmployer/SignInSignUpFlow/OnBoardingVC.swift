//
//  ViewController.swift
//  JobRingerEmployee
//
//  Created by MAC on 27/02/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit

class OnBoardingVC: UIViewController {
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        loginBtn.layer.borderWidth = 1.0
        loginBtn.layer.borderColor = UIColor.blue.cgColor
        
        registerBtn.layer.cornerRadius = loginBtn.frame.height/2
        registerBtn.layer.borderWidth = 1.0
        registerBtn.layer.borderColor = UIColor.blue.cgColor
        
        searchBtn.layer.cornerRadius = searchBtn.frame.height/2
        searchBtn.layer.borderWidth = 1.0
        searchBtn.layer.borderColor = UIColor.darkGray.cgColor
        searchBtn.titleLabel?.textColor = UIColor.darkGray
       let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: (view.frame.width/2)-30, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = loginBtn.frame.height/2
        self.loginBtn.layer.insertSublayer(gradientLayer, at: 0)
        
     /*let gradient = CAGradientLayer()
     gradient.frame =  CGRect(origin: .zero, size: loginBtn.frame.size)
     gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
    // let shape = CAShapeLayer()
     //shape.lineWidth = 2
    // shape.path = UIBezierPath(rect: loginBtn.bounds).cgPath
     //shape.strokeColor = UIColor.black.cgColor
     //shape.fillColor = UIColor.clear.cgColor
     //gradient.mask = shape
     loginBtn.layer.addSublayer(gradient)*/
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
        present(vc, animated: true, completion: nil)

    }
    @IBAction func registerPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterFirst") as! RegisterFirst
        present(vc, animated: true, completion: nil)
    }
    @IBAction func searchPressed(_ sender: UIButton) {
    }
}
