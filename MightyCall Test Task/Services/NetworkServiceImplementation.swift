//
//  NetworkServiceImplementation.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import Foundation

class NetworkServiceImplementation: NetworkService {
    
    func obtainData(fromURL url: URL, completionHandler: @escaping ((Result<Data, Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, let _ = response else { return }
            
            if let error = error {
                completionHandler(.failure(error))
                return
            } else {
                completionHandler(.success(data))
            }
            
        }
        task.resume()
    }
    
}
