//
//  ViewController.swift
//  AlertBuilder
//
//  Created by kunge on 2018/7/15.
//  Copyright © 2018年 kunge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ClickAction(_ sender: Any) {
        AlertControllerBulider.Builder(self)
        .setTitle("通知")
        .setMessag("明天下雨")
        .setConfrimText("确定")
            .setConfirmAction({ (action) in
                print("点击确定")
            })
        .setCancelText("取消")
            .setCancelAction { (action) in
                print("点击取消")
        }
        .build().show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

