//
//  AllVC.swift
//  VoxApp
//
//  Created by Arfat Inamdar on 30/04/20.
//  Copyright © 2020 Arfat Inamdar. All rights reserved.
//

import UIKit

class DiscountsAndOfferVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var allImagesCollectionView: UICollectionView!
    @IBOutlet weak var bottomLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var discountCollectionViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        scrollViewHeight.constant = view.intrinsicContentSize.height/2
        // Do any additional setup after loading the view.
    }
    
    func apiCall(){
       let params = ["username":"john", "password":"123456"] as Dictionary<String, String>
        var urlReq = URLRequest(url: URL(string: "https://test.chatongo.in/testdata.json")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        urlReq.httpMethod = "GET"
        urlReq.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        urlReq.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlReq) { (data, resp, err) in
            if err != nil{
                let alert = UIAlertController(title: "No internet", message: "Check your net connection or call admin", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                if let dataResp = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! NSDictionary
                    let data = json.value(forKey: "data") as! NSDictionary
                    //self.recordsArr = data.value(forKey: "Records") as! [NSDictionary]
                    DispatchQueue.main.async {
                    self.allImagesCollectionView.reloadData()
                    }
                    
                }catch{
                    
                }
                }
            }
        }.resume()
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountsCollectionViewCell", for: indexPath) as! DiscountsCollectionViewCell
        cell.imageView.image = UIImage(named: "abdul")
        cell.imageView.layer.cornerRadius = 10
        cell.companyLbl.text = "Amazon.in"
        discountCollectionViewHeight.constant = (15/3) * (view.frame.height - 400)/4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 95)/3 , height: (view.frame.height - 400)/4)
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

}
class DiscountsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var companyLbl: UILabel!
    
}
