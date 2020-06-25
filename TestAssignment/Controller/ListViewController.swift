//
//  ListViewController.swift
//  TestAssignment
//
//  Created by Himanshu Sharma on 24/06/20.
//  Copyright © 2020 Himanshu Sharma. All rights reserved.
//

import UIKit
import SDWebImage

class ListViewController: UIViewController {

    let listTableView = UITableView()
    var arrListVM = [ListViewModel]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      // Do any additional setup after loading the view.
      setUpView()
      getData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    self.listTableView.estimatedRowHeight = 130
    self.listTableView.rowHeight = UITableViewAutomaticDimension
  }
  
  
  // MARK:- function to getData from API
   
    func getData(){
      Service.shareInstance.getAllMovieData { (list, error) in
        if(error==nil){
          self.arrListVM = list?.map({ return ListViewModel(movie: $0) }) ?? []
          DispatchQueue.main.async {
            self.listTableView.reloadData()
          }
        }
      }
    }
 
  // MARK:- function for setup tableView
  
  func setUpView(){
    view.backgroundColor = .white
    
    view.addSubview(listTableView)
    
    listTableView.translatesAutoresizingMaskIntoConstraints = false
    
    listTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
    listTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
    listTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
    listTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    listTableView.dataSource = self
    listTableView.delegate = self
    listTableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
    navigationItem.title = "About Canada"
  }
}

extension ListViewController: UITableViewDataSource,UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    print("Array count is",arrListVM.count)
    return arrListVM.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
     
     let MVM = arrListVM[indexPath.row]
     cell.titleLabel.text = MVM.title
     cell.subTitleLabel.text = MVM.description1
            if URL(string:MVM.imageHref ?? "") == nil{
              print("URLImage is nill ",indexPath.row)
            }
            else{
              cell.pictureImageView.sd_setImage(with:URL(string: MVM.imageHref!), placeholderImage:nil
              )}
            return cell
            
          }

  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 130
  }
}
