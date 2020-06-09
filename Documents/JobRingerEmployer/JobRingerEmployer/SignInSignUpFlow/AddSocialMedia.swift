//
//  AddSocialMedia.swift
//  JobRingerEmployee
//
//  Created by MAC on 03/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class AddSocialMedia: UIViewController, UITableViewDelegate,UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var linksTextField: MDCTextField!
    @IBOutlet weak var socialTextField: MDCTextField!
    @IBOutlet weak var socialLinkTableView: UITableView!
    @IBOutlet weak var linkTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pleaseSelectView: UIView!
    
    var socialController: MDCTextInputControllerOutlined!
    var linksController: MDCTextInputControllerOutlined!
    var fromVC = ""
    var isRepeating = 0
    var myPickerData = ["Facebook", "Instagram", "Twitter"]
    var socaialMediaLinks: NSDictionary = ["Facebook": "fb.com", "Instagram": "insta.com", "Twitter": "twitter.com"]
    var socialMediaArr = [String]()
    let pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        if socialMediaArr.count == 0{
            pleaseSelectView.isHidden = false
        }
        pleaseSelectView.isHidden = true
        showPicker()
        socialTextField.text = "Facebook"
        linksTextField.text = socaialMediaLinks.value(forKey: socialTextField.text ?? "") as? String
        pickerView.delegate = self
        pickerView.dataSource = self
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
        self.socialController = MDCTextInputControllerOutlined(textInput: socialTextField)
        self.linksController = MDCTextInputControllerOutlined(textInput: linksTextField)
        
        addBtn.layer.borderWidth = 1
        addBtn.layer.borderColor = UIColor.black.cgColor
        addBtn.layer.cornerRadius = addBtn.frame.height/2
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        socialTextField.text = myPickerData[row]
        linksTextField.text = socaialMediaLinks.value(forKey: socialTextField.text ?? "") as? String
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField == self.socialTextField {
            self.pickerView.isHidden = false
            //if you don't want the users to se the keyboard type:

            textField.endEditing(true)
        }
    }
    
    
    func showPicker(){
        //Formate Date

        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        socialTextField.inputAccessoryView = toolbar
        socialTextField.inputView = pickerView
        linksTextField.text = socaialMediaLinks.value(forKey: socialTextField.text ?? "") as? String

    }

    @objc func donePicker(){
        self.view.endEditing(true)
    }

    @objc func cancelPicker(){
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socialMediaArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkCell") as! LinkTableViewCell
        cell.deleteBtn.tag = indexPath.row
        if socialMediaArr.count == 0{
            pleaseSelectView.isHidden = false
        }
        cell.socialLbl.text = socialMediaArr[indexPath.row]
        cell.linkLbl.text = socaialMediaLinks.value(forKey: socialMediaArr[indexPath.row] ) as? String
        linkTableViewHeight.constant = CGFloat(socialMediaArr.count * 80)
        scrollViewHeight.constant = linkTableViewHeight.constant
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addBtnPressed(_ sender: UIButton) {
        for i in 0..<socialMediaArr.count{
            if socialTextField.text == socialMediaArr[i]{
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
                self.socialMediaArr.append(socialTextField.text ?? "")
                socialLinkTableView.reloadData()
            }
    }
    @IBAction func saveBtnPressed(_ sender: UIButton) {
//        if fromVC == "UpdateProfileMainVC"{
//            let vc = UIStoryboard(name: "UpdateProfile", bundle: nil).instantiateViewController(withIdentifier: "UpdateProfileMainVC") as! UpdateProfileMainVC
//            present(vc, animated: false, completion: nil)
//        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterFifthVC") as! RegisterFifthVC
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
                      
                let dialogMessagedeletdirect = UIAlertController(title: "Delete \(socialMediaArr[tag])??", message: "Do you really want to delete this record?", preferredStyle: .alert)
                      
                      // Create OK button with action handler
                      let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
                          print("yes button tapped")
                          self.socialMediaArr.remove(at: sender.tag)
                          self.socialLinkTableView.reloadData()
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
class LinkTableViewCell: UITableViewCell {
    @IBOutlet weak var crossDeleteImg: UIImageView!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var socialLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
}
