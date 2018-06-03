//
//  StockInfo.swift
//  PaperShares
//
//  Created by Jackson Frank on 6/2/18.
//  Copyright © 2018 9064. All rights reserved.
//

import Foundation

public class StockInfo {
    
    var stockNames = [String]()
    public var stockValues = [String: String]()
    public static var StockChoices = [String]()
    
    public static func getChoices() -> [String] {
        return StockChoices
    }
    
    struct StockQuote : Codable {
        let stockQuote : [StockValues]
        private enum CodingKeys: String, CodingKey {
            case stockQuote = "Stock Quotes"
        }
    }
    struct StockValues : Codable {
        var symbol: String
        var price: String
        var volume: String
        var timestamp: String
        
        private enum CodingKeys: String, CodingKey {
            case symbol = "1. symbol"
            case price = "2. price"
            case volume = "3. volume"
            case timestamp = "4. timestamp"
        }
    }
    
    init(stockNames: Array<String>){
        self.stockNames = stockNames
        retrieveStockValues()
    }
    
    func retrieveStockValues(){
        var urlString = "https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols="
        for name in stockNames {
            urlString += name + ","
        }
        urlString.removeLast()
        urlString += "&apikey=2WYOTXHOURLLD9BD"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do{
                let decoder = JSONDecoder()
                let stockData = try decoder.decode(StockQuote.self, from: data)
                for stockValue in stockData.stockQuote {
                    self.stockValues[stockValue.symbol] = stockValue.price
                    //print(stockValue.symbol + " " + stockValue.price)
                }
                
            } catch let jsonErr {
                print(jsonErr)
            }
            
            }.resume()
    }
    
    
}
