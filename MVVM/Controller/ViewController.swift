//
//  ViewController.swift
//  MVVM
//
//  Created by Shahzaib Mumtaz on 19/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelUser = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelUser.vc = self
        viewModelUser.GetAllUserAF()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil),forCellReuseIdentifier: "UserCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelUser.arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
        let modelUaer = viewModelUser.arrUser[indexPath.row]
        cell.modelUser = modelUaer
        return cell
    }
}
