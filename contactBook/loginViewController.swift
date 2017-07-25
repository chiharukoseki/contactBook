//
//  loginViewController.swift
//  contactBook
//
//  Created by 小関千晴 on 2017/07/03.
//  Copyright © 2017年 小関千晴. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //文字列をURlに変換
        let favoriteURL = URL(string: "https://electric-contact-book-swill.c9users.io/loginUser.php")!
        //URLをネットワーク接続可能な状態に変換する
        let urlRequest = URLRequest(url: favoriteURL)
        //webViewに映す
        self.webView.loadRequest(urlRequest as URLRequest)
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
