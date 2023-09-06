//
//  NewViewController.swift
//  RickAndMorty2
//
//  Created by Іван Штурхаль on 16.08.2023.
//

import UIKit

class NewViewController: UIViewController {

    
    
    @IBOutlet var myCollection: UICollectionViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myCollection)
        myCollection.backgroundColor = .blue
    }
    

   
}
