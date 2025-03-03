//
//  HomeView.swift
//  Chapter22
//
//  Created by Jules Mickael on 2025-03-02.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
               
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 100)

                // Title
                Text("Welcome to the British Museum")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)

                Spacer()

                // Bouton
                NavigationLink(destination: ContentView()) {
                    Text("Enter")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color("rom-background"))
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // Fond blanc minimaliste
        }
    }
}

/// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
