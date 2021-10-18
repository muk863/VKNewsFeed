//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by username on 18.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.5671284795, green: 0.7945078611, blue: 0.9987251163, alpha: 1)
        
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map ({ (feedItem) in
                print(feedItem.date)
            })
        }
    }
}
