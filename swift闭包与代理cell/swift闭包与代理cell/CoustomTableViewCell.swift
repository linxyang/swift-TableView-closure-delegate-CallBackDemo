//
//  CoustomTableViewCell.swift
//  swift闭包与代理cell
//
//  Created by Yanglixia on 16/10/22.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

import UIKit

/// 定义闭包，传cell本身与右边按钮
typealias rightBtnCallBack = (cell:CoustomTableViewCell,rightBtn:UIButton)->()

// MARK: - 定义协议

// Swift中定义代理协议需要继承于 NSObjectProtocol
// 并且默认情况下所有的代理方法都是必须实现的
protocol CoustomTableViewCellDelgate:NSObjectProtocol {
    func CoustomTableViewCellLeftBtnClick(cell:CoustomTableViewCell?)
}

// MARK: - 类
class CoustomTableViewCell: UITableViewCell {

    /// 定义代理对象  代理属性前面一定要写weak
    weak var delegate:CoustomTableViewCellDelgate?
    
    var callBack:rightBtnCallBack?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     左边按钮点击，用代理通知并传值出去
     
     - parameter sender: 按钮本身
     */
    @IBAction func leftBtnClick(sender: AnyObject) {
        
        /**
         默认会自己去判断代理对象有没有去实现代理方法
         */
        delegate?.CoustomTableViewCellLeftBtnClick(self)
        
    }
    
    /**
     右边按钮点击，用闭包通知点击了并传值出去
     
     - parameter sender: 按钮本身
     */
    @IBAction func rightBtnClick(sender: AnyObject) {
        
        // 调用闭包
        /// 方法一 可选类型解
        if let block = callBack {// 解包
            block(cell: self, rightBtn: sender as! UIButton)
        }
        
        /// 方法二 guad守护一下可选类型
//        guard let rightBlock = callBack else { // guad守护一下
//            return
//        }
//        rightBlock(cell:self,rightBtn:sender as! UIButton)
    }
    
}
