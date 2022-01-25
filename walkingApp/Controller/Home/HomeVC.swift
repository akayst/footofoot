//
//  HomeVC.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/16.
//

import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchViewTextField: UIView!
    @IBOutlet var searchIcon: UIButton!
    
    @IBOutlet var currentLocation: UIButton!
    
    @IBOutlet var userProfileImageView: UIImageView!
    
    @IBOutlet var walkingPoint: UILabelDeviceClass!
    @IBOutlet var distancePoint: UILabelDeviceClass!
    
    @IBOutlet var totalPercentage: UILabelDeviceClass!
    
    
    @IBOutlet var contentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTableView.delegate = self
        contentTableView.dataSource = self
        
    }
    
    @IBAction func searchIconPressed(_ sender: Any) {
    }
    
    @IBAction func currentLocationPressed(_ sender: Any) {
    }
    
    
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = contentTableView.dequeueReusableCell(withIdentifier: "contentTableViewCell", for: indexPath) as! ContentCell
        
        // 데이터 넣기
        
        
//        return cell
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
