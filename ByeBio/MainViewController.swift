//
//  MainViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 24..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import CoreMotion
import Alamofire

class MainViewController: UIViewController {
    
    var isOn = false
    let url = "http://175.208.235.91:80/user/"

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    
    var win = 0

    
    @IBOutlet weak var lblCircle:UILabel!
    var motionManager = CMMotionManager()
    var count = 111;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCircle.layer.masksToBounds = false
        lblCircle.layer.cornerRadius = lblCircle.frame.height/2
        lblCircle.clipsToBounds = true
        
        lblCircle.text = "\(count)"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                if myData.rotationRate.x > 1.5 {
//                print("YOUR TILTED YOUR DEVICE")
                self.count += 1
                self.lblCircle.text = "\(self.count)"
                    
                    if self.count >= 100 {
                        self.myAlert("성공", message: "당신은 오늘 치킨을 먹을 자격이 있습니다")
                    }
                }
            }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
