//
//  ViewController.swift
//  autolayoutRowHeiht
//
//  Created by zhengxl on 2017/8/24.
//  Copyright © 2017年 zhengxl. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.main.bounds.size.width
let SCREENHEIGHT = UIScreen.main.bounds.size.height


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var imageStr: String = "tuijian"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44;
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ListTableViewCell.cellWithTableView(tableView)
        
        cell.setCell(imageStr, title: imageStr, subTitle: self.getCellSubTitle(index: indexPath.row) )
        
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func getCellSubTitle(index: Int) -> String {
        
        var str1 = "我是subtitle"
        
        for _ in 0..<index {
            str1 = str1 + str1
        }

        return str1
        
    }
    

    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    //MARK: - lazy
    lazy var listTableView: UITableView = {
        var tempTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT))
        tempTableView.dataSource = self
        tempTableView.delegate = self
        
        return tempTableView
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.addSubview(self.listTableView)
        
        listTableView.estimatedRowHeight = 44
        
        listTableView.reloadData()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

