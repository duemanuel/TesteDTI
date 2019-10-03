//
//  PostClasses.swift
//  TesteDTI
//
//  Created by Eduardo Oliveira on 02/10/2019.
//  Copyright © 2019 eduardooliveira. All rights reserved.
//

import Foundation

struct BlogInfo: Codable{
	let data: String
	let title: String
	let description: String
	
	init(data: String, title: String, description: String){
		self.data = data
		self.title = title
		self.description = description
	}
}
