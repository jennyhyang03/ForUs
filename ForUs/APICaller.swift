//
//  APICaller.swift
//  ForUs
//
//  Created by J M on 8/3/22.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    struct Constants{
        static let topHeadlinesURL = URL(string: "")
        
    }
    private init(){}
    
    public func getTopStories(completion:  (Result<[String], Error>), -> Void){
        
    guard let url = Constants.topHeadlinesURL else{
        
        return
    }
        
        let task = URLSession.shared.dataTask(with: url){
            data, _, error in
            
            if let error = error{
                completion(.failure(error))
            }
            
            else if let data = data {
                do{
                    let result = try JSONDecoder().decode(APIResponse.self , from: data)
                }
                catch {
                    completion(.failure(error))

                }
            }
          
        }
        task.resume()
    }

   
}

struct APIResponse: Codable{
    
    let articles: [Article]
}

struct Article: Codable{
    let source: String
    let title: String
    let description: String
    let url: String
    let urlToImage:String
    let publishedAt: String
}
struct source: Codable{
    let name: String
}
