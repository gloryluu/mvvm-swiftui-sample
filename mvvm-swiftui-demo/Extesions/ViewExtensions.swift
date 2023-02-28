//
//  ViewExtensions.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func errorAlert(error: Binding<Error?>, buttonTitle: String = "Ok") -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        
        if #available(iOS 15.0, *) {
            alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
                Button(buttonTitle) {
                    error.wrappedValue = nil
                }
            } message: { error in
                Text(error.recoverySuggestion ?? "")
            }
        } else {
            alert(isPresented: .constant(localizedAlertError != nil)) {
                Alert(
                    title: Text(localizedAlertError?.localizedDescription ?? ""), message: Text(localizedAlertError?.recoverySuggestion ?? ""), dismissButton: .default(Text(buttonTitle))
                )
            }
        }
    }
}
