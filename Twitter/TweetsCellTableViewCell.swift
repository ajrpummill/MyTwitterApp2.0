//
//  TweetsCellTableViewCell.swift
//  Twitter
//
//  Created by Anthony Pummill on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetsCellTableViewCell: UITableViewCell {
    
    var favorited:Bool = false
    var tweetId:Int = -1
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobefavorited = !favorited
        if (tobefavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favorited did not succeed: \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfavorited did not succeed: \(error)")
            })
        }
        
    }
    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    }

    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
        retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true

        }
        
    }
    
    func setFavorited(_ isFavorited:Bool) {
    favorited = isFavorited
    if (favorited) {
        favButton.setImage(UIImage (named: "favor-icon-red"), for: UIControl.State.normal)
    }
    else {
        favButton.setImage(UIImage (named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
