//
//  ListTableViewCell.swift
//  autolayoutRowHeiht
//
//  Created by zhengxl on 2017/8/24.
//  Copyright © 2017年 zhengxl. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var subTitleLab: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellWithTableView(_ tableView: UITableView) -> ListTableViewCell {
        
        //Swift-优雅的 NSStringFromClass 替代方案
        let ID: String =  String(describing: ListTableViewCell.self) //"ConsumeTableViewCell"
        
        var cell: ListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ID) as? ListTableViewCell
        
        if cell == nil {
            // 从xib中加载cell
            cell = Bundle.main.loadNibNamed(ID, owner: nil, options: nil)?.last as? ListTableViewCell
        }
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell!;
        
        
    }
    
    func setCell(_ imageStr: String?, title: String?, subTitle: String?) {
        
        imageV.image = UIImage(named: imageStr!)
        
        titleLab.text = title
        
        subTitleLab.text = subTitle
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
