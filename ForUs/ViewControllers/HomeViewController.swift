//
//  HomeViewController.swift
//  ForUs
//
//  Created by J M on 8/2/22.
//

import UIKit
import SafariServices
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
 
private let tableView: UITableView = {
            let table = UITableView()
            table.register(newsTableViewCell.self, forCellReuseIdentifier: newsTableViewCell.identifier)
            return table
        }()
    
    private var viewModels = [newsTableViewCellViewModel]()
    
    private var articles = [Article]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        APICaller.shared.getTopStories{ [weak self] result in
            switch result{
                
            case .success(let articles):
                self?.articles = articles
                self?.viewModels = articles.compactMap({
                    newsTableViewCellViewModel(title: $0.title, subtitle: $0.description ?? "No Description",
                                               imageURL: URL(string: $0.urlToImage ?? ""), mySource: $0.source.name
                    )
                })
                print("Gping!")

                DispatchQueue.main.async{
                    
                   self?.tableView.reloadData()
                    print("it works!")
                }
                
            case .failure(let error):
                print (" \(error)You have an error")
                
            
            }
        }
        // Do any additional setup after loading the view.
    }
    
     override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("viewmodels: \(viewModels.count)")
        
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCell.identifier, for: indexPath) as? newsTableViewCell else {

            fatalError()

        }
        cell.configure( with: viewModels[indexPath.row])
        
        print("returning cell!")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        
        guard let url = URL(string: article.url ?? "")else{
            return
        }
        let vc = SFSafariViewController(url:url)
        present (vc, animated: true)
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func checkSource(sourceToCheck: String) ->  String  {
        
        let myCheckSource = sourceToCheck
        var myReturn = ""
        
        if (myCheckSource == "The New York Times") || (myCheckSource == "The Wall Street Journal" ) || (myCheckSource == "The Washington Post") || (myCheckSource == "BBC") || (myCheckSource == "The Economist") || (myCheckSource == "The New Yorker") || (myCheckSource == "The Associated Press" )  || ( myCheckSource == "Aljazeera") || (myCheckSource == "Reuters" ) || (myCheckSource == "Bloomberg News") || (myCheckSource == "Politico" ) ||  (myCheckSource == "The Atlantic") ||  (myCheckSource == "CBS News"){
            
            myReturn = "ForUs has marked this source credible 🙂"
        }
        
        else if myCheckSource.contains( "Fox News") {
            
            myReturn = "ForUs has marked this source not credible 😕"
        }
        else{
            
            myReturn = "ForUs has not determined this source's credibility 🧐"
        }
        return myReturn
        
        
    }
        }





