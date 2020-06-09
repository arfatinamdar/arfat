//
//  FiltersVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 20/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class FiltersVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    //drawer
    
    @IBOutlet weak var locationIndustryExpJobTypeView: UIView!
    @IBOutlet weak var keywordsBtnView: UIView!
    @IBOutlet weak var locationBtnView: UIView!
    @IBOutlet weak var industryView: UIView!
    @IBOutlet weak var expBtnView: UIView!
    @IBOutlet weak var salaryBtnView: UIView!
    @IBOutlet weak var keywordsView: UIView!
    @IBOutlet weak var salaryView: UIView!
    @IBOutlet weak var departmentBtnView: UIView!
    @IBOutlet weak var filtersTableView: UITableView!
    @IBOutlet weak var filtersTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var keywordBtn: UIButton!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var industryBtn: UIButton!
    @IBOutlet weak var expBtn: UIButton!
    @IBOutlet weak var moreBtnView: UIView!
    @IBOutlet weak var courseBtnView: UIView!
    @IBOutlet weak var courseBtn: UIButton!
    @IBOutlet weak var departmentBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var salaryBtn: UIButton!
    @IBOutlet weak var jobTypeBtn: UIButton!
    @IBOutlet weak var zeroToTwoLacCheckBtn: UIButton!
    @IBOutlet weak var fourToSixLacBtn: UIButton!
    @IBOutlet weak var twoToFourLacBtn: UIButton!
    @IBOutlet weak var eightToTenLacBtn: UIButton!
    @IBOutlet weak var sixToEightLacBtn: UIButton!
    @IBOutlet weak var tenToTwelveLacBtn: UIButton!
    //keyword
    @IBOutlet weak var enterKeywordTF: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var twelveToFourteenLacBtn: UIButton!
    @IBOutlet weak var fourteenAndAboveBtn: UIButton!
    @IBOutlet weak var anyBtn: UIButton!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var exactPhraseBtn: UIButton!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var btnPressed = ""
    var zeroToTwoLac = false
    var twoToFourLac = false
    var fourToSixLac = false
    var sixToEightLac = false
    var eightToTenLac = false
    var tenToTwelveLac = false
    var twelveToFourteenLac = false
    var fourteenAndAbove = false
    
    var any = false
    var all = false
    var exactPhrase = false
    var searchActive = false
    var locationFilteredData = [String]()
    var industryFilteredData = [String]()
    var expFilteredData = [String]()
    var selectedLocationArr = ["","","","","","","",""]
    var selectedIndustryArr = ["","","","","",""]
    var selectedExpArr = ["","","","",""]
    var selectedJobTypeArr = ["","",""]
    var chipsKeywordArr = ["iOS Developer","Swift","JAVA","Python","Android Developer"]
    var locationArr: [String] = ["Mumbai","Pune","Beed","Aurangabad","Sangli","Satara","Jalna","Buldhana"]
    var industryArr = ["Advertising/MR/PR/Events","Media/Entertainment","Recruitment Services","Sports/Fitness","IT-Hardware/Networking","Animation"]
    var expArr = ["< 1 Year","1 to 2 Years", "3 to 5 Years", "6 to 8 Years","9 to 10 Years"]
    var jobTypeArr = ["Part time","Full time", "Contract based"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        enterKeywordTF.layer.borderWidth = 1
        enterKeywordTF.layer.borderColor = UIColor.black.cgColor
        enterKeywordTF.layer.cornerRadius = enterKeywordTF.frame.height/2
        salaryView.isHidden = true
        locationIndustryExpJobTypeView.isHidden = true
        keywordsView.isHidden = false
        keywordsBtnView.backgroundColor = UIColor.white
        
        jobTypeArr = ["Part time","Full time","Contract based"]
        
        scrollViewHeight.constant = view.intrinsicContentSize.height
        let view2 = UIView()
        view2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let paddingView2: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        paddingView2.addSubview(view2)
        enterKeywordTF.leftViewMode = .always
        enterKeywordTF.leftView = paddingView2
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chipsKeywordArr.count
    }
    
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        <#code#>
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MDCCollectionViewCell", for: indexPath) as! MDCCollectionViewCell
        cell.titleLbl.text = chipsKeywordArr[indexPath.item]
        cell.contentView.layer.cornerRadius = 10
        //        let chipViews = MDCChipView()
        //        chipViews.titleLabel.text = chipsKeywordArr[indexPath.item]
        //        chipViews.setTitleColor(UIColor.red, for: .selected)
        //        chipViews.sizeToFit()
        //        chipViews.backgroundColor(for: .selected)
        //        cell.addSubview(chipViews)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        enterKeywordTF.text = chipsKeywordArr[indexPath.item]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if btnPressed == "location"{
            self.searchActive = true
            if let searchText = searchBar.text {
                locationFilteredData = searchText.isEmpty ? locationArr : locationArr.filter({(dataString: String) -> Bool in
                    return dataString.range(of: searchText, options: .caseInsensitive) != nil
                })
                
                filtersTableView.reloadData()
                //searchActive = false
            }
        }else if btnPressed == "industry"{
            self.searchActive = true
            if let searchText = searchBar.text {
                industryFilteredData = searchText.isEmpty ? industryArr : industryArr.filter({(dataString: String) -> Bool in
                    return dataString.range(of: searchText, options: .caseInsensitive) != nil
                })
                
                filtersTableView.reloadData()
                //searchActive = false
            }
        }else if btnPressed == "experience"{
            self.searchActive = true
            if let searchText = searchBar.text {
                expFilteredData = searchText.isEmpty ? expArr : expArr.filter({(dataString: String) -> Bool in
                    return dataString.range(of: searchText, options: .caseInsensitive) != nil
                })
                
                filtersTableView.reloadData()
                //searchActive = false
            }
        }else{
            self.searchActive = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if btnPressed == "location"{
            if searchActive == true{
                return locationFilteredData.count
                
            }else{
                return locationArr.count
                
            }
        }else if btnPressed == "industry"{
            if searchActive == true{
                return industryFilteredData.count
                
            }else{
                return industryArr.count
                
            }
        }else if btnPressed == "experience"{
            if searchActive == true{
                return expFilteredData.count
                
            }else{
                return expArr.count
                
            }
        }else{
            return jobTypeArr.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersTableViewCell") as! FiltersTableViewCell
        cell.selectionStyle = .none
        if btnPressed == "location"{
            searchBar.isHidden = false
            if(searchActive == true){
                cell.textLabel?.text = locationFilteredData[indexPath.row] as NSString as String
                filtersTableViewHeight.constant = CGFloat(locationFilteredData.count * 50)
            } else {
                cell.textLabel?.text = locationArr[indexPath.row] as NSString as String
                filtersTableViewHeight.constant = CGFloat(locationArr.count * 50)
            }
        }else if btnPressed == "industry"{
            searchBar.isHidden = false
            if(searchActive == true){
                cell.textLabel?.text = industryFilteredData[indexPath.row] as NSString as String
                filtersTableViewHeight.constant = CGFloat(industryFilteredData.count * 50)
            } else {
                cell.textLabel?.text = industryArr[indexPath.row] as NSString as String
                filtersTableViewHeight.constant = CGFloat(industryArr.count * 50)
            }
        }else if btnPressed == "experience"{
            searchBar.isHidden = false
            if(searchActive == true){
                cell.textLabel?.text = expFilteredData[indexPath.row] as NSString as String
                filtersTableViewHeight.constant = CGFloat(expFilteredData.count * 50)
            } else {
                cell.textLabel?.text = expArr[indexPath.row] as NSString as String
                filtersTableViewHeight.constant = CGFloat(expArr.count * 50)
            }
        }else{
            searchBar.isHidden = true
            cell.textLabel?.text = jobTypeArr[indexPath.row] as NSString as String
            filtersTableViewHeight.constant = CGFloat(jobTypeArr.count * 50)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      // filtersTableView.deselectRow(at: indexPath, animated: false)
       
       guard let cell = filtersTableView.cellForRow(at: indexPath) else { return }
       if btnPressed == "location"{
          if cell.accessoryType == .checkmark{
                     cell.accessoryType = .none
            selectedLocationArr.remove(at: indexPath.row)
                 }else{
            selectedLocationArr.insert(locationArr[indexPath.row], at: indexPath.row)
                     cell.accessoryType = .checkmark
                 }
       }else if btnPressed == "industry"{
        filtersTableView.deselectRow(at: indexPath, animated: false)
             if cell.accessoryType == .checkmark{
                     cell.accessoryType = .none
                selectedIndustryArr.remove(at: indexPath.row)
                 }else{
                     cell.accessoryType = .checkmark
                selectedIndustryArr.insert(industryArr[indexPath.row], at: indexPath.row)
                 }
       }else if btnPressed == "experience"{
           if cell.accessoryType == .checkmark{
                     cell.accessoryType = .none
            selectedExpArr.remove(at: indexPath.row)
                 }else{
                     cell.accessoryType = .checkmark
            selectedExpArr.insert(expArr[indexPath.row], at: indexPath.row)
                 }
       }else{
           if cell.accessoryType == .checkmark{
                     cell.accessoryType = .none
            selectedJobTypeArr.remove(at: indexPath.row)
                 }else{
                     cell.accessoryType = .checkmark
            selectedJobTypeArr.insert(jobTypeArr[indexPath.row], at: indexPath.row)
                 }
        }
      
    }
    
    @IBAction func salaryCheckPressed(_ sender: UIButton) {
        //tag 0-2 0 ... 14 & above 7
        if sender.tag == 0{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            zeroToTwoLac = !zeroToTwoLac
            if zeroToTwoLac == true{
                zeroToTwoLacCheckBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 1{
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            twoToFourLac = !twoToFourLac
            if twoToFourLac == true{
                twoToFourLacBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 2{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            fourToSixLac = !fourToSixLac
            if fourToSixLac == true{
                fourToSixLacBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 3{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            sixToEightLac = !sixToEightLac
            if sixToEightLac == true{
                sixToEightLacBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 4{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            eightToTenLac = !eightToTenLac
            if eightToTenLac == true{
                eightToTenLacBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 5{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            tenToTwelveLac = !tenToTwelveLac
            if tenToTwelveLac == true{
                tenToTwelveLacBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 6{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourteenAndAbove = false
            fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            twelveToFourteenLac = !twelveToFourteenLac
            if twelveToFourteenLac == true{
                twelveToFourteenLacBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 7{
            twoToFourLac = false
            twoToFourLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            fourToSixLac = false
            fourToSixLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            sixToEightLac = false
            sixToEightLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            eightToTenLac = false
            eightToTenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            tenToTwelveLac = false
            tenToTwelveLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            twelveToFourteenLac = false
            twelveToFourteenLacBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            zeroToTwoLac = false
            zeroToTwoLacCheckBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            fourteenAndAbove = !fourteenAndAbove
            if fourteenAndAbove == true{
                fourteenAndAboveBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                fourteenAndAboveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
    }
    @IBAction func keywordsCheckPressed(_ sender: UIButton) {
        //tag any 0, all 1 and exact Phrase 2
        if sender.tag == 0{
            all = false
            allBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            exactPhrase = false
            exactPhraseBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            any = !any
            if any == true{
                anyBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                anyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 1{
            any = false
            
            anyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            exactPhrase = false
            exactPhraseBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            all = !all
            if all == true{
                allBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                allBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 2{
            all = false
            allBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            any = false
            anyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            
            exactPhrase = !exactPhrase
            if exactPhrase == true{
                exactPhraseBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                exactPhraseBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
    }
    
    @IBAction func drawerBtnsPressed(_ sender: UIButton) {
        if sender.tag == 0{
            keywordsBtnView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = false
            locationIndustryExpJobTypeView.isHidden = true
            salaryView.isHidden = true
        }
        if sender.tag == 1{
            btnPressed = "location"
            searchBar.text = ""
            searchBar.endEditing(true)
            searchActive = false
            filtersTableView.reloadData()
            locationBtnView.backgroundColor = UIColor.white
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = false
            salaryView.isHidden = true
        }
        if sender.tag == 2{
            btnPressed = "industry"
            searchBar.text = ""
            searchBar.endEditing(true)
            searchActive = false
            filtersTableView.reloadData()
            industryView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = false
            salaryView.isHidden = true
        }
        if sender.tag == 3{
            btnPressed = "experience"
            searchBar.text = ""
            searchBar.endEditing(true)
            searchActive = false
            filtersTableView.reloadData()
            expBtnView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = false
            salaryView.isHidden = true
        }
        if sender.tag == 4{
            btnPressed = "jobType"
            filtersTableView.reloadData()
            departmentBtnView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = false
            salaryView.isHidden = true
        }
        if sender.tag == 5{
            salaryBtnView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = true
            salaryView.isHidden = false
        }
        if sender.tag == 6{
            courseBtnView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            moreBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = false
            salaryView.isHidden = true
        }
        if sender.tag == 7{
            moreBtnView.backgroundColor = UIColor.white
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            industryView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            expBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            departmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            courseBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            keywordsView.isHidden = true
            locationIndustryExpJobTypeView.isHidden = false
            salaryView.isHidden = true
        }
    }
    
    
    
    @IBAction func applyPressed(_ sender: UIButton) {
        //let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "QuickSearchResultVC") as! QuickSearchResultVC
        //present(vc, animated: true, completion: nil)
    }
    
    @IBAction func clearAllPressed(_ sender: UIButton) {
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        //let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ManageCandidateVC") as! ManageCandidateVC
        //present(vc, animated: true, completion: nil)
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
class FiltersTableViewCell: UITableViewCell {
    
}
class MDCCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
}
