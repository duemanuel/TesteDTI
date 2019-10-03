//
//  BlogApi.swift
//  TesteDTI
//
//  Created by Eduardo Oliveira on 02/10/2019.
//  Copyright © 2019 eduardooliveira. All rights reserved.
//

import Foundation
import Alamofire

class BlogApi {
	
	static private let token = "?access_token=dtidigital"
	static private let urlBase = "http://localhost:3000/api/blog"
	
	
	//Carrega todos os posts
	class func loadAllPosts(onComplete: @escaping ([BlogInfo?]) -> Void){
		
		let urlCompleta = urlBase + token
		
		//Realiza a requisição
		Alamofire.request(urlCompleta).responseJSON { (response) in
			print(urlCompleta)
			guard let result = response.data
				else {
					onComplete([nil])
					return					
				}
			do{
				let blogInfo = try JSONDecoder().decode([BlogInfo?].self, from: result) as! [BlogInfo]
				onComplete(blogInfo)
			}catch{
				print(error.localizedDescription)
				onComplete([nil])
			}
		}
	}
	
	//Salva post novo
	class func saveNewPost(post: BlogInfo){
		
		let urlCompleta = urlBase + token
		let jsonData = try? JSONEncoder().encode(post)
		
		var request = URLRequest(url: URL(string: urlCompleta)!)
		request.httpMethod = HTTPMethod.post.rawValue
		request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
		request.httpBody = jsonData
		
		//Realiza a requisição
		Alamofire.request(request)
		
	}
}
