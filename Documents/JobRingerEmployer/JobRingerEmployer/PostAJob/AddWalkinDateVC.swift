//
//  AddWalkinDateVC.swift
//  JobRingerEmployer
//
//  Created by Arfat Inamdar on 27/05/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit
import MaterialComponents

class AddWalkinDateVC: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var addWalkinDTTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addWalkinDTTableView: UITableView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pleaseSelectView: UIView!
    @IBOutlet weak var dateTF: MDCTextField!
    @IBOutlet weak var timeFromTF: MDCTextField!
    @IBOutlet weak var timeToTF: MDCTextField!
    
    var dateController: MDCTextInputControllerOutlined!
    var timeFromController: MDCTextInputControllerOutlined!
    var timeToController: MDCTextInputControllerOutlined!
    var fromVC = ""
    var isRepeating = 0
    var walkinDateArr = [String]()
    var timeFromArr = [String]()
    var timeToArr = [String]()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
        
        if walkinDateArr.count == 0{
            pleaseSelectView.isHidden = false
        }
        pleaseSelectView.isHidden = true
        showDatePicker()
        openTimePicker()
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        if fromVC == "UpdateProfileMainVC"{
            headerView.backgroundColor = UIColor.blue
            headerLbl.textColor = UIColor.white
            
        }
        self.dateController = MDCTextInputControllerOutlined(textInput: dateTF)
        self.timeFromController = MDCTextInputControllerOutlined(textInput: timeFromTF)
        self.timeToController = MDCTextInputControllerOutlined(textInput: timeToTF)
        
        addBtn.layer.borderWidth = 1
        addBtn.layer.borderColor = UIColor.black.cgColor
        addBtn.layer.cornerRadius = addBtn.frame.height/2
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dateTF.resignFirstResponder()
        timeFromTF.resignFirstResponder()
        timeToTF.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateTF.resignFirstResponder()
        timeFromTF.resignFirstResponder()
        timeToTF.resignFirstResponder()
        return true
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
        
        timeFromTF.inputAccessoryView = toolbar
        timeFromTF.inputView = timePicker
        timeToTF.inputAccessoryView = toolbar
        timeToTF.inputView = timePicker
//        timePicker.datePickerMode = UIDatePicker.Mode.time
//        timePicker.frame = CGRect(x: 0.0, y: (self.view.frame.height/2 + 60), width: self.view.frame.width, height: 150.0)
//        timePicker.backgroundColor = UIColor.white
//        self.view.addSubview(timePicker)
//        timePicker.addTarget(self, action: #selector(AddWalkinDateVC.startTimeDiveChanged), for: UIControl.Event.valueChanged)
    }
    @objc func doneTimePicker(){
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        if timeFromTF.isEditing{
        timeFromTF.text = formatter.string(from: timePicker.date)
        }else{
            timeToTF.text = formatter.string(from: timePicker.date)
        }
        self.view.endEditing(true)
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateTF.inputAccessoryView = toolbar
        dateTF.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walkinDateArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddWalkinDTTableViewCell") as! AddWalkinDTTableViewCell
        cell.deleteBtn.tag = indexPath.row
        if walkinDateArr.count == 0{
            pleaseSelectView.isHidden = false
        }
        cell.dateLbl.text = walkinDateArr[indexPath.row]
        cell.fromAndToTimeLbl.text = timeFromArr[indexPath.row] + "-" + timeToArr[indexPath.row]
        addWalkinDTTableViewHeight.constant = CGFloat(walkinDateArr.count * 80)
        //scrollViewHeight.constant = linkTableViewHeight.constant
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func customAlert(title:String, msg:String){
    let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
        
    @IBAction func addBtnPressed(_ sender: UIButton) {
        if dateTF.text?.count == 0 || timeFromTF.text?.count == 0 || timeToTF.text?.count == 0{
            customAlert(title: "", msg: "Enter date and time")
        }else{
        for i in 0..<walkinDateArr.count{
            if dateTF.text == walkinDateArr[i]{
                isRepeating += 1
            }
        }
        if isRepeating >= 1{
                let alert = UIAlertController(title: "Already added", message: "The Social Media you want to add is already added", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                }
                
                //Add OK and Cancel button to dialog message
                alert.addAction(ok)
                
                // Present dialog message to user
                self.present(alert, animated: true, completion: nil)
            isRepeating = 0
            }else{
                self.walkinDateArr.append(dateTF.text ?? "")
            self.timeFromArr.append(timeFromTF.text ?? "")
            self.timeToArr.append(timeToTF.text ?? "")
                addWalkinDTTableView.reloadData()
            }
        }
    }
    @IBAction func saveBtnPressed(_ sender: UIButton) {
//        if fromVC == "UpdateProfileMainVC"{
//            let vc = UIStoryboard(name: "UpdateProfile", bundle: nil).instantiateViewController(withIdentifier: "UpdateProfileMainVC") as! UpdateProfileMainVC
//            present(vc, animated: false, completion: nil)
//        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "PostAJob6VC") as! PostAJob6VC
            present(vc, animated: true, completion: nil)
//        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func cellDeletePressed(_ sender: UIButton) {
//        if sender.isSelected{
//                      sender.isSelected = false
//                  }else{
//
//                      sender.isSelected = true
                      
                      let tag = sender.tag
                      print("tag number at delete \(tag)")
                      
                      //let language = myPickerData[tag]
                      
                let dialogMessagedeletdirect = UIAlertController(title: "Delete \(walkinDateArr[tag])??", message: "Do you really want to delete this record?", preferredStyle: .alert)
                      
                      // Create OK button with action handler
                      let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
                          print("yes button tapped")
                          self.walkinDateArr.remove(at: sender.tag)
                          self.addWalkinDTTableView.reloadData()
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
class AddWalkinDTTableViewCell: UITableViewCell {
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var fromAndToTimeLbl: UILabel!
    
}
