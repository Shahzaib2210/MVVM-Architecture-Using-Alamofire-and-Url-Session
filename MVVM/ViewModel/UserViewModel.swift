//
//  UserViewModel.swift
//  MVVM
//
//  Created by Shahzaib Mumtaz on 19/10/2022.
//

import UIKit
import Alamofire

class UserViewModel {
    
    weak var vc:ViewController?
    var arrUser = [UserModel]()
    
    // MARK: - Api Calling Using Url Session.
    func GetAllUserData() {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error) in
            
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self,from: data)
                        self.arrUser.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - Api Calling Using Alamofire.
    func GetAllUserAF() {
        AF.request("https://jsonplaceholder.typicode.com/todos/").response { response in
            if let data = response.data {
                do {
                    let userResponse = try JSONDecoder().decode([UserModel].self,from: data)
                    self.arrUser.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
