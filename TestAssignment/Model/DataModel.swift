//
//  DataModel.swift
//  TestAssignment
//
//  Created by Himanshu Sharma on 24/06/20.
//  Copyright © 2020 Himanshu Sharma. All rights reserved.
//

import Foundation

struct DataModel : Decodable {
	let title : String?
  var rows = [Rows]()

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case rows = "rows"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
    rows = try values.decodeIfPresent([Rows].self, forKey: .rows) ?? []
	}

}
