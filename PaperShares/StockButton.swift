//
//  StockButton.swift
//  PaperShares
//
//  Created by Jackson Frank on 5/26/18.
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
    public init(stockName:String, stockValue:String){
        
        //initializes stock label based on constructor parameter
        stockLabel = UILabel()
        stockLabel.text = stockName
        
        valueLabel = UILabel()
        
        var currentValue = stockValue
        while currentValue[currentValue.index(before: currentValue.endIndex)] == "0" {
            currentValue.removeLast()
        }
        
        valueLabel.text = currentValue
        
        //initializes button to initially have a frame of a size of 0
        super.init(frame: .zero)
    }
    
    //Ignore this, it's required and it will throw an error if it's not here, is never used
    required public init?(coder aDecoder: NSCoder){
        stockLabel = UILabel()
        stockLabel.text = "AAAA"
        
        valueLabel = UILabel()
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
        stockLabel.font = UIFont(name: stockLabel.font.fontName, size: stockLabel.font.pointSize - 20.0)
        
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
        valueLabel.font = UIFont(name: valueLabel.font.fontName, size: valueLabel.font.pointSize - 65.0)
        
        self.isUserInteractionEnabled = true
        //self.setTitleColor(UIColor.gray, for: .highlighted)
        self.addTarget(self, action: #selector(ButtonClicked), for: .touchUpInside)
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 1.0) {
            self.stockLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
            self.valueLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 1.0) {
            self.stockLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.valueLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        super.touchesEnded(touches, with: event)
    }
    
    
    @objc func ButtonClicked(sender: UIButton!){
        print("Added")
        if StockInfo.StockChoices.contains(valueLabel.text!) == false {
            if StockInfo.StockChoices.count < 6 {
                StockInfo.StockChoices.append(valueLabel.text!)
            }
            else {
                for index in 0...4 {
                    StockInfo.StockChoices[index] = StockInfo.StockChoices[index + 1]
                }
            StockInfo.StockChoices[5] = stockLabel.text!
            }
            
            TodayViewController.update(stockChoices: StockInfo.StockChoices)
        }
    }
}
