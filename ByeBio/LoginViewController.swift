//
//  LoginViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 24..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    let URL_USER_LOGIN = "http://175.208.235.91:80/user/"
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var registerButton:UIButton!
    
    @IBOutlet weak var icon:UIImageView!
    @IBOutlet weak var userID : UITextField!
    @IBOutlet weak var password : UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func keyboardTypeAsciiCapable(_ textfield : UITextField) {
        textfield.keyboardType = UIKeyboardType.asciiCapable
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 1
        
        keyboardTypeAsciiCapable(userID)
        keyboardTypeAsciiCapable(password)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let parameters = [
            "id":userID.text!,
            "password":password.text!
        ]

        Alamofire.request(URL_USER_LOGIN, method: .get, parameters: parameters).responseJSON
            {
                response in
                //응답 출력
                print(response)
    
                //서버로 제이선값 보내기
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
    
                    //에러가 없을때
                    
                    if((jsonData.value(forKey: "result") as! NSNumber)).boolValue == true{
                        print(result)
    
                        //리스폰에서 데이터가져오기
    
                        let user = jsonData.value(forKey: "user") as! NSDictionary
    
                        //유저 정보 가져오기
                        let userId = user.value(forKey: "id") as! String
                        let userName = user.value(forKey: "username") as! String
    
                        //유저 정보 저장
                        self.defaultValues.set(userId, forKey: "id")
                        self.defaultValues.set(userName, forKey: "username")
                        
                        //                뷰 ㅈ전환
                        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "MainView")
                        
                        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        
                        self.present(uvc, animated: true, completion: nil)
                    }
                    
                    else {
                        self.myAlert("경고", message:"없는 계정입니다")
                    }
                }

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
}
