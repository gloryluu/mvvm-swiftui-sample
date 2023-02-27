//
//  JokeListViewModel.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import Foundation
import Combine

class JokeListViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    private var jokeRepository: JokeRepository = JokeRepository()
    private var cancellable: AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    func getJoke() {
        isLoading = true
        
        cancellable = jokeRepository
            .getJoke()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self.error = LocalizedAlertError(error: err)
                }
            }, receiveValue: {
                self.isLoading = false
                self.jokes.insert($0, at: 0)
            })
    }
}
