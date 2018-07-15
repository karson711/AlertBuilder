//
//  AlertControllerBulider.swift
//  AlertBuilder
//
//  Created by kunge on 2018/7/15.
//  Copyright © 2018年 kunge. All rights reserved.
//

import UIKit

class AlertControllerBulider: NSObject {

    private var params:BuilderParams
    
    init(params:BuilderParams) {
        self.params = params
    }
    
    func show() {
        //组装
        let alert = UIAlertController(title: self.params.title, message: self.params.message, preferredStyle: UIAlertControllerStyle.alert)
        if (self.params.confirmText) != nil {
            //添加点击事件
            alert.addAction(UIAlertAction(title: self.params.confirmText, style: UIAlertActionStyle.destructive, handler: self.params.confirmAction))
        }
        
        if (self.params.cancelText) != nil {
            //添加点击事件
            alert.addAction(UIAlertAction(title: self.params.cancelText, style: UIAlertActionStyle.destructive, handler: self.params.cancelAction))
        }
        
        //显示
        self.params.context.present(alert, animated: true, completion: nil)
    }
    
    //角色四：参数类
    class BuilderParams: NSObject {
        var context:UIViewController
        var title:String?
        var message:String?
        var confirmText:String?
        var cancelText:String?
        
        //确认按钮
        var confirmAction:((UIAlertAction)->Void)?
        
        //取消按钮
        var cancelAction:((UIAlertAction)->Void)?
        
        init(_ context:UIViewController) {
            self.context = context
        }
    }
    
    //角色二：构建者->Builder（核心）
    class Builder: NSObject {
        private var params:BuilderParams
        init(_ context:ViewController) {
            self.params = BuilderParams.init(context)
        }
        
        func setTitle(_ title:String) -> Builder {
            self.params.title = title
            return self
        }
        
        func setMessag(_ message:String) -> Builder {
            self.params.message = message
            return self
        }
        
        func setConfrimText(_ confirmText:String) -> Builder {
            self.params.confirmText = confirmText
            return self
        }
        
        func setCancelText(_ cancelText:String) -> Builder {
            self.params.cancelText = cancelText
            return self
        }
        
        func setConfirmAction(_ confirmAction:@escaping ((UIAlertAction)->Void)) -> Builder {
            self.params.confirmAction = confirmAction
            return self
        }
        
        func setCancelAction(_ cancelAction:@escaping ((UIAlertAction)->Void)) -> Builder {
            self.params.cancelAction = cancelAction
            return self
        }
        
        func build() -> AlertControllerBulider {
            return AlertControllerBulider(params: self.params)
        }
    }
    
}
