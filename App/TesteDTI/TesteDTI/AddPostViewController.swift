//
//  AddPostViewController.swift
//  TesteDTI
//
//  Created by Eduardo Oliveira on 02/10/2019.
//  Copyright © 2019 eduardooliveira. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
	
	@IBOutlet weak var tfTitle: UITextField!
	@IBOutlet weak var tfDescription: UITextField!	
	@IBOutlet weak var btnAdd: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func savePost(_ sender: UIButton) {
		
		if let text = tfDescription.text, !text.isEmpty {
			if let text = tfTitle.text, !text.isEmpty {
				let date = Date()
				let formatter = DateFormatter()
				formatter.dateFormat = "dd/MM/yyyy"
				let resultDate = formatter.string(from: date)
				
				let newPost = BlogInfo(data: resultDate, title: tfTitle.text ?? "", description: tfDescription?.text ?? "")
				BlogApi.saveNewPost(post: newPost)
				self.dismiss(animated: true, completion: nil)
			}
			else{
				let alert = UIAlertController(title: "Atenção", message: "O campo do título deve ser preenchido.", preferredStyle: UIAlertController.Style.alert)
				alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
				self.present(alert, animated: true, completion: nil)
			}
		}
		else{
			let alert = UIAlertController(title: "Atenção", message: "O campo da descrição deve ser preenchida.", preferredStyle: UIAlertController.Style.alert)
			alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	@IBAction func btnVoltar(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
}
