//
//  ViewController.swift
//  swift闭包与代理cell
//
//  Created by Yanglixia on 16/10/22.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(tableView)
        navigationItem.title = "测试"
        print("\(CoustomTableViewCell.self)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 懒加载
    private lazy var tableView:UITableView = {
    
        let tab = UITableView(frame: CGRect(origin: CGPointZero, size: CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)), style: .Plain)
        tab.dataSource = self;
        tab.delegate = self;
        tab.registerNib(UINib(nibName:"CoustomTableViewCell" , bundle: nil), forCellReuseIdentifier: "customCell")
        return tab
    }();

}

// MARK: - 代理与数据源方法
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell") as! CoustomTableViewCell
        
        /// 设置代理
        cell.delegate = self;

        /// 给闭包赋值
        cell.callBack = { cell,rightBtn in
            print("右边按钮点击了，闭包执行了")
            print("cell的信息：\(cell) \n按钮的名字为:\(rightBtn.titleForState(.Normal)!)")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - cell点击左边按钮的代理方法
extension ViewController:CoustomTableViewCellDelgate {
    func CoustomTableViewCellLeftBtnClick(cell: CoustomTableViewCell?) {
        print("点击了左边的按钮，代理方法执行了")
    }
}
