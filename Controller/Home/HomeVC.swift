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
        getData()
        contentTableView.delegate = self
        contentTableView.dataSource = self
        initRefresh()
        
    }

    @IBAction func searchIconPressed(_ sender: Any) {
        
    }

    @IBAction func currentLocationPressed(_ sender: Any) {
    }
    
    
}

extension HomeVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleton.modelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "contentTableViewCell", for: indexPath) as! ContentCell
        
        cell.userNameLabel.text = singleton.modelData[indexPath.row].userId
        cell.totalDistanceLabel.text = String(describing: singleton.modelData[indexPath.row].distance)
        cell.totalWalkingPointLabel.text = String(describing: singleton.modelData[indexPath.row].walkingPoint)
        cell.lastUpdatedDate.text
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func initRefresh (){
        let refresh = UIRefreshControl()
        
        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "산책로 새로고침")
        
        if #available(iOS 10.0, *){
            contentTableView.refreshControl = refresh
        } else{
            contentTableView.addSubview(refresh)
        }
    }
    @objc func updateUI(refresh: UIRefreshControl){
        getData()
        
        refresh.endRefreshing()
        contentTableView.reloadData()
    }
}
