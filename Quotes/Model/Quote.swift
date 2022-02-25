//
//  Quotes.swift
//  Quotes
//
//  Created by Suzanne Tian on 2022-02-24.
//

import Foundation

struct Quote: Decodable {
    
    let quoteText: String
    let quoteAuthor: String
    let senderName: String
    let senderLink: String
    let quoteLink: String
    
}
