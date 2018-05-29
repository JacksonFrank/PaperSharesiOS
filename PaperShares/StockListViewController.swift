//
//  StockListViewController.swift
//  PaperShares
//
//  Created by Jackson Frank on 5/24/18.
//  Copyright © 2018 9064. All rights reserved.
//

import UIKit



class StockListViewController: UIViewController {

   
    @IBOutlet weak var ScrollViewView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIButton()
        button1.backgroundColor = UIColor().colorFromHex(hexString: "#10243a") //#10243a
        button1.setTitle("Test Button", for: .normal)
        button1.addTarget(self, action: #selector(Pressed), for: UIControlEvents.touchUpInside)
        ScrollViewView.addSubview(button1)
        
        //enables autolayout for this view
        button1.translatesAutoresizingMaskIntoConstraints = false
        
        //autolayout constraints
        button1.centerXAnchor.constraint(equalTo: ScrollViewView.centerXAnchor).isActive = true
        button1.leftAnchor.constraint(equalTo: ScrollViewView.leftAnchor, constant: 20.0).isActive = true
        button1.rightAnchor.constraint(equalTo: ScrollViewView.rightAnchor, constant: -20.0).isActive = true
        button1.topAnchor.constraint(equalTo: ScrollViewView.topAnchor, constant: 20.0).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        
        let stockButton:StockButton = StockButton(stockName: "AAPL")
        ScrollViewView.addSubview(stockButton)
        stockButton.translatesAutoresizingMaskIntoConstraints = false
        stockButton.centerXAnchor.constraint(equalTo: ScrollViewView.centerXAnchor).isActive = true
        stockButton.leftAnchor.constraint(equalTo: ScrollViewView.leftAnchor, constant: 20.0).isActive = true
        stockButton.rightAnchor.constraint(equalTo: ScrollViewView.rightAnchor, constant: -20.0).isActive = true
        stockButton.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20.0).isActive = true
        stockButton.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        stockButton.setNeedsLayout()
        stockButton.layoutIfNeeded()
        stockButton.formButtonLayout()
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func Pressed(sender: UIButton!) {
        
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


