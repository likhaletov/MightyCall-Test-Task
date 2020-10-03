//
//  NetworkServiceProtocol.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import Foundation

protocol NetworkService {
    func obtainData(fromURL url: URL, completionHandler: @escaping ((Result<Data, Error>) -> Void))
}
