//
//  ProductCell.swift
//  Sample_TableView
//
//  Created by Esat Kemal Ekren on 5.04.2018.
//  Copyright © 2018 Esat Kemal Ekren. All rights reserved.
//

import UIKit

class CustomCell : UITableViewCell {

    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
     let subTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.boldSystemFont(ofSize: 11)
        lbl.sizeToFit()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
     let pictureImageView : UIImageView = {
          
          let imgView = UIImageView()
          imgView.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
          imgView.translatesAutoresizingMaskIntoConstraints = true // enable autolayout
          imgView.clipsToBounds = true
          return imgView
    }()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pictureImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)

        
        pictureImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop:5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)

        let stackView = UIStackView(arrangedSubviews: [titleLabel
        ,subTitleLabel])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        addSubview(stackView)
      stackView.anchor(top: topAnchor,left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop:5, paddingLeft: 5, paddingBottom: 0, paddingRight: 2, width: 0, height:0, enableInsets: false)
   }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
