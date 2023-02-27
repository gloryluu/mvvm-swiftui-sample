//
//  JokeListView.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import SwiftUI

struct JokeListView: View {
    @StateObject private var viewModel = JokeListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List(viewModel.jokes, id: \.id) {
                        JokeCell(model: $0)
                    }
                    .navigationBarTitle(Text("ICanHazDadJokes"))
                    Button(action: {
                        viewModel.getJoke()
                    }) {
                        Text("Get more joke!")
                    }
                }
            }
            .onAppear { viewModel.getJoke() }
            
            if viewModel.isLoading { ProgressView()}
        }
        .errorAlert(error: $viewModel.error)
    }
}

struct JokeListView_Previews: PreviewProvider {
    static var previews: some View {
        JokeListView()
    }
}
