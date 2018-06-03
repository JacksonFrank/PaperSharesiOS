//
//  StockListViewController.swift
//  PaperShares
//
//  Created by Jackson Frank on 5/24/18.
//  Copyright © 2018 9064. All rights reserved.
//

import UIKit



class StockListViewController: UIViewController {
    
    @IBOutlet weak var ScrollHeight: NSLayoutConstraint!
    @IBOutlet weak var LoadingLabel: UILabel!
    @IBOutlet weak var ScrollViewView: UIView!
    
    var stockInfo:StockInfo? = nil
    var stockNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockNames = ["AAPL", "MSFT", "TSLA", "GOOG", "HPQ", "AMZN", "XOM", "NVDA", "AMD", "ADBE", "NFLX", "TMUS", "INTC"]
        stockInfo = StockInfo(stockNames: stockNames)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func Pressed(sender: UIButton!) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        sleep(2)
        LoadingLabel.text = ""
        
        var stockButtons = [StockButton]()
        
        for index in 0..<stockNames.count {
            stockButtons.append(StockButton(stockName: stockNames[index], stockValue: (stockInfo?.stockValues[stockNames[index]]!)!))
            ScrollViewView.addSubview(stockButtons[index])
            stockButtons[index].translatesAutoresizingMaskIntoConstraints = false
            stockButtons[index].centerXAnchor.constraint(equalTo: ScrollViewView.centerXAnchor).isActive = true
            stockButtons[index].leftAnchor.constraint(equalTo: ScrollViewView.leftAnchor, constant: 20.0).isActive = true
            stockButtons[index].rightAnchor.constraint(equalTo: ScrollViewView.rightAnchor, constant: -20.0).isActive = true
            if index == 0 {
                stockButtons[index].topAnchor.constraint(equalTo: ScrollViewView.topAnchor, constant: 20.0).isActive = true
            }
            else{
                stockButtons[index].topAnchor.constraint(equalTo: stockButtons[index - 1].bottomAnchor, constant: 20.0).isActive = true
            }
            stockButtons[index].heightAnchor.constraint(equalToConstant: 150.0).isActive = true
            stockButtons[index].setNeedsLayout()
            stockButtons[index].layoutIfNeeded()
            stockButtons[index].formButtonLayout()
        }
        
        ScrollHeight.constant = (170.0 * (CGFloat)(stockButtons.count)) + 20.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    func colorFromHex(hexString: String) -> UIColor {
        var hex = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hex.hasPrefix("#") {
            hex.remove(at: hexString.startIndex)
        }
        if hex.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgb)
        
        return UIColor(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgb & 0x0000FF) / 255.0,
                       alpha: 1.0)
    }
}


