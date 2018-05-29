//
//  StockButton.swift
//  PaperShares
//
//  Created by Michele Frank on 5/26/18.
//  Copyright © 2018 9064. All rights reserved.
//
//  This class is a subclass of the UIButton class
//  Defines a button that displays the name of a stock, which is given by a parameter in the constructor, and the value of that stock, which is given by the *database class here*

import Foundation
import UIKit

public class StockButton : UIButton {
    
    //labels of the stock and its current value
    private var stockLabel:UILabel
    private var valueLabel:UILabel
    
    //Constructor
    public init(stockName:String){
        
        //initializes stock label based on constructor parameter
        stockLabel = UILabel()
        stockLabel.text = stockName
        
        valueLabel = UILabel()
        //placeholder for now
        valueLabel.text = "00.00"
        
        //initializes button to initially have a frame of a size of 0
        super.init(frame: .zero)
    }
    
    //Ignore this, it's required and it will throw an error if it's not here, is never used
    required public init?(coder aDecoder: NSCoder){
        stockLabel = UILabel()
        stockLabel.text = "AAAA"
        
        valueLabel = UILabel()
        //placeholder for now
        valueLabel.text = "00.00"
        
        super.init(coder: aDecoder)
    }
    
    //formats the labels onto the button
    //make sure to set up the button in the view controller correctly before calling this method
    public func formButtonLayout() {
        
        //background of button, shows up in line seperating label and value
        self.backgroundColor = UIColor.white
        
        //adds the stock label to the button
        self.addSubview(stockLabel)
        
        //allows for autolayout constraints for stockLabel
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //anchor constraints
        stockLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stockLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stockLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stockLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: (-self.frame.width / 3.0) - 2.5).isActive = true
        
        //dark blue color of button
        stockLabel.backgroundColor = UIColor().colorFromHex(hexString: "#10243a")
        
        //label text configuration
        stockLabel.textAlignment = .center
        stockLabel.textColor = UIColor.white
        stockLabel.font = UIFont(name: "Roboto-LightItalic", size: 100)
        stockLabel.numberOfLines = 1
        stockLabel.minimumScaleFactor = 0.01
        stockLabel.adjustsFontSizeToFitWidth = true
        stockLabel.font = UIFont(name: stockLabel.font.fontName, size: stockLabel.font.pointSize - 10.0)
        
        //adds the value label to the button
        self.addSubview(valueLabel)
        
        //allows for autolayout constraints for valueLabel
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //anchor constraints
        valueLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        valueLabel.leftAnchor.constraint(equalTo: stockLabel.rightAnchor, constant: 5.0).isActive = true
        
        //label text configuration
        valueLabel.backgroundColor = UIColor().colorFromHex(hexString: "#10243a")
        valueLabel.textAlignment = .center
        valueLabel.textColor = UIColor.white
        valueLabel.font = UIFont(name: "Roboto-LightItalic", size: 100)
        valueLabel.numberOfLines = 1
        valueLabel.minimumScaleFactor = 0.01
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.font = UIFont(name: valueLabel.font.fontName, size: valueLabel.font.pointSize - 60.0)
    }
}
