//
//  ApiManager.swift
//  Movie App
//
//  Created by R on 18/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import Foundation
    struct getApi{
        func ApiData(comp: @escaping([Movie])->()) {

            let api = URL(string:"https://jsonplaceholder.typicode.com/photos")
            URLSession.shared.dataTask(with: api!) { (data, res, err) in
                if  err != nil{
                print(err!.localizedDescription)
            }
            if let data = data{
                do{
                    let result = try JSONDecoder().decode([Movie].self, from: data)
                       comp(result)
                }catch{
                    print("no data")
                }
            }
        }.resume()
    }
}
