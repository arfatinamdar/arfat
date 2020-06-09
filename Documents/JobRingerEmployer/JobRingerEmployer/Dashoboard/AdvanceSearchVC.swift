//
//  AdvanceSearchVC.swift
//  JobRingerEmployee
//
//  Created by Arfat Inamdar on 19/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import MaterialComponents

class AdvanceSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    //salary
    @IBOutlet weak var salaryView: UIView!
    @IBOutlet weak var currencyTF: MDCTextField!
    @IBOutlet weak var salaryFromTF: MDCTextField!
    @IBOutlet weak var salaryToTF: MDCTextField!
    @IBOutlet weak var salaryPerAnnumOrTF: MDCTextField!
    @IBOutlet weak var noticePeriodTF: MDCTextField!
    @IBOutlet weak var ctcRangeTF: MDCTextField!
    //company
    @IBOutlet weak var enterText2TF: MDCTextField!
    @IBOutlet weak var keywordsTF: MDCTextField!
    @IBOutlet weak var hiringForTF: MDCTextField!
    @IBOutlet weak var nameTF: MDCTextField!
    @IBOutlet weak var enterText1TF: MDCTextField!
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var eliminateKeywordsTF: MDCTextField!
    @IBOutlet weak var activeBtn: UIButton!
    @IBOutlet weak var inactiveBtn: UIButton!
    @IBOutlet weak var allCandidatesBtn: UIButton!
    //Personal
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var minAgeTF: MDCTextField!
    @IBOutlet weak var maxAgeTF: MDCTextField!
    @IBOutlet weak var marietalStatusTF: MDCTextField!
    @IBOutlet weak var categoryTF: MDCTextField!
    @IBOutlet weak var religionTF: MDCTextField!
    @IBOutlet weak var ethnicityTF: MDCTextField!
    @IBOutlet weak var languagesKnownTF: MDCTextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var otherBtn: UIButton!
    @IBOutlet weak var anyDefaultAnyBtn: UIButton!
    @IBOutlet weak var differentlyAbledBtn: UIButton!
    //drawer
    @IBOutlet weak var companyBtnView: UIView!
    @IBOutlet weak var salaryBtnView: UIView!
    @IBOutlet weak var experienceBtnView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var employmentBtnView: UIView!
    @IBOutlet weak var locationBtnView: UIView!
    @IBOutlet weak var educationBtnView: UIView!
    @IBOutlet weak var personalBtnView: UIView!
    @IBOutlet weak var displaySettingBtnView: UIView!
    //Employment
    @IBOutlet weak var currentLastEmployerTF: MDCTextField!
    @IBOutlet weak var excludeEmployerTF: MDCTextField!
    @IBOutlet weak var employmentStatusTF: MDCTextField!
    @IBOutlet weak var payrollTypeTF: MDCTextField!
    @IBOutlet weak var employmentTypeTF: MDCTextField!
    @IBOutlet weak var jobTypeTF: MDCTextField!
    @IBOutlet weak var industryTF: MDCTextField!
    @IBOutlet weak var functionalAreaTF: MDCTextField!
    @IBOutlet weak var roleTF: MDCTextField!
    @IBOutlet weak var employmentView: UIView!
    //display settings
    @IBOutlet weak var lastActiveTF: MDCTextField!
    @IBOutlet weak var sortByTF: MDCTextField!
    @IBOutlet weak var resumePerPageTF: MDCTextField!
    @IBOutlet weak var displaySettingView: UIView!
    //Education
    @IBOutlet weak var ugQualificationTF: MDCTextField!
    @IBOutlet weak var pgQualificationTF: MDCTextField!
    @IBOutlet weak var doctoratePhDTF: MDCTextField!
    @IBOutlet weak var educationView: UIView!
    //location
    @IBOutlet weak var countryTF: MDCTextField!
    @IBOutlet weak var locationTF: MDCTextField!
    @IBOutlet weak var areaLocalityTF: MDCTextField!
    @IBOutlet weak var pincodeTF: MDCTextField!
    @IBOutlet weak var searchWithinKmTF: MDCTextField!
    @IBOutlet weak var locationView: UIView!
    //experience
    @IBOutlet weak var designationTF: MDCTextField!
    @IBOutlet weak var minExpTF: MDCTextField!
    @IBOutlet weak var maxExpTF: MDCTextField!
    @IBOutlet weak var expInCurrentLastJobTF: MDCTextField!
    @IBOutlet weak var experienceView: UIView!
    //height constraints
    @IBOutlet weak var personalViewHeight: NSLayoutConstraint!
    @IBOutlet weak var salaryViewHeight: NSLayoutConstraint!
    @IBOutlet weak var companyViewHeight: NSLayoutConstraint!
    @IBOutlet weak var employmentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var educationViewHeight: NSLayoutConstraint!
    @IBOutlet weak var displaySetingViewHeight: NSLayoutConstraint!
    @IBOutlet weak var experienceViewHeight: NSLayoutConstraint!
    @IBOutlet weak var locationViewHeight: NSLayoutConstraint!
    //UG Qualification
    @IBOutlet weak var qualificationTF: MDCTextField!
    @IBOutlet weak var specializationTF: MDCTextField!
    @IBOutlet weak var universityTF: MDCTextField!
    @IBOutlet weak var ugBatchTF: MDCTextField!
    @IBOutlet weak var ugQualificationView: UIView!
    //Search View
    @IBOutlet weak var specifyLbl: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var searchView: UIView!
    
    var designationController: MDCTextInputControllerOutlined!
    var minExpController: MDCTextInputControllerOutlined!
    var maxExpController: MDCTextInputControllerOutlined!
    var expInCurrentLastJobController: MDCTextInputControllerOutlined!
    
    var countryController: MDCTextInputControllerOutlined!
    var locationController: MDCTextInputControllerOutlined!
    var areaLocalityController: MDCTextInputControllerOutlined!
    var pincodeController: MDCTextInputControllerOutlined!
    var searchWithinKmController: MDCTextInputControllerOutlined!
    
    var ugQualificationController: MDCTextInputControllerOutlined!
    var pgQualificationController: MDCTextInputControllerOutlined!
    var doctoratePhDController: MDCTextInputControllerOutlined!
    
    var lastActiveController: MDCTextInputControllerOutlined!
    var sortByController: MDCTextInputControllerOutlined!
    var resumePerPageController: MDCTextInputControllerOutlined!
    
    var currencyController: MDCTextInputControllerOutlined!
    var ctcRangeController: MDCTextInputControllerOutlined!
    var salaryFromController: MDCTextInputControllerOutlined!
    var salaryToController: MDCTextInputControllerOutlined!
    var salaryPerAnnumOrController: MDCTextInputControllerOutlined!
    var workingDaysController: MDCTextInputControllerOutlined!
    var noticePeriodController: MDCTextInputControllerOutlined!
    
    var enterText2Controller: MDCTextInputControllerOutlined!
    var keywordsController: MDCTextInputControllerOutlined!
    var hiringForController: MDCTextInputControllerOutlined!
    var nameController: MDCTextInputControllerOutlined!
    var enterText1Controller: MDCTextInputControllerOutlined!
    var eliminateKeywordsController: MDCTextInputControllerOutlined!
    
    var excludeEmployerController: MDCTextInputControllerOutlined!
    var employmentStatusController: MDCTextInputControllerOutlined!
    var industryController: MDCTextInputControllerOutlined!
    var functionalAreaController: MDCTextInputControllerOutlined!
    var roleController: MDCTextInputControllerOutlined!
    var currentLastEmployerController: MDCTextInputControllerOutlined!
    var jobTypeController: MDCTextInputControllerOutlined!
    var empTypeController: MDCTextInputControllerOutlined!
    var payrollTypeController: MDCTextInputControllerOutlined!
    
    var minAgeController: MDCTextInputControllerOutlined!
    var maxAgeController: MDCTextInputControllerOutlined!
    var marietalStatusController: MDCTextInputControllerOutlined!
    var categoryController: MDCTextInputControllerOutlined!
    var religionController: MDCTextInputControllerOutlined!
    var ethnicityController: MDCTextInputControllerOutlined!
    var languagesKnownController: MDCTextInputControllerOutlined!
    
    var qualificationController: MDCTextInputControllerOutlined!
    var specializationController: MDCTextInputControllerOutlined!
    var universityController: MDCTextInputControllerOutlined!
    var ugBatchController: MDCTextInputControllerOutlined!
    
    var companyArr = ["","","","",""]
    var domainArr = ["","","","","","","","","","",""]
    var salaryArr = ["","","","","","",""]
    
    var active = false
    var inactive = false
    var allCandidates = false
    var male = false
    var female = false
    var other = false
    var anyDefaultAny = false
    var differentlyAbled = false
    
    var from = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapForResign = UITapGestureRecognizer(target: self, action: #selector(handleTapForResign(_:)))
        tapForResign.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tapForResign)
        
        doneBtn.layer.cornerRadius = doneBtn.frame.height/2
        
        ugQualificationView.isHidden = true
        searchView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self as? UIGestureRecognizerDelegate
        ugQualificationTF.addGestureRecognizer(tap)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
        tap1.delegate = self as? UIGestureRecognizerDelegate
        qualificationTF.addGestureRecognizer(tap1)
        self.qualificationController = MDCTextInputControllerOutlined(textInput: qualificationTF)
        self.specializationController = MDCTextInputControllerOutlined(textInput: specializationTF)
        self.universityController = MDCTextInputControllerOutlined(textInput: universityTF)
        self.ugBatchController = MDCTextInputControllerOutlined(textInput: ugBatchTF)
        
        self.minAgeController = MDCTextInputControllerOutlined(textInput: minAgeTF)
        self.maxAgeController = MDCTextInputControllerOutlined(textInput: maxAgeTF)
        self.marietalStatusController = MDCTextInputControllerOutlined(textInput: marietalStatusTF)
        self.categoryController = MDCTextInputControllerOutlined(textInput: categoryTF)
        self.religionController = MDCTextInputControllerOutlined(textInput: religionTF)
        self.ethnicityController = MDCTextInputControllerOutlined(textInput: ethnicityTF)
        self.languagesKnownController = MDCTextInputControllerOutlined(textInput: languagesKnownTF)
        
        self.designationController = MDCTextInputControllerOutlined(textInput: designationTF)
        self.minExpController = MDCTextInputControllerOutlined(textInput: minExpTF)
        self.maxExpController = MDCTextInputControllerOutlined(textInput: maxExpTF)
        self.expInCurrentLastJobController = MDCTextInputControllerOutlined(textInput: expInCurrentLastJobTF)
        
        self.countryController = MDCTextInputControllerOutlined(textInput: countryTF)
        self.locationController = MDCTextInputControllerOutlined(textInput: locationTF)
        self.areaLocalityController = MDCTextInputControllerOutlined(textInput: areaLocalityTF)
        self.pincodeController = MDCTextInputControllerOutlined(textInput: pincodeTF)
        self.searchWithinKmController = MDCTextInputControllerOutlined(textInput: searchWithinKmTF)
        
        self.ugQualificationController = MDCTextInputControllerOutlined(textInput: ugQualificationTF)
        self.pgQualificationController = MDCTextInputControllerOutlined(textInput: pgQualificationTF)
        self.doctoratePhDController = MDCTextInputControllerOutlined(textInput: doctoratePhDTF)
        
        self.lastActiveController = MDCTextInputControllerOutlined(textInput: lastActiveTF)
        self.sortByController = MDCTextInputControllerOutlined(textInput: sortByTF)
        self.resumePerPageController = MDCTextInputControllerOutlined(textInput: resumePerPageTF)
        
        self.ctcRangeController = MDCTextInputControllerOutlined(textInput: ctcRangeTF)
        self.currencyController = MDCTextInputControllerOutlined(textInput: currencyTF)
        self.salaryFromController = MDCTextInputControllerOutlined(textInput: salaryFromTF)
        self.salaryToController = MDCTextInputControllerOutlined(textInput: salaryToTF)
        self.salaryPerAnnumOrController = MDCTextInputControllerOutlined(textInput: salaryPerAnnumOrTF)
        self.noticePeriodController = MDCTextInputControllerOutlined(textInput: noticePeriodTF)
        
        self.enterText2Controller = MDCTextInputControllerOutlined(textInput: enterText2TF)
        self.keywordsController = MDCTextInputControllerOutlined(textInput: keywordsTF)
        self.hiringForController = MDCTextInputControllerOutlined(textInput: hiringForTF)
        self.nameController = MDCTextInputControllerOutlined(textInput: nameTF)
        self.enterText1Controller = MDCTextInputControllerOutlined(textInput: enterText1TF)
        self.eliminateKeywordsController = MDCTextInputControllerOutlined(textInput: eliminateKeywordsTF)
        
        self.excludeEmployerController = MDCTextInputControllerOutlined(textInput: excludeEmployerTF)
        self.employmentStatusController = MDCTextInputControllerOutlined(textInput: employmentStatusTF)
        self.industryController = MDCTextInputControllerOutlined(textInput: industryTF)
        self.functionalAreaController = MDCTextInputControllerOutlined(textInput: functionalAreaTF)
        self.roleController = MDCTextInputControllerOutlined(textInput: roleTF)
        self.currentLastEmployerController = MDCTextInputControllerOutlined(textInput: currentLastEmployerTF)
        self.empTypeController = MDCTextInputControllerOutlined(textInput: employmentTypeTF)
        self.jobTypeController = MDCTextInputControllerOutlined(textInput: jobTypeTF)
        self.payrollTypeController = MDCTextInputControllerOutlined(textInput: payrollTypeTF)
        
        companyBtnView.backgroundColor = UIColor.white
        employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
        companyView.isHidden = false
        employmentView.isHidden = true
        experienceView.isHidden = true
        salaryView.isHidden = true
        locationView.isHidden = true
        educationView.isHidden = true
        personalView.isHidden = true
        displaySettingView.isHidden = true
        searchView.isHidden = true
        ugQualificationView.isHidden = true
        displaySetingViewHeight.constant = view.intrinsicContentSize.height
        // Do any additional setup after loading the view.
    }
   
    @IBAction func activePressed(_ sender: UIButton) {
        //active0, inactive1 and allCandidates2
        if sender.tag == 0{
            inactive = false
            allCandidates = false
            inactiveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            allCandidatesBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            active = !active
            if active == true{
                activeBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                activeBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 1{
            active = false
            allCandidates = false
            activeBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            allCandidatesBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            inactive = !inactive
            if inactive == true{
                inactiveBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                inactiveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 2{
            active = false
            inactive = false
            activeBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            inactiveBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            allCandidates = !allCandidates
            if allCandidates == true{
                allCandidatesBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                allCandidatesBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
    }
    @IBAction func checkPressed(_ sender: UIButton) {
        //male0, female1, other2, any default any3 and differently abled4
        if sender.tag == 0{
            female = false
            other = false
            anyDefaultAny = false
            femaleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            otherBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            anyDefaultAnyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            male = !male
            if male == true{
                maleBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                maleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 1{
            male = false
            other = false
            anyDefaultAny = false
            maleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            otherBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            anyDefaultAnyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            female = !female
            if female == true{
                femaleBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                femaleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 2{
            female = false
            male = false
            anyDefaultAny = false
            femaleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            maleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            anyDefaultAnyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            other = !other
            if other == true{
                otherBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                otherBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 3{
            female = false
            other = false
            male = false
            femaleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            otherBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            maleBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            anyDefaultAny = !anyDefaultAny
            if anyDefaultAny == true{
                anyDefaultAnyBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
                anyDefaultAnyBtn.setImage(UIImage(named: "uncheck"), for: .normal)
            }
        }
        if sender.tag == 4{
            differentlyAbled = !differentlyAbled
            if differentlyAbled == true{
            differentlyAbledBtn.setImage(UIImage(named: "check"), for: .normal)
            }else{
            differentlyAbledBtn.setImage(UIImage(named: "uncheck"), for: .normal)

            }
        }
    }
    @objc func handleTapForResign(_ sender: UITapGestureRecognizer) {
        nameTF.resignFirstResponder()
        enterText1TF.resignFirstResponder()
        hiringForTF.resignFirstResponder()
        keywordsTF.resignFirstResponder()
        enterText2TF.resignFirstResponder()
        eliminateKeywordsTF.resignFirstResponder()
        currentLastEmployerTF.resignFirstResponder()
        excludeEmployerTF.resignFirstResponder()
        employmentStatusTF.resignFirstResponder()
        payrollTypeTF.resignFirstResponder()
        employmentTypeTF.resignFirstResponder()
        jobTypeTF.resignFirstResponder()
        industryTF.resignFirstResponder()
        functionalAreaTF.resignFirstResponder()
        roleTF.resignFirstResponder()
        designationTF.resignFirstResponder()
        minExpTF.resignFirstResponder()
        maxExpTF.resignFirstResponder()
        expInCurrentLastJobTF.resignFirstResponder()
        ctcRangeTF.resignFirstResponder()
        currencyTF.resignFirstResponder()
        salaryFromTF.resignFirstResponder()
        salaryToTF.resignFirstResponder()
        salaryPerAnnumOrTF.resignFirstResponder()
        noticePeriodTF.resignFirstResponder()
        countryTF.resignFirstResponder()
        locationTF.resignFirstResponder()
        areaLocalityTF.resignFirstResponder()
        pincodeTF.resignFirstResponder()
        searchWithinKmTF.resignFirstResponder()
        ugQualificationTF.resignFirstResponder()
        pgQualificationTF.resignFirstResponder()
        doctoratePhDTF.resignFirstResponder()
        qualificationTF.resignFirstResponder()
        specializationTF.resignFirstResponder()
        universityTF.resignFirstResponder()
        ugBatchTF.resignFirstResponder()
        minAgeTF.resignFirstResponder()
        maxAgeTF.resignFirstResponder()
        marietalStatusTF.resignFirstResponder()
        categoryTF.resignFirstResponder()
        religionTF.resignFirstResponder()
        ethnicityTF.resignFirstResponder()
        languagesKnownTF.resignFirstResponder()
        lastActiveTF.resignFirstResponder()
        sortByTF.resignFirstResponder()
        resumePerPageTF.resignFirstResponder()
       }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        enterText1TF.resignFirstResponder()
        hiringForTF.resignFirstResponder()
        keywordsTF.resignFirstResponder()
        enterText2TF.resignFirstResponder()
        eliminateKeywordsTF.resignFirstResponder()
        currentLastEmployerTF.resignFirstResponder()
        excludeEmployerTF.resignFirstResponder()
        employmentStatusTF.resignFirstResponder()
        payrollTypeTF.resignFirstResponder()
        employmentTypeTF.resignFirstResponder()
        jobTypeTF.resignFirstResponder()
        industryTF.resignFirstResponder()
        functionalAreaTF.resignFirstResponder()
        roleTF.resignFirstResponder()
        designationTF.resignFirstResponder()
        minExpTF.resignFirstResponder()
        maxExpTF.resignFirstResponder()
        expInCurrentLastJobTF.resignFirstResponder()
        ctcRangeTF.resignFirstResponder()
        currencyTF.resignFirstResponder()
        salaryFromTF.resignFirstResponder()
        salaryToTF.resignFirstResponder()
        salaryPerAnnumOrTF.resignFirstResponder()
        noticePeriodTF.resignFirstResponder()
        countryTF.resignFirstResponder()
        locationTF.resignFirstResponder()
        areaLocalityTF.resignFirstResponder()
        pincodeTF.resignFirstResponder()
        searchWithinKmTF.resignFirstResponder()
        ugQualificationTF.resignFirstResponder()
        pgQualificationTF.resignFirstResponder()
        doctoratePhDTF.resignFirstResponder()
        qualificationTF.resignFirstResponder()
        specializationTF.resignFirstResponder()
        universityTF.resignFirstResponder()
        ugBatchTF.resignFirstResponder()
        minAgeTF.resignFirstResponder()
        maxAgeTF.resignFirstResponder()
        marietalStatusTF.resignFirstResponder()
        categoryTF.resignFirstResponder()
        religionTF.resignFirstResponder()
        ethnicityTF.resignFirstResponder()
        languagesKnownTF.resignFirstResponder()
        lastActiveTF.resignFirstResponder()
        sortByTF.resignFirstResponder()
        resumePerPageTF.resignFirstResponder()
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
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        ugQualificationView.isHidden = false
    }
    @objc func handleTap1(_ sender: UITapGestureRecognizer) {
        from = ""
        from = "ugQualificationTF"
        ugQualificationView.isHidden = true
        searchView.isHidden = false
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func clearAllPressed(_ sender: UIButton) {
        currencyTF.text = ""
        salaryFromTF.text = ""
        salaryToTF.text = ""
        noticePeriodTF.text = ""
        salaryPerAnnumOrTF.text = ""
        
        nameTF.text = ""
        enterText1TF.text = ""
        hiringForTF.text = ""
        keywordsTF.text = ""
        enterText2TF.text = ""
        eliminateKeywordsTF.text = ""
        
        industryTF.text = ""
        functionalAreaTF.text = ""
        roleTF.text = ""
        jobTypeTF.text = ""
        payrollTypeTF.text = ""
        companyArr.removeAll()
        domainArr.removeAll()
        salaryArr.removeAll()
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
    }
    @IBAction func searchPresesed(_ sender: UIButton) {
        companyArr.removeAll()
        domainArr.removeAll()
        salaryArr.removeAll()
        salaryArr.insert(currencyTF.text ?? "", at: 0)
        salaryArr.insert(salaryFromTF.text ?? "", at: 1)
        salaryArr.insert(salaryToTF.text ?? "", at: 2)
        salaryArr.insert(salaryPerAnnumOrTF.text ?? "", at: 3)
        salaryArr.insert(noticePeriodTF.text ?? "", at: 6)
        
        companyArr.insert(nameTF.text ?? "", at: 0)
        companyArr.insert(enterText1TF.text ?? "", at: 1)
        companyArr.insert(hiringForTF.text ?? "", at: 2)
        companyArr.insert(keywordsTF.text ?? "", at: 3)
        companyArr.insert(enterText2TF.text ?? "", at: 4)
        companyArr.insert(eliminateKeywordsTF.text ?? "", at: 4)
        
        domainArr.insert(industryTF.text ?? "", at: 0)
        domainArr.insert(functionalAreaTF.text ?? "", at: 1)
        domainArr.insert(roleTF.text ?? "", at: 2)
        //domainArr.insert(maxExpTF.text ?? "", at: 4)
        domainArr.insert(jobTypeTF.text ?? "", at: 5)
        //domainArr.insert(empTypeTF.text ?? "", at: 6)
        domainArr.insert(payrollTypeTF.text ?? "", at: 7)
        
    }
    @IBAction func drawerBtnPressed(_ sender: UIButton) {
        // tag company 0, domain 1, Experience 2, salary 3, location 4, education 5, personal 6 and Display setting 7.
        if sender.tag == 0{
            companyBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = false
            employmentView.isHidden = true
            experienceView.isHidden = true
            salaryView.isHidden = true
            locationView.isHidden = true
            educationView.isHidden = true
            personalView.isHidden = true
            displaySettingView.isHidden = true
        }
        if sender.tag == 1{
            employmentBtnView.backgroundColor = UIColor.white
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = false
            experienceView.isHidden = true
            salaryView.isHidden = true
            locationView.isHidden = true
            educationView.isHidden = true
            personalView.isHidden = true
            displaySettingView.isHidden = true
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
        if sender.tag == 2{
            experienceBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = true
            experienceView.isHidden = false
            salaryView.isHidden = true
            locationView.isHidden = true
            educationView.isHidden = true
            personalView.isHidden = true
            displaySettingView.isHidden = true
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
        if sender.tag == 3{
            salaryBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = true
            experienceView.isHidden = true
            salaryView.isHidden = false
            locationView.isHidden = true
            educationView.isHidden = true
            personalView.isHidden = true
            displaySettingView.isHidden = true
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
        if sender.tag == 4{
            locationBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = true
            experienceView.isHidden = true
            salaryView.isHidden = true
            locationView.isHidden = false
            educationView.isHidden = true
            personalView.isHidden = true
            displaySettingView.isHidden = true
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
        if sender.tag == 5{
            educationBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = true
            experienceView.isHidden = true
            salaryView.isHidden = true
            locationView.isHidden = true
            educationView.isHidden = false
            personalView.isHidden = true
            displaySettingView.isHidden = true
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
        if sender.tag == 6{
            personalBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            displaySettingBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = true
            experienceView.isHidden = true
            salaryView.isHidden = true
            locationView.isHidden = true
            educationView.isHidden = true
            personalView.isHidden = false
            displaySettingView.isHidden = true
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
        if sender.tag == 7{
            displaySettingBtnView.backgroundColor = UIColor.white
            employmentBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            experienceBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            salaryBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            locationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            educationBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            personalBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyBtnView.backgroundColor = UIColor(red: 238/256, green: 238/256, blue: 238/256, alpha: 1)
            companyView.isHidden = true
            employmentView.isHidden = true
            experienceView.isHidden = true
            salaryView.isHidden = true
            locationView.isHidden = true
            educationView.isHidden = true
            personalView.isHidden = true
            displaySettingView.isHidden = false
            searchView.isHidden = true
            ugQualificationView.isHidden = true
        }
    }
    
    @IBAction func selectForSpecificCollegeCheck(_ sender: UIButton) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.textLabel?.text = "Arfat"
        return cell
    }
    
    @IBAction func searchDonePressed(_ sender: UIButton) {
        
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

class SearchTableViewCell: UITableViewCell {
    
}
