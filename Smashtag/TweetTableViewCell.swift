//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Austen Talbot on 4/3/15.
//  Copyright (c) 2015 Austen Talbot. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    func updateUI() {
        // reset any existing tweet info
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
//        tweetCreatedLabel?.text = nil
        
        // load new info from tweets
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil {
                for _ in tweet.media {
                    tweetTextLabel.text! += " picture"
                }
            }
            
            tweetScreenNameLabel?.text = "\(tweet.user)" // tweet.user.description
            if let profileImageURL = tweet.user.profileImageURL {
                if let imageData = NSData(contentsOfURL: profileImageURL) {
                    // blocks main thread
                    tweetProfileImageView?.image = UIImage(data: imageData)
                }
            }
//            let formatter = NSDateFormatter()
//            if NSDate().timeIntervalSinceDate(tweet.created) > 24*60*60 {
//                formatter.dateStyle = NSDateFormatterStyle.ShortStyle
//            } else {
//                formatter.timeStyle = NSDateFormatterStyle.ShortStyle
//            }
//            tweetCreatedLabel?.text = formatter.stringFromDate(tweet.created)
        }
    }
}
