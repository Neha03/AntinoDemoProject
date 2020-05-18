//
//  ViewController.swift
//  Antino
//
//  Created by NEHA NARANG on 14/05/20.
//  Copyright © 2020 @narang. All rights reserved.
//

import UIKit
import SDWebImage

struct getDemoData: Decodable {
     let url: String?
     let name: String?
     let age: String?
     let location: String?
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var names = ["Neha", "Reyansh", "Rani"]
    var userDetail = getDemoData(url: "", name: "", age: "", location: "")


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Api Call
        fetchCourseJson{ (res) in
            switch res {
            case .success(let getDemoData):
                getDemoData.forEach({ (getDemoData) in
                    self.userDetail = type(of: getDemoData).init(url: getDemoData.url, name: getDemoData.name, age: getDemoData.age, location: getDemoData.location)
                    print(self.userDetail)
                    })

            case .failure(let err):
                print("failed to fetch courses", err)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //To retrieve demo data api by Antino
    func fetchCourseJson(completion: @escaping(Result<[getDemoData], Error>) -> ()){
        let urlString = "http://demo8716682.mockable.io/cardData"
        guard let url = URL(string: urlString)else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, Err) in
            if let Err = Err{
                completion(.failure(Err))
                return
            }
            
            do {
                let getData =  try JSONDecoder().decode([getDemoData].self, from: data!)
                completion(.success(getData))
            }catch let jsonError{
                completion(.failure(jsonError))
            }
        }.resume()
       
    }
}

//TableView Delegate
extension ViewController : UITableViewDelegate{
   
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me")
        
    }
    
}
//TableView DataSource
extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userDetail.name!.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        cell.namelabel.text = self.userDetail.name
        cell.agelabel.text = self.userDetail.age
        cell.locationlabel.text = self.userDetail.location
        cell.imgView.sd_setImage(with: URL(string: self.userDetail.url ?? ""))
        return cell
       }
    
}




