//
//  loginViewController.swift
//  contactBook
//
//  Created by 小関千晴 on 2017/07/03.
//  Copyright © 2017年 小関千晴. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var mailTextBox: UITextField!
    @IBAction func mailTextBox(_ sender: Any) {
    }
    
    @IBOutlet weak var passTextBox: UITextField!
    @IBAction func passTextBox(_ sender: Any) {
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButton(_ sender: Any) {
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
