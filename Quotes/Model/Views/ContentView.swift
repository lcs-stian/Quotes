//
//  ContentView.swift
//  Quotes
//
//  Created by Suzanne Tian on 2022-02-24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored porperties
    
    @State var currentQuote: Quote = Quote (quoteText: "",
                                            quoteAuthor: "",
                                            senderName: "",
                                            senderLink: "",
                                            quoteLink: "")
    
    //MARK: Computed porperties
    
    var body: some View {
        
        VStack {
            
            Text(currentQuote.quoteText)
                .font(.title)
                .multilineTextAlignment(.leading)
            
            HStack {
                
                Text(currentQuote.quoteAuthor)
                
            }
            
            .padding(30)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.primary, lineWidth: 4)
            )
            .padding(10)
            
            Image(systemName: "heart.circle")
                .font(.largeTitle)
            
            Button(action: {
                print("I've been pressed.")
            }, label: {
                Text("Another one!")
            })
                .buttonStyle(.bordered)
            
            HStack {
                Text("Favourites")
                    .bold()
                
                Spacer()
            }
            
            List {
                Text("The greatest glory in living lies not in never falling, but in rising every time we fall.")
                Text("The way to get started is to quit talking and begin doing.")
                Text("Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking.")
            }
            
            Spacer()
            
        }
        

        .navigationTitle("Quotes")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
