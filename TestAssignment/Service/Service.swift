//
//  Service.swift
//  MVVMYOUTUBE
//
//  Created by Himanshu Sharma on 24/06/20.
//  Copyright © 2020 Himanshu Sharma. All rights reserved.
//

import UIKit

class Service: NSObject {

    
    static let shareInstance = Service()
    var results = [String: Any]()
  
  func getAllMovieData(completion: @escaping([Rows]?, Error?) -> ()){
//        let urlString =
     //let urlString = Constants.apiURL
        guard let url = URL(string: Constants.apiURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else { return }
                do{
                  let str = String(data: data, encoding: .isoLatin1)
                  let data8 = str?.data(using: .utf8)
                  var arrMovieData = [Rows]()
                  let decodedApps = try JSONDecoder().decode(DataModel.self, from: data8!)
                  for movie in decodedApps.rows{
                    arrMovieData.append(Rows(title: movie.title ?? "", description: movie.description ?? "", imageName: movie.imageHref ?? ""))
                    //print("Movie is",movie)
                  }
                  completion(arrMovieData, nil
                  
//                  let str = String(data: data, encoding: .isoLatin1)
//                  let data8 = str?.data(using: .utf8)
//                  self.results = try JSONSerialization.jsonObject(with: data8!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
//                  completion(self.results,nil)
                      
                )}catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }
  }
