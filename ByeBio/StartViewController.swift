//
//  StartViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 24..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var btnStart:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStart.layer.borderWidth = 1
        btnStart.layer.cornerRadius = 17
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
