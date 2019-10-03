//
//  ViewController.swift
//  TesteDTI
//
//  Created by Eduardo Oliveira on 02/10/2019.
//  Copyright © 2019 eduardooliveira. All rights reserved.
//

import UIKit

class BlogTableViewController: UITableViewController {
	
	var posts: [BlogInfo] = []

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.tableView.tableFooterView = UIView()
		loadPosts()
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.posts.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
	
		let post = self.posts[indexPath.row]
		cell.textLabel?.text = post.title
		cell.detailTextLabel?.text = post.data
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let vc = segue.destination as! PostViewController
		vc.infoPosts = self.posts[tableView.indexPathForSelectedRow!.row]
	}

	func loadPosts(){
		BlogApi.loadAllPosts { (info) in
			if info.count > 0{
				self.posts = info as! [BlogInfo]
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}else{
				let alert = UIAlertController(title: "Desculpe", message: "Nenhum registro encontrado. Por favor crie um novo post!", preferredStyle: UIAlertController.Style.alert)
				alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
				self.present(alert, animated: true, completion: nil)
			}
		}
	}
	
	@IBAction func btnAdd(_ sender: UIBarButtonItem) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		
		let nextViewController = storyBoard.instantiateViewController(withIdentifier: "addPost") as! AddPostViewController
		self.present(nextViewController, animated:true, completion:nil)
	}
}

