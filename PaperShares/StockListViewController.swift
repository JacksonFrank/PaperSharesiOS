//
//  StockListViewController.swift
//  PaperShares
//
//  Created by Jackson Frank on 5/23/18.
//  Copyright © 2018 9064. All rights reserved.
//

import UIKit

class StockListViewController: UIViewController {
    
    @IBOutlet weak var ScrollViewView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let button1 = UIButton(frame: CGRect(x:20, y:20, width:300, height: 100))
        button1.backgroundColor = .green
        button1.setTitle("Stock", for: .normal)
        button1.addTarget(self, action: Selector(("button1Action")), for: .touchUpInside)
        self.ScrollViewView.addSubview(button1)
    }
    
    
    func button1Action(sender: UIButton){
        
    }
   
    
}
