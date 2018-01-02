//
//  TableViewCell.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 02/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    @IBOutlet weak var teste1Lbl: UILabel!
    @IBOutlet weak var teste2Lbl: UILabel!
    @IBOutlet weak var teste3Lbl: UILabel!
    @IBOutlet weak var testeImageCell: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
