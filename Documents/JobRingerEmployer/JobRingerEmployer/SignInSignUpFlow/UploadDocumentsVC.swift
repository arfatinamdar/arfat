//
//  UploadDocumentsVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 04/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents
import MobileCoreServices

class UploadDocumentsVC: UIViewController, UITableViewDelegate,UITableViewDataSource, UIDocumentMenuDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var attachementsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var marksheetTF: MDCTextField!
    @IBOutlet weak var attachmentsTableView: UITableView!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var marksheetController: MDCTextInputControllerOutlined!
    var fromVC = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if fromVC == "companyProfle"{
            headerView.backgroundColor = UIColor.blue
        }else if fromVC == "PostAJob"{
            headerLbl.text = "Post a Job"
            headerView.backgroundColor = UIColor.blue
        }
        
        let leftColor = UIColor(red: (36/255.0), green: (32/255.0), blue:(120/255.0), alpha: 1)
        let rightColor = UIColor(red: (71/255.0), green: (69/255.0), blue:(230/255.0), alpha: 1)

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width-40, height: 50)
            
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = saveBtn.frame.height/2
        self.saveBtn.layer.insertSublayer(gradientLayer, at: 0)
        self.marksheetController = MDCTextInputControllerOutlined(textInput: marksheetTF)
        uploadBtn.layer.cornerRadius = 25
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        
        
        // Do any additional setup after loading the view.
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
                  guard let myURL = urls.first else {
                       return
                  }
                  print("import result : \(myURL)")
        }

    
    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
            documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)
        }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
                print("view was cancelled")
                dismiss(animated: true, completion: nil)
        }
    func clickFunction(){

    let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
                importMenu.delegate = self
                importMenu.modalPresentationStyle = .formSheet
                self.present(importMenu, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttachmentsTableViewCell") as! AttachmentsTableViewCell
        cell.documentNameLbl?.text = "Expert Certificate.pdf"
        cell.docDateLbl?.text = "Added on"
        attachementsViewHeight.constant = (50 * 4) + 60
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func uploadPressed(_ sender: UIButton) {
    }
    @IBAction func savePressed(_ sender: UIButton) {
        if fromVC == "companyProfle"{
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileVC") as! CompanyProfileVC
            present(vc, animated: true, completion: nil)
        }else if fromVC == "PostAJob"{
            let vc = UIStoryboard(name: "PostAJob", bundle: nil).instantiateViewController(withIdentifier: "EmployerDetailsVC") as! EmployerDetailsVC
            present(vc, animated: true, completion: nil)
        }else{
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterThirdVC") as! RegisterThirdVC
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
    
    @IBAction func downloadPressed(_ sender: UIButton) {
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        let dialogMessagedeletdirect = UIAlertController(title: "Confirm", message: "Do you want to delete this record?", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
                
                //self.portalArr.remove(at: sender.tag)
                //self.attachmentsTableView.reloadData()
        
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
class AttachmentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var documentNameLbl: UILabel!
    @IBOutlet weak var docDateLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var downloadBtn: UIButton!
}
