//
//  ViewController.swift
//  PaperShares
//
//  Created by Jackson Frank on 5/17/18.
//  Copyright © 2018 9064. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StocksButton: UIButton!
    @IBOutlet weak var SetWallpaperButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //StocksButton.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        //StocksButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        
        //SetWallpaperButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        //SetWallpaperButton.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        
        
        StocksButton.titleLabel?.textAlignment = .center
        SetWallpaperButton.titleLabel?.textAlignment = .center
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    @IBAction func GoToStockList(_ sender: UIButton) {
        let newStoryBoard = UIStoryboard(name: "StockList", bundle: nil)
        let newVC = newStoryBoard.instantiateViewController(withIdentifier: "StockListViewController") as UIViewController
        present(newVC, animated: true, completion: nil)
    }
    */
    
}

