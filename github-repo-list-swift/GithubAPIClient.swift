//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


typealias JSONDictionary = [String : AnyObject]
typealias NetworkResult = (([JSONDictionary]) -> Void)

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping NetworkResult) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let url = URL(string: "https://api.github.com/repositories?client_id=b217a82049c0bd98dbdb&client_secret=e85127cbf714675d954a95f01763a7edf2d5a0bb")!
        
        let task = session.dataTask(with: url) {
            
            data, response, error in
            
            guard let data = data else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [JSONDictionary]
            
            if let json = json {
                completion(json!)
            }
        }
        task.resume()
    }
    
}
    


