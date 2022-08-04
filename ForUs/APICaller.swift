//
//  APICaller.swift
//  ForUs
//
//  Created by J M on 8/3/22.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    let date = Date()
    struct Constants{
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?q=abortion&sortBy=publishedAt&apiKey=b156824ecee7452dafad64d4eca4c44b")
        
    }
    private init(){}
 
    public func getTopStories (completion : @escaping (Result< [Article] , Error >) -> Void){
        print(date)
    guard let url = Constants.topHeadlinesURL else{
        
        return
    }
        
        let task = URLSession.shared.dataTask(with: url){
            data, _, error in
            
            if let error = error{
                completion(.failure(error  ))
                
            }
            
            else if let data = data {
                do{
                    let result = try JSONDecoder().decode(APIResponse.self , from: data)
                    
                    
                    print("Articles:\(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error  ))


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
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage:String?
    let publishedAt: String
}
struct Source: Codable{
    let name: String
}

