//
//  RegisterViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 24..
//  Copyright © 2017년 김민서. All rights reserved.
// 

import UIKit
import Alamofire

class RegisterViewController: UIViewController, UITextFieldDelegate {

    
    let URL_USER_REGISTER = "http://175.208.235.91:80/user/"
    
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordC: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRegister.layer.cornerRadius = 15
        
        keyboardTypeAsciiCapable(userID)
        keyboardTypeAsciiCapable(password)
        keyboardTypeAsciiCapable(nickName)
        keyboardTypeAsciiCapable(passwordC)
        // Do any additional setup after loading the view.
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
    
    func keyboardTypeAsciiCapable(_ textfield : UITextField) {
        textfield.keyboardType = UIKeyboardType.asciiCapable
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        
        if(nickName.text == "")
        {
            myAlert("회원가입 실패", message: "닉네임을 입력해주세요")
        } else if(userID.text == "")
        {
            myAlert("회원가입 실패", message: "아이디(전화번호)를 입력해주세요")
        } else if(password.text == "")
        {
            myAlert("회원가입 실패", message: "비밀번호를 입력해주세요")
        } else if(passwordC.text == "")
        {
            myAlert("회원가입 실패", message: "비밀번호 확인을 입력해주세요")
        } else if(password.text != passwordC.text)
        {
            myAlert("비밀번호를 확인해주세요", message: "비밀번호와 비밀번호 확인이\n일치하지 않습니다")
        } else {
            
            myAlert("회원가입 성공", message: "회원가입에 성공하셨습니다.")
            let parameters = [
                "id" : userID.text!,
                "password" : password.text!,
                "username" : nickName.text!
            ] as [String : Any]
            
            Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
                {
                    response in
                    //printing response
                    print(response)                    
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
