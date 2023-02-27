//
//  JokeRepository.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import Foundation
import Combine

class JokeRepository {
    func getJoke() -> AnyPublisher<Joke, Error> {
        let url = URL(string: "https://icanhazdadjoke.com/")!
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { _ in MyError.basic }
            .map { $0.data }
            .decode(type: Joke.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
