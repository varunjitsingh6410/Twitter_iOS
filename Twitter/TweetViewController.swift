//
//  TweetViewController.swift
//  Twitter
//
//  Created by Varun Jit Singh on 2/6/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    
    @IBOutlet weak var messageField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageField.becomeFirstResponder()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetBtn(_ sender: Any) {
        if (!messageField.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: messageField.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print ("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
