//
//  RegisterEmploymentThirdVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 05/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents
import CoreLocation

class RegisterSecondVC: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var companyTypeTF: MDCTextField!
    @IBOutlet weak var categorizationOfEnterpricesTF: MDCTextField!
    @IBOutlet weak var businessHouseTF: MDCTextField!
    @IBOutlet weak var officeTypeTF: MDCTextField!
    @IBOutlet weak var employeeStrengthTF: MDCTextField!
    @IBOutlet weak var GSTYesImg: UIImageView!
    @IBOutlet weak var GSTNoImg: UIImageView!
    @IBOutlet weak var locateMeView: UIView!
    @IBOutlet weak var GSTNoTF: MDCTextField!
    @IBOutlet weak var PANNoTF: MDCTextField!
    @IBOutlet weak var companyNameAsPerGSTTF: MDCTextField!
    @IBOutlet weak var countryTF: MDCTextField!
    @IBOutlet weak var cityTF: MDCTextField!
    @IBOutlet weak var localityTF: MDCTextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var companyTypeController: MDCTextInputControllerOutlined!
    var categorizationOfEnterpricesController: MDCTextInputControllerOutlined!
    var businessHouseController: MDCTextInputControllerOutlined!
    var officeTypeController: MDCTextInputControllerOutlined!
    var employeeStrengthController: MDCTextInputControllerOutlined!
    var GSTNoController: MDCTextInputControllerOutlined!
    var PANNoController: MDCTextInputControllerOutlined!
    var companyNameAsPerGSTController: MDCTextInputControllerOutlined!
    var countryController: MDCTextInputControllerOutlined!
    var cityController: MDCTextInputControllerOutlined!
    var localityController: MDCTextInputControllerOutlined!
    let datePicker = UIDatePicker()
    var GSTYes = false
    var GSTNo = false
    var fromVC = ""
    var locationManager:CLLocationManager!


    override func viewDidLoad() {
        super.viewDidLoad()
        locateMeView.layer.cornerRadius = locateMeView.frame.height/2
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        myView.addGestureRecognizer(tap)
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2

        scrollViewHeight.constant = (50 * 13)
        
        self.companyTypeController = MDCTextInputControllerOutlined(textInput: companyTypeTF)
        self.categorizationOfEnterpricesController = MDCTextInputControllerOutlined(textInput: categorizationOfEnterpricesTF)
        self.businessHouseController = MDCTextInputControllerOutlined(textInput: businessHouseTF)
        self.businessHouseController = MDCTextInputControllerOutlined(textInput: businessHouseTF)
        self.officeTypeController = MDCTextInputControllerOutlined(textInput: officeTypeTF)
        self.employeeStrengthController = MDCTextInputControllerOutlined(textInput: employeeStrengthTF)
        self.GSTNoController = MDCTextInputControllerOutlined(textInput: GSTNoTF)
        self.PANNoController = MDCTextInputControllerOutlined(textInput: PANNoTF)
        self.companyNameAsPerGSTController = MDCTextInputControllerOutlined(textInput: companyNameAsPerGSTTF)
        self.countryController = MDCTextInputControllerOutlined(textInput: countryTF)
        self.cityController = MDCTextInputControllerOutlined(textInput: cityTF)
        self.localityController = MDCTextInputControllerOutlined(textInput: localityTF)
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        scrollViewHeight.constant = scrollView.contentSize.height + 1000
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
       // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        let address = CLGeocoder.init()
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude;
    address.reverseGeocodeLocation(CLLocation.init(latitude: latitude, longitude:longitude)) { (places, error) in
            if error == nil{
                if places != nil{
                    self.localityTF.text = "\(String(describing: places))"
                    //here you can get all the info by combining that you can make address
                }
            }
        }
        //localityTF.text = "\(address)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
  
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func validation(_ sender: UIButton) {
        //tag gst0 pan1
        if sender.tag == 0{
            if GSTNoTF.text?.count == 0{
                customAlert(title: "Enter GST Number First", msg: "Please Enter the GST number first to Validate")
            }else if GSTNoTF.text?.isValidGST == false{
                customAlert(title: "GST No is not Valid", msg: "Please provide the Valid GST number")
            }else{
                customAlert(title: "GST Number is Valid", msg: "The GST Number you have provided is Valid")
            }
            
        }else{
            if PANNoTF.text?.count == 0{
            customAlert(title: "Enter PAN Number First", msg: "Please Enter the PAN number first to Validate")
            }else if PANNoTF.text?.isValidPAN == false{
                customAlert(title: "PAN No is not Valid", msg: "Please provide the Valid PAN number")
                }else{
                    customAlert(title: "PAN Number is Valid", msg: "The PAN Number you have provided is Valid")
            }
        }
    }
    @IBAction func savePressed(_ sender: UIButton) {
        if countryTF.text?.count == 0 || categorizationOfEnterpricesTF.text?.count == 0 || businessHouseTF.text?.count == 0 || officeTypeTF.text?.count == 0 || employeeStrengthTF.text?.count == 0 || GSTNoTF.text?.count == 0 || PANNoTF.text?.count == 0 || companyNameAsPerGSTTF.text?.count == 0 || countryTF.text?.count == 0 || cityTF.text?.count == 0 || localityTF.text?.count == 0{
            customAlert(title: "All the fields are Compulsory", msg: "Please enter all the details")
        }else{
            struct RegisterSecondStruct: Codable {
                let companyType: String
                let categorizationOfEmterpises: String
                let businessHouse: String
                let officeType: String
                let employeeStrength: String
                let GSTRegistered: Bool
                let GSTNo: String
                let PANNo: String
                let companyNameAsPerGST: String
                let country: String
                let city: String
                let locality: String
            }

            let registerSecond = RegisterSecondStruct(companyType: companyTypeTF.text ?? "", categorizationOfEmterpises: categorizationOfEnterpricesTF.text ?? "", businessHouse: businessHouseTF.text ?? "", officeType: officeTypeTF.text ?? "", employeeStrength: employeeStrengthTF.text ?? "", GSTRegistered: GSTYes, GSTNo: GSTNoTF.text ?? "", PANNo: PANNoTF.text ?? "", companyNameAsPerGST: companyNameAsPerGSTTF.text ?? "", country: countryTF.text ?? "", city: cityTF.text ?? "", locality: localityTF.text ?? "")
            guard let uploadData = try? JSONEncoder().encode(registerSecond) else {
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
//        if fromVC == "UpdateProfileMainVC"{
//        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterEmploymentFourthVC") as! RegisterEmploymentFourthVC
//        vc.fromVC = fromVC
//
//        present(vc, animated: true, completion: nil)
//        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterThirdVC") as! RegisterThirdVC
            present(vc, animated: true, completion: nil)
            //}
        }
    }
    @IBAction func radioBtnPressed(_ sender: UIButton) {
        //tag gst yes0 gstno1
        if sender.tag == 0{
            GSTNo = false
            GSTNoImg.image = UIImage(named: "uncheck")

            GSTYes = !GSTYes
            if GSTYes == true{
                GSTYesImg.image = UIImage(named: "check")
            }else{
                GSTYesImg.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 1{
            GSTYes = false
            GSTYesImg.image = UIImage(named: "uncheck")

            GSTNo = !GSTNo
            if GSTNo == true{
                GSTNoImg.image = UIImage(named: "check")
            }else{
                GSTNoImg.image = UIImage(named: "uncheck")
            }
        }
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
    resignFirstResponder()
    }
    
    @IBAction func locateMePressed(_ sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    @IBAction func automaticLocationPressed(_ sender: UIButton) {
    }
    @IBAction func loginPressed(_ sender: UIButton) {
                let vc = storyboard?.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
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
