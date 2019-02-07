//
//  TweetCell.swift
//  Twitter
//
//  Created by Varun Jit Singh on 2/5/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    
    @IBOutlet weak var rtBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func retweetBtn(_ sender: Any) {
        //print("test")
    }
    
    var favorited: Bool = false
    var tweetId: Int = -1
    
    func setFav(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favBtn.setTitle("<3", for: .normal)
        }
        else {
            favBtn.setTitle("Fav", for: .normal)
        }
    }
    
    @IBAction func favoriteBtn(_ sender: Any) {
        //print("test2")
        let toBeFav = !favorited
        if(toBeFav){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFav(true)
            }, failure: { (error) in
                print("Favorite did not succeed")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFav(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed")
            })
        }
    }
    

}
