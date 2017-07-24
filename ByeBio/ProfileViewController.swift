//
//  ProfileViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 25..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    let URL_USER_PROFILE = "http://175.208.235.91:80/user/"
    
    @IBOutlet weak var prefix: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var totalWalk: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(URL_USER_PROFILE, method: .get).responseJSON
            {
                response in
                //printing response
                print(response)
                
                let result = response.result.value
                let jsonData = result as! NSDictionary
                var total = "0"
                
                total = jsonData.value(forKey: "step") as! String
                
                self.nickName.text! = "\(jsonData.value(forKey: "username") as! String)"
                
                self.totalWalk.text! = "성공한 미션 수 : " + "\(jsonData.value(forKey: "step") as! String)"
                
                if Int(total)! >= 100 {
                    self.prefix.text! = "walker"
                }else if Int(total)! < 100 && Int(total)! >= 90 {
                    self.prefix.text! = "semi\nwalker"
                }else if Int(total)! < 90 && Int(total)! >= 60 {
                    self.prefix.text! = "minor\nwalker"
                }else if Int(total)! < 60 && Int(total)! >= 30 {
                    self.prefix.text! = "Not\nNewbie"
                }else{
                    self.prefix.text! = "Newbie"
                }
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
