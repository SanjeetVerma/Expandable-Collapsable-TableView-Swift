//
//  CollapsibleTableViewCell.swift
//  ExpandableView
//
//  Created by Sanjeet Verma on 18/11/17.
//  Copyright © 2017 Sanjeet Verma. All rights reserved.
//

import UIKit

class CollapsibleTableViewCell: UITableViewCell {

    let separator = UIView(frame: CGRect.zero)
    
    @IBOutlet var rightArrowImage: UIImageView!
    @IBOutlet var MenuLable: UILabel!
    @IBOutlet var MenuIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configure(viewModel: CollapsableViewModel) {
        self.MenuLable?.text = viewModel.label
        self.MenuIcon.image = viewModel.image
        if(viewModel.isChild == true) {
            separator.backgroundColor = UIColor.red
            self.backgroundColor = UIColor.lightGray
            contentView.addSubview(separator)
            self.rightArrowImage.isHidden = false
        } else {
            self.backgroundColor = UIColor.white
            self.rightArrowImage.isHidden = true
            separator.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let separatorHeight = 1 / UIScreen.main.scale
    
        separator.frame = CGRect(x: separatorInset.left, y: contentView.bounds.height - separatorHeight, width: contentView.bounds.width-separatorInset.left-separatorInset.right, height: separatorHeight)
    }

}
