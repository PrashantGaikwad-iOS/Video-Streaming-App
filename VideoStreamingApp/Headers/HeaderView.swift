//
//  HeaderView.swift
//  VideoStreamingApp
//
//  Created by Prashant Gaikwad on 17/04/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import UIKit

class HeaderView: UITableViewCell {

    @IBOutlet weak var videoThumbnailImgView: UIView!
    @IBOutlet weak var videoDescTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
