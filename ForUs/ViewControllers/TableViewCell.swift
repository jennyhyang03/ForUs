//
//  newsTableTableViewController.swift
//  ForUs
//
//  Created by J M on 8/3/22.
//

import UIKit

class newsTableViewCellViewModel {
    
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    let source: String
    
    
    init( title: String, subtitle: String, imageURL: URL?, mySource: String
    ){
        self.source = mySource
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
       
}
}
class newsTableViewCell:
    UITableViewCell {
    static let identifier = "newsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0

        return label
    }()
    
    private let sourceLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
        
        
    }()


        override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            
            
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = .clear
            
            contentView.addSubview(newsTitleLabel)
            contentView.addSubview(sourceLabel)
            contentView.addSubview(subtitleLabel)
            contentView.addSubview(newsImageView)

        }
        required init?(coder: NSCoder) {
            
            fatalError()
        }
        
    
    override func layoutSubviews(){
        
        super.layoutSubviews()
        print("Going!!")
        newsTitleLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width - 170, height: contentView.frame.size.height/2)
        
        sourceLabel.frame = CGRect(x: 10, y: 70, width:contentView.frame.size.width - 170, height: contentView.frame.size.height/2 )
        subtitleLabel.frame = CGRect(x: 10, y: 150, width: contentView.frame.size.width - 200, height: contentView.frame.size.height/2)
        newsImageView.frame = CGRect(x: contentView.frame.size.width - 150, y: 5, width: 190, height: contentView.frame.size.height - 40)
        
      
        
    }
    
    override func prepareForReuse(){
        
        super.prepareForReuse()
        newsTitleLabel.text = nil
        subtitleLabel.text = nil
        newsImageView.image = nil
        sourceLabel.text = nil
    }
    
   
    
    func configure(with  viewModel:newsTableViewCellViewModel ){
        newsTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        sourceLabel.text = viewModel.source + " - " + checkSource(sourceToCheck: viewModel.source)
        print("yas")

        if let data = viewModel.imageData{
            
            newsImageView.image = UIImage(data: data)
            print("yas")
        }else if let url = viewModel.imageURL{
            URLSession.shared.dataTask(with: url){ data, _, error in guard let data = data, error == nil else{
                return
            }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self.newsImageView.image = UIImage(data : data)
                }
            }.resume()
        
    }
    }
    
    func checkSource(sourceToCheck: String) -> String{
        
        let myCheckSource = sourceToCheck
        var myReturn = ""
        
        if (myCheckSource == "The New York Times") || (myCheckSource == "The Wall Street Journal" ) || (myCheckSource == "The Washington Post") || (myCheckSource == "BBC") || (myCheckSource == "The Economist") || (myCheckSource == "The New Yorker") || (myCheckSource == "The Associated Press" )  || ( myCheckSource == "Aljazeera") || (myCheckSource == "Reuters" ) || (myCheckSource == "Bloomberg News") || (myCheckSource == "Politico" ) ||  (myCheckSource == "The Atlantic") ||  (myCheckSource == "Associated Press") || (myCheckSource == "CNN") || (myCheckSource == "Vanity Fair") || (myCheckSource == "CNBC"){
            
            myReturn = "ForUs has marked this source credible 🚀"
        }
        
        else if myCheckSource.contains( "Fox News")  || (myCheckSource == "WND.com") {
            
            myReturn = "ForUs has marked this source not credible 🚩"
        }
        else{
            
            myReturn = "ForUs has not determined this source's credibility 🤔"
        }
        return myReturn
        
        
    }

}
