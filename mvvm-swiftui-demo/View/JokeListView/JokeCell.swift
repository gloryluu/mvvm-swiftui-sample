//
//  JokeCell.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import SwiftUI

struct JokeCell: View {
    var model: Joke
    
    init(model: Joke) {
        self.model = model
    }
    
    var body: some View {
        Text(model.joke)
    }
}

struct JokeCell_Previews: PreviewProvider {
    static var previews: some View {
        JokeCell(model: Joke(id: "1", joke: "sample text", status: 200))
    }
}
