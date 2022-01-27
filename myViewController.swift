import Foundation
import UIKit
import FloatingPanel
class myViewController : UIViewController, UITextFieldDelegate{

    @IBOutlet var distanceTF: UITextField!
    @IBOutlet var walkingpointTF: UITextField!
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.distanceTF.text = "거리"
        self.walkingpointTF.text = "발걸음"
            self.distanceTF.addTarget(self, action: #selector(self.textChange(_:)), for: .touchDown)
            
    }

    
    @objc func textChange(_ sender:Any?){
        self.distanceTF.text = "\(round((ad?.distanceInfo!)!))m"
        self.walkingpointTF.text = "\(round((ad?.walkingPointInfo!)!)) 보"
    }

}
