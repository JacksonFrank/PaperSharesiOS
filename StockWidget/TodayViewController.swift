//
//  TodayViewController.swift
//  StockWidget
//
//  Created by Jackson Frank on 6/2/18.
//  Copyright © 2018 9064. All rights reserved.
//

import UIKit
import NotificationCenter

public class TodayViewController: UIViewController, NCWidgetProviding {
    
    
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var LoadingLabel: UILabel!
    var stockInfo:StockInfo? = nil
    
    static var stockChoices = [String]()
    
    public static func update(stockChoices:[String]){
        self.stockChoices = stockChoices
    }
    
    /*
    public func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        completionHandler(NCUpdateResult.newData)
    }
    */
    
    override public func viewDidLoad() {
        print("View Loaded")
        
        super.viewDidLoad()
        Label1.isHidden = true
        Label2.isHidden = true
        Label3.isHidden = true
        Label4.isHidden = true
        Label5.isHidden = true
        Label6.isHidden = true
        
        
        // Do any additional setup after loading the view from its nib
        
        
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("View Appeared")
        
        stockInfo = StockInfo(stockNames: ["AAPL", "MSFT", "TSLA", "GOOG", "AMZN", "AMD"])
        TodayViewController.stockChoices = StockInfo.getChoices()
        
        sleep(2)
        
        LoadingLabel.isHidden = true
        Label1.isHidden = false
        Label2.isHidden = false
        Label3.isHidden = false
        Label4.isHidden = false
        Label5.isHidden = false
        Label6.isHidden = false
        
        
        
        Label1.text = "AAPL: " + (stockInfo?.stockValues["AAPL"])!
        
        
        Label2.text = "MSFT: " + (stockInfo?.stockValues["MSFT"])!
       
       
        Label3.text = "TSLA: " + (stockInfo?.stockValues["TSLA"])!
        
        
        Label4.text = "GOOG: " + (stockInfo?.stockValues["GOOG"])!
        
        
        Label5.text = "AMZN: " + (stockInfo?.stockValues["AMZN"])!
        
       
        Label6.text = "AMD: " + (stockInfo?.stockValues["AMD"])!
        
        
        /*
        let fontSize:CGFloat = 100.0
        Label1.font = UIFont(name: "Roboto-LightItalic", size: fontSize)
        Label2.font = UIFont(name: "Roboto-LightItalic", size: fontSize)
        Label3.font = UIFont(name: "Roboto-LightItalic", size: fontSize)
        Label4.font = UIFont(name: "Roboto-LightItalic", size: fontSize)
        Label5.font = UIFont(name: "Roboto-LightItalic", size: fontSize)
        Label6.font = UIFont(name: "Roboto-LightItalic", size: fontSize)
 */
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
