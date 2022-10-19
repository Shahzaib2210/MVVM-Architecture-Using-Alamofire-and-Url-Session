//
//  UserTableViewCell.swift
//  MVVM
//
//  Created by Shahzaib Mumtaz on 19/10/2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UId: UILabel!
    @IBOutlet weak var UTitle: UILabel!
    @IBOutlet weak var UStatus: UILabel!
    
    var modelUser:UserModel?{
        didSet {
            userConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func userConfiguration() {
        let status = modelUser?.GetStatusColor()
        UStatus.text = status?.0
        backgroundColor = status?.1
        UId.text = "\(modelUser?.id ?? 0)"
        UTitle.text = modelUser?.title
    }
}
