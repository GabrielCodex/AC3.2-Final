//
//  FeedTableViewCell.swift
//  AC3.2-Final
//
//  Created by John Gabriel Breshears on 2/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    var feedImage = UIImageView()
    //Need to create text
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Do Work Here
        
        feedImage.clipsToBounds = true
        feedImage.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
