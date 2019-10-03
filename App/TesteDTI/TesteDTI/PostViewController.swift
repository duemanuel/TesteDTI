//
//  PostViewController.swift
//  TesteDTI
//
//  Created by Eduardo Oliveira on 02/10/2019.
//  Copyright © 2019 eduardooliveira. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
	
	@IBOutlet weak var lbTitle: UILabel!
	@IBOutlet weak var lbData: UILabel!
	@IBOutlet weak var lbDescription: UILabel!
	
	var infoPosts: BlogInfo!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.lbDescription.text = infoPosts.description
		self.lbData.text = infoPosts.data
		self.lbTitle.text = infoPosts.title
	}

}
