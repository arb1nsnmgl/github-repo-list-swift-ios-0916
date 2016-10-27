//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories = [GithubRepository]()
    private init() {}
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> ()) {
        
        self.repositories.removeAll()
        
        GithubAPIClient.getRepositories(with: { jsons in
            
            for json in jsons {
                self.repositories.append(GithubRepository(dictionary: json))
            }
            completion()
        })
        
    }
        
}
