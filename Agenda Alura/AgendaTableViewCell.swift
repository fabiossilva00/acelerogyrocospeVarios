//
//  AgendaTableViewCell.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 22/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fotoImageCell: UIImageView!
    @IBOutlet weak var nomeLabelCell: UILabel!
    
    func configCell(_ agenda: AgendaDados) {
        
        nomeLabelCell.text = agenda.nome
        fotoImageCell.layer.cornerRadius = self.fotoImageCell.frame.width / 2
        fotoImageCell.layer.masksToBounds = true
        if let fotoImage = agenda.imagem as? UIImage {
            fotoImageCell.image = fotoImage
            
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

}
