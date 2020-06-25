//
//  Rows.swift
//  TestAssignment
//
//  Created by Himanshu Sharma on 24/06/20.
//  Copyright © 2020 Himanshu Sharma. All rights reserved.
//

import Foundation

struct Rows : Decodable {
	let title : String?
	let description : String?
	let imageHref : String?

  init(title:String, description: String, imageName: String){
          self.title = title
          self.description =  description
          self.imageHref = imageName
      }
  }

