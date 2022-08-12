//
//  AlbumService.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit

protocol AlbumServiceProtocol {
    func fetchAlbums (
        onSuccess: @escaping SingleResult<[Album]>,
        onError: @escaping ErrorResult
    )
}

class AlbumService: AlbumServiceProtocol {
    
    func fetchAlbums(
        onSuccess: @escaping SingleResult<[Album]>,
        onError: @escaping SingleResult<Error>
    ) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("Response: \(String(describing: response))")
                return
            }
            
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "")")
                onError(error!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let albums = try JSONDecoder().decode([Album].self, from: data)
                onSuccess(albums)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
