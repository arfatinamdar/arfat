//
//  WorkDaysVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 28/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class WorkDaysVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mondayFromTF: MDCTextField!
    @IBOutlet weak var mondayToTF: MDCTextField!
    @IBOutlet weak var tuesdayFromTF: MDCTextField!
    @IBOutlet weak var tuesdayToTF: MDCTextField!
    @IBOutlet weak var wednesdayFromTF: MDCTextField!
    @IBOutlet weak var wednesdayToTF: MDCTextField!
    @IBOutlet weak var thursdayFromTF: MDCTextField!
    @IBOutlet weak var thursdayToTF: MDCTextField!
    @IBOutlet weak var fridayFromTF: MDCTextField!
    @IBOutlet weak var fridayToTF: MDCTextField!
    @IBOutlet weak var saturdayFromTF: MDCTextField!
    @IBOutlet weak var saturdayToTF: MDCTextField!
    @IBOutlet weak var sundayFromTF: MDCTextField!
    @IBOutlet weak var sundayToTF: MDCTextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var mondayCloseBtn: UIImageView!
    @IBOutlet weak var tuesdayCloseBtn: UIImageView!
    @IBOutlet weak var wednesdayCloseBtn: UIImageView!
    @IBOutlet weak var thursdayCloseBtn: UIImageView!
    @IBOutlet weak var fridayCloseBtn: UIImageView!
    @IBOutlet weak var saturdayCloseBtn: UIImageView!
    @IBOutlet weak var sundayCloseBtn: UIImageView!
    @IBOutlet weak var applyAllBtn: UIButton!
    
    var mondayFromController: MDCTextInputControllerOutlined!
    var mondayToController: MDCTextInputControllerOutlined!
    var tuesdayFromController: MDCTextInputControllerOutlined!
    var tuesdayToController: MDCTextInputControllerOutlined!
    var wednesdayFromController: MDCTextInputControllerOutlined!
    var wednesdayToController: MDCTextInputControllerOutlined!
    var thursdayFromController: MDCTextInputControllerOutlined!
    var thursdayToController: MDCTextInputControllerOutlined!
    var fridayFromController: MDCTextInputControllerOutlined!
    var fridayToController: MDCTextInputControllerOutlined!
    var saturdayFromController: MDCTextInputControllerOutlined!
    var saturdayToController: MDCTextInputControllerOutlined!
    var sundayFromController: MDCTextInputControllerOutlined!
    var sundayToController: MDCTextInputControllerOutlined!

    var applyAll = false
    var mondayClose = false
    var tuesdayClose = false
    var wednesdayClose = false
    var thursdayClose = false
    var fridayClose = false
    var saturdayClose = false
    var sundayClose = false
    let timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        mondayFromController = MDCTextInputControllerOutlined(textInput: mondayFromTF)
        mondayToController = MDCTextInputControllerOutlined(textInput: mondayToTF)
        tuesdayFromController = MDCTextInputControllerOutlined(textInput: tuesdayFromTF)
        tuesdayToController = MDCTextInputControllerOutlined(textInput: tuesdayToTF)
        wednesdayFromController = MDCTextInputControllerOutlined(textInput: wednesdayFromTF)
        wednesdayToController = MDCTextInputControllerOutlined(textInput: wednesdayToTF)
        thursdayFromController = MDCTextInputControllerOutlined(textInput: thursdayFromTF)
        thursdayToController = MDCTextInputControllerOutlined(textInput: thursdayToTF)
        fridayFromController = MDCTextInputControllerOutlined(textInput: fridayFromTF)
        fridayToController = MDCTextInputControllerOutlined(textInput: fridayToTF)
        saturdayFromController = MDCTextInputControllerOutlined(textInput: saturdayFromTF)
        saturdayToController = MDCTextInputControllerOutlined(textInput: saturdayToTF)
        sundayFromController = MDCTextInputControllerOutlined(textInput: sundayFromTF)
        sundayToController = MDCTextInputControllerOutlined(textInput: sundayToTF)

        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
        openTimePicker()
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        mondayFromTF.resignFirstResponder()
        mondayToTF.resignFirstResponder()
        tuesdayFromTF.resignFirstResponder()
        tuesdayToTF.resignFirstResponder()
        wednesdayFromTF.resignFirstResponder()
        wednesdayToTF.resignFirstResponder()
        thursdayFromTF.resignFirstResponder()
        thursdayToTF.resignFirstResponder()
        fridayFromTF.resignFirstResponder()
        fridayToTF.resignFirstResponder()
        saturdayFromTF.resignFirstResponder()
        saturdayToTF.resignFirstResponder()
        sundayFromTF.resignFirstResponder()
        sundayToTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mondayFromTF.resignFirstResponder()
        mondayToTF.resignFirstResponder()
        tuesdayFromTF.resignFirstResponder()
        tuesdayToTF.resignFirstResponder()
        wednesdayFromTF.resignFirstResponder()
        wednesdayToTF.resignFirstResponder()
        thursdayFromTF.resignFirstResponder()
        thursdayToTF.resignFirstResponder()
        fridayFromTF.resignFirstResponder()
        fridayToTF.resignFirstResponder()
        saturdayFromTF.resignFirstResponder()
        saturdayToTF.resignFirstResponder()
        sundayFromTF.resignFirstResponder()
        sundayToTF.resignFirstResponder()
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
    
    func openTimePicker()  {
            timePicker.datePickerMode = .time
            
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker));
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
            
            toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
            
            mondayFromTF.inputAccessoryView = toolbar
            mondayFromTF.inputView = timePicker
        
        mondayToTF.inputAccessoryView = toolbar
        mondayToTF.inputView = timePicker
        
        tuesdayFromTF.inputAccessoryView = toolbar
        tuesdayFromTF.inputView = timePicker
        
        tuesdayToTF.inputAccessoryView = toolbar
        tuesdayToTF.inputView = timePicker
        
        wednesdayFromTF.inputAccessoryView = toolbar
        wednesdayFromTF.inputView = timePicker
        
        wednesdayToTF.inputAccessoryView = toolbar
        wednesdayToTF.inputView = timePicker
        
        thursdayFromTF.inputAccessoryView = toolbar
        thursdayFromTF.inputView = timePicker
        
        thursdayToTF.inputAccessoryView = toolbar
        thursdayToTF.inputView = timePicker
        
        fridayFromTF.inputAccessoryView = toolbar
        fridayFromTF.inputView = timePicker
        
        fridayToTF.inputAccessoryView = toolbar
        fridayToTF.inputView = timePicker
        
        saturdayFromTF.inputAccessoryView = toolbar
        saturdayFromTF.inputView = timePicker
        
        saturdayToTF.inputAccessoryView = toolbar
        saturdayToTF.inputView = timePicker
        
        sundayFromTF.inputAccessoryView = toolbar
        sundayFromTF.inputView = timePicker
        
        sundayToTF.inputAccessoryView = toolbar
        sundayToTF.inputView = timePicker

        }
        @objc func doneTimePicker(){
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            if mondayFromTF.isEditing{
            mondayFromTF.text = formatter.string(from: timePicker.date)
            }else if mondayToTF.isEditing{
            mondayToTF.text = formatter.string(from: timePicker.date)
            }else if tuesdayFromTF.isEditing{
            tuesdayFromTF.text = formatter.string(from: timePicker.date)
            }else if tuesdayToTF.isEditing{
            tuesdayToTF.text = formatter.string(from: timePicker.date)
            }else if wednesdayFromTF.isEditing{
            wednesdayFromTF.text = formatter.string(from: timePicker.date)
            }else if wednesdayToTF.isEditing{
            wednesdayToTF.text = formatter.string(from: timePicker.date)
            }else if thursdayFromTF.isEditing{
            thursdayFromTF.text = formatter.string(from: timePicker.date)
            }else if thursdayToTF.isEditing{
            thursdayToTF.text = formatter.string(from: timePicker.date)
            }else if fridayFromTF.isEditing{
            fridayFromTF.text = formatter.string(from: timePicker.date)
            }else if fridayToTF.isEditing{
            fridayToTF.text = formatter.string(from: timePicker.date)
            }else if saturdayFromTF.isEditing{
            saturdayFromTF.text = formatter.string(from: timePicker.date)
            }else if saturdayToTF.isEditing{
            saturdayToTF.text = formatter.string(from: timePicker.date)
            }else if sundayFromTF.isEditing{
            sundayFromTF.text = formatter.string(from: timePicker.date)
            }else if sundayToTF.isEditing{
            sundayToTF.text = formatter.string(from: timePicker.date)
            }
            self.view.endEditing(true)
        }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func applyAllCheck(_ sender: UIButton) {
        applyAll = !applyAll
        if applyAll == true{
            applyAllBtn.setImage(UIImage(named: "check"), for: .normal)
        }else{
            applyAllBtn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeCheckPressed(_ sender: UIButton) {
        //monday0, tuesday1, wednesday2, thursday3, friday4, saturday5 and sunday6
        if sender.tag == 0{
            mondayClose = !mondayClose
            if mondayClose == true{
                mondayCloseBtn.image = UIImage(named: "check")
            }else{
                mondayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 1{
            tuesdayClose = !tuesdayClose
            if tuesdayClose == true{
                tuesdayCloseBtn.image = UIImage(named: "check")
            }else{
                tuesdayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 2{
            wednesdayClose = !wednesdayClose
            if wednesdayClose == true{
                wednesdayCloseBtn.image = UIImage(named: "check")
            }else{
                wednesdayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 3{
            thursdayClose = !thursdayClose
            if thursdayClose == true{
                thursdayCloseBtn.image = UIImage(named: "check")
            }else{
                thursdayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 4{
            fridayClose = !fridayClose
            if fridayClose == true{
                fridayCloseBtn.image = UIImage(named: "check")
            }else{
                fridayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 5{
            saturdayClose = !saturdayClose
            if saturdayClose == true{
                saturdayCloseBtn.image = UIImage(named: "check")
            }else{
                saturdayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
        if sender.tag == 6{
            sundayClose = !sundayClose
            if sundayClose == true{
                sundayCloseBtn.image = UIImage(named: "check")
            }else{
                sundayCloseBtn.image = UIImage(named: "uncheck")
            }
        }
    }
    @IBAction func savePressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "WhoCanApply2VC") as! WhoCanApply2VC
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
