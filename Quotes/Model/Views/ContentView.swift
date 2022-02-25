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
        // When the app opens, get a new joke from the web service
        .task {
            
            // Assemble the URL that points to the endpoint
            let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en/")!
            
           //define the types of data we want fromthe endpoint
            var request = URLRequest(url:url)
            
            //ask for JSON data (it is set to only accept JSON in your response)
            request.setValue("application/json",
                             forHTTPHeaderField: "Accept")
            
            //Start a session to interact (talk with the endpoint
            let urlSession = URLSession.shared
            
            //error, might not work so we need a de-catch block
            do {
                
                // get the raw data from the endpoint
                //  constant
                let (data, _) = try await urlSession.data(for: request)
                
                // Attempt to decode the raw data into a Swift structure
                // Takes what is in "data" and tries to put it into "currentJoke"
                //                                 DATA TYPE TO DECODE TO
                //                                         |
                //                                         V
                currentQuote = try JSONDecoder().decode(Quote.self, from: data)
                
                
            } catch {
                //catch block is failing code
                print("Could not retrieve or decode the JSON from endpoint.")
                // Print the contents of the "error" constant that the do-catch block
                // populates
                print(error)
            }
        
                          
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
