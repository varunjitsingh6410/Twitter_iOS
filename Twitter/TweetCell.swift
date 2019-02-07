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
    
    
    var retweeted: Bool = false
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            rtBtn.setTitle("RTed", for: .normal)
            rtBtn.isEnabled = false
        }
        else {
            rtBtn.setTitle("RT", for: .normal)
            rtBtn.isEnabled = true
        }
    }
    
    
    @IBAction func retweetBtn(_ sender: Any) {
        //print("test")
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error in retweeting")
        })
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
