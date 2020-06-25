//
//  ListViewModel.swift
//  MVVMYOUTUBE
//
//  Created by Himanshu Sharma on 24/06/20.
//  Copyright © 2020 Himanshu Sharma. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {

    var title : String?
    var description1 : String?
    var imageHref : String?
    
   // D I
    init(movie:Rows){
        self.title = movie.title
        self.description1 = movie.description ?? ""
        self.imageHref = movie.imageHref
    }
    
}
