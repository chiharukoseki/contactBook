//
//  stampViewController.swift
//  contactBook
//
//  Created by 小関千晴 on 2017/07/04.
//  Copyright © 2017年 小関千晴. All rights reserved.
//

import UIKit


class stampViewController: UIViewController {
    @IBAction func UIbutton(_ sender: Any) {
        
        // HomeViewControllerとNavigationControllerをつなげる
        let stampViewController = stampViewController()
        let navigationController = UINavigationController(rootViewController: stampViewController)
        
        // NavigationControllerをfront, SidebarTableViewControllerをrearにし、
        // SWRevealViewControllerに接続
        let frontViewController  = navigationController
        let rearViewController  = ()
        let swRevealVC = SidebarTableViewController(rearViewController: rearViewController, frontViewController: frontViewController);
        swRevealVC.toggleAnimationType = SWRevealToggleAnimationType.EaseOut;
        swRevealVC.toggleAnimationDuration = 0.30;
        
        // SWRevealViewControllerに遷移する
        presentViewController(swRevealVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        func Uibutton(_ sender: Any) {
        }
        super.viewDidLoad()
        
        
        //target とactionを設定
        if self.revealViewController() != nil {
            uiBarButtonItem.target = self.revealViewController()
            uiBarButtonItem.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }
        
    
        
        
    func didReceiveMemoryWarning() {
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
        
    
        
    func buttonAction(sender: UIButton!) {
        // HomeViewControllerとNavigationControllerをつなげる
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
            
        // NavigationControllerをfront, SidebarTableViewControllerをrearにし、
        // SWRevealViewControllerに接続
        let frontViewController  = navigationController
        let rearViewController  = ()
        let swRevealVC = SidebarTableViewController(rearViewController: rearViewController,frontViewController: frontViewController);
            swRevealVC.toggleAnimationType = SWRevealToggleAnimationType.EaseOut;
            swRevealVC.toggleAnimationDuration = 0.30;
            
        // SWRevealViewControllerに遷移する
        presentViewController(swRevealVC, animated: true, completion: nil)
            
        }  

}
}
