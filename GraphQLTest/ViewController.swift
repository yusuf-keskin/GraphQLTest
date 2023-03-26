//
//  ViewController.swift
//  GraphQLTest
//
//  Created by YUSUF KESKİN on 26.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var films : [AllFilmsQuery.Data.AllFilm.Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGraphQLData()
    }
    
    func loadGraphQLData() {
        let query = AllFilmsQuery()
        
        Apollo.shared.client.fetch(query: query) { result in
            
            switch result {
            case .success(let graphQLResult):
                if let films = graphQLResult.data?.allFilms?.films?.compactMap({ $0 }) {
                    self.films = films
                }
                
            case .failure(let error):
                // 5
                print("Error loading data \(error)")
            }
            print(self.films[0].title)
            print(self.films[0].characterConnection?.characters?[0]?.eyeColor)
        }
    }

}
