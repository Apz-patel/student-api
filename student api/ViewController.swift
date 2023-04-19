//
//  ViewController.swift
//  student api
//
//  Created by ayush on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var studentimageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var rollNoLabel: UILabel!
  @IBOutlet var classLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var contectLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        users()
        setUp()
    }
    
    func setUp (){
        studentimageView.layer.masksToBounds = true
        studentimageView.layer.cornerRadius = 18
        
        titleLabel.layer.cornerRadius = 22
        titleLabel.layer.masksToBounds = true
        
        
    }
    private func users() {
        let url = URL(string: "http://haritibhakti.com/studentdata.json")
        
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data,error == nil else
            {
                print ("Error Occured While Accessing Data with URL")
                return
            }
            var studentDataObject: StudentData?
            do{
                studentDataObject = try JSONDecoder().decode( StudentData.self, from: data)
            }
            catch{
                print("error")
            }
            print()
            guard let sutdentData = studentDataObject else{
                return
            }
            print(sutdentData)
            DispatchQueue.main.async {
                self.rollNoLabel.text = "  Rollno : \(studentDataObject!.rollno)"
                self.nameLabel.text = "  Name : \(studentDataObject!.name)"
                self.classLabel.text = "  Class : \(studentDataObject!.sclass)"
                self.cityLabel.text = "  City : \(studentDataObject!.city)"
                self.contectLabel.text = "  Contact : \(studentDataObject!.contact)"
               
            }
        })
        dataTask.resume()
    }
    

}


