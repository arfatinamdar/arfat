//
//  RegisterSecond.swift
//  JobRingerEmployee
//
//  Created by MAC on 28/02/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class QuickSearchVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var allCandidatesImg: UIImageView!
    @IBOutlet weak var inactiveImg: UIImageView!
    @IBOutlet weak var activeImg: UIImageView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var hiringForTF: MDCTextField!
    @IBOutlet weak var keywordsTF: MDCTextField!
    @IBOutlet weak var focusKeywordsTF: MDCTextField!
    @IBOutlet weak var eliminateKeywordsTF: MDCTextField!
    @IBOutlet weak var industryTF: MDCTextField!
    @IBOutlet weak var functionalAreaTF: MDCTextField!
    @IBOutlet weak var roleTF: MDCTextField!
    @IBOutlet weak var experinceTF: MDCTextField!
    @IBOutlet weak var expMinTF: MDCTextField!
    @IBOutlet weak var salaryPerAnnumTF: MDCTextField!
    @IBOutlet weak var expMaxTF: MDCTextField!
    @IBOutlet weak var expInCurrentLastCompanyTF: MDCTextField!
    @IBOutlet weak var selectCTCTF: MDCTextField!
    @IBOutlet weak var currencyTF: MDCTextField!
    @IBOutlet weak var salaryFromTF: MDCTextField!
    @IBOutlet weak var salaryToTF: MDCTextField!
    @IBOutlet weak var locationTF: MDCTextField!
    @IBOutlet weak var searchWithinKmRangeTF: MDCTextField!
    @IBOutlet weak var lastActiveTF: MDCTextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    var hiringForController: MDCTextInputControllerOutlined!
    var keywordsController: MDCTextInputControllerOutlined!
    var focusKeywordsController: MDCTextInputControllerOutlined!
    var eliminateKeywordsController: MDCTextInputControllerOutlined!
    var industryController: MDCTextInputControllerOutlined!
    var functionalAreaController: MDCTextInputControllerOutlined!
    var roleController: MDCTextInputControllerOutlined!
    var experinceController: MDCTextInputControllerOutlined!
    var salaryPerAnnumController: MDCTextInputControllerOutlined!
    var currencyController: MDCTextInputControllerOutlined!
    var expMinController: MDCTextInputControllerOutlined!
    var expMaxController: MDCTextInputControllerOutlined!
    var expInCurrentLastCompanyController: MDCTextInputControllerOutlined!
    var selectCTCController: MDCTextInputControllerOutlined!
    var salaryFromController: MDCTextInputControllerOutlined!
    var salaryToController: MDCTextInputControllerOutlined!
    var locationController: MDCTextInputControllerOutlined!
    var searchWithinKmRangeController: MDCTextInputControllerOutlined!
    var lastActiveController: MDCTextInputControllerOutlined!

    let datePicker = UIDatePicker()
    var hideDOBFromEmployer = false
    var isDiferntlyAbled = false
    var active = false
    var inactive = false
    var allCandidates = false
    var candidateStatus = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        if active == true{
            candidateStatus = "Male"
        }
        if inactive == true{
            candidateStatus = "Female"
        }
        if allCandidates == true{
            candidateStatus = "Other"
        }
        searchBtn.layer.cornerRadius = searchBtn.frame.height/2
        self.hiringForController = MDCTextInputControllerOutlined(textInput: self.hiringForTF)
        self.keywordsController = MDCTextInputControllerOutlined(textInput: self.keywordsTF)
        self.focusKeywordsController = MDCTextInputControllerOutlined(textInput: self.focusKeywordsTF)
        self.eliminateKeywordsController = MDCTextInputControllerOutlined(textInput: self.eliminateKeywordsTF)
        self.industryController = MDCTextInputControllerOutlined(textInput: self.industryTF)
        self.functionalAreaController = MDCTextInputControllerOutlined(textInput: self.functionalAreaTF)
        self.roleController = MDCTextInputControllerOutlined(textInput: self.roleTF)
        self.experinceController = MDCTextInputControllerOutlined(textInput: self.experinceTF)
        self.expMinController = MDCTextInputControllerOutlined(textInput: self.expMinTF)
        self.expMaxController = MDCTextInputControllerOutlined(textInput: self.expMaxTF)
        self.expInCurrentLastCompanyController = MDCTextInputControllerOutlined(textInput: self.expInCurrentLastCompanyTF)
        self.selectCTCController = MDCTextInputControllerOutlined(textInput: self.selectCTCTF)
        self.salaryFromController = MDCTextInputControllerOutlined(textInput: self.salaryFromTF)
        self.salaryToController = MDCTextInputControllerOutlined(textInput: self.salaryToTF)
        self.locationController = MDCTextInputControllerOutlined(textInput: self.locationTF)
        self.searchWithinKmRangeController = MDCTextInputControllerOutlined(textInput: self.searchWithinKmRangeTF)
        self.lastActiveController = MDCTextInputControllerOutlined(textInput: self.lastActiveTF)
        self.currencyController = MDCTextInputControllerOutlined(textInput: self.currencyTF)
        self.salaryPerAnnumController = MDCTextInputControllerOutlined(textInput: self.salaryPerAnnumTF)

        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        //gradientLayer.frame = self.loginBtn.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = searchBtn.frame.height/2
        self.searchBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
    }
     @objc func handleTap(_ sender: UITapGestureRecognizer) {
        hiringForTF.resignFirstResponder()
        keywordsTF.resignFirstResponder()
        focusKeywordsTF.resignFirstResponder()
        eliminateKeywordsTF.resignFirstResponder()
        industryTF.resignFirstResponder()
        functionalAreaTF.resignFirstResponder()
        roleTF.resignFirstResponder()
        experinceTF.resignFirstResponder()
        expMinTF.resignFirstResponder()
        expMaxTF.resignFirstResponder()
        expInCurrentLastCompanyTF.resignFirstResponder()
        selectCTCTF.resignFirstResponder()
        currencyTF.resignFirstResponder()
        salaryFromTF.resignFirstResponder()
        salaryToTF.resignFirstResponder()
        locationTF.resignFirstResponder()
        searchWithinKmRangeTF.resignFirstResponder()
        lastActiveTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hiringForTF.resignFirstResponder()
        keywordsTF.resignFirstResponder()
        focusKeywordsTF.resignFirstResponder()
        eliminateKeywordsTF.resignFirstResponder()
        industryTF.resignFirstResponder()
        functionalAreaTF.resignFirstResponder()
        roleTF.resignFirstResponder()
        experinceTF.resignFirstResponder()
        expMinTF.resignFirstResponder()
        expMaxTF.resignFirstResponder()
        expInCurrentLastCompanyTF.resignFirstResponder()
        selectCTCTF.resignFirstResponder()
        currencyTF.resignFirstResponder()
        salaryFromTF.resignFirstResponder()
        salaryToTF.resignFirstResponder()
        locationTF.resignFirstResponder()
        searchWithinKmRangeTF.resignFirstResponder()
        lastActiveTF.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = -330
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = 0
        }
    }
    
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func candidateStatus(_ sender: UIButton) {
    //tag is given to active0 inactive1 and all candidates2
        if sender.tag == 0{
            inactive = false
            inactiveImg.image = UIImage(named: "uncheck")
            allCandidates = false
            allCandidatesImg.image = UIImage(named: "uncheck")

            active = !active
            if active == true{
                activeImg.image = UIImage(named: "check")
            }else{
                activeImg.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 1{
            active = false
            activeImg.image = UIImage(named: "uncheck")
            allCandidates = false
            allCandidatesImg.image = UIImage(named: "uncheck")

            inactive = !inactive
            if inactive == true{
                inactiveImg.image = UIImage(named: "check")
            }else{
                inactiveImg.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 2{
            active = false
            activeImg.image = UIImage(named: "uncheck")
            inactive = false
            inactiveImg.image = UIImage(named: "uncheck")

            allCandidates = !allCandidates
            if allCandidates == true{
                allCandidatesImg.image = UIImage(named: "check")
            }else{
                allCandidatesImg.image = UIImage(named: "uncheck")
            }
        }
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        if hiringForTF.text?.count == 0 || keywordsTF.text?.count == 0 || focusKeywordsTF.text?.count == 0 || eliminateKeywordsTF.text?.count == 0 || industryTF.text?.count == 0 || functionalAreaTF.text?.count == 0 || roleTF.text?.count == 0 || experinceTF.text?.count == 0 || expMinTF.text?.count == 0 || expMaxTF.text?.count == 0 || expInCurrentLastCompanyTF.text?.count == 0 || selectCTCTF.text?.count == 0 || currencyTF.text?.count == 0 || salaryPerAnnumTF.text?.count == 0 || salaryFromTF.text?.count == 0 || salaryToTF.text?.count == 0 || locationTF.text?.count == 0 || searchWithinKmRangeTF.text?.count == 0 || lastActiveTF.text?.count == 0{
            customAlert(title: "All the  fields are compulsory", msg: "Please enter all the fields")
        }else{
            struct QuickSearchStruct: Codable {
                let candidateStatus: String
                let hiringFor: String
                let keywords: String
                let focusKeywords: String
                let eliminateKeywords: String
                let industry: String
                let functionalArea: String
                let role: String
                let experience: String
                let expMin: String
                let expMax: String
                let expInCurrentLastJob: String
                let selectCTC: String
                let salaryPerAnnum: String
                let salaryFrom: String
                let salaryTo: String
                let location: String
                let searchWithinKmRange: String
                let lastActive: String
            }

            let quickSearch = QuickSearchStruct(candidateStatus: candidateStatus, hiringFor: hiringForTF.text ?? "", keywords: keywordsTF.text ?? "", focusKeywords: focusKeywordsTF.text ?? "", eliminateKeywords: eliminateKeywordsTF.text ?? "", industry: industryTF.text ?? "", functionalArea: functionalAreaTF.text ?? "", role: roleTF.text ?? "", experience: experinceTF.text ?? "", expMin: expMinTF.text ?? "", expMax: expMaxTF.text ?? "", expInCurrentLastJob: expInCurrentLastCompanyTF.text ?? "", selectCTC: selectCTCTF.text ?? "", salaryPerAnnum: salaryPerAnnumTF.text ?? "", salaryFrom: salaryPerAnnumTF.text ?? "", salaryTo: salaryToTF.text ?? "", location: locationTF.text ?? "", searchWithinKmRange: searchWithinKmRangeTF.text ?? "", lastActive: lastActiveTF.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(quickSearch) else {
                return
            }
            let url = URL(string: "https://example.com/post")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let parameters: [String: Any] = [
                "userid": "",
                "name": ""
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
                if let error = error {
                    print ("error: \(error)")
                    self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
                    return
                }
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) else {
                    print ("server error")
                        self.customAlert(title: "No Internet", msg: "Please check your internet connection as call administrator")
                    return
                }
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("got data: \(dataString)")
                }
            }
            task.resume()
        //let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterThird") as! RegisterThird
        //present(vc, animated: true, completion: nil)
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
