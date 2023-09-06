//
//  ViewController.swift
//  RickAndMorty2
//
//  Created by Іван Штурхаль on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: UI properties
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.backgroundColor = .black
    }
    
    // MARK: Functions
    // download data
    func downloadChar() {
        // create URL
        let urlString = "https://rickandmortyapi.com/api/character/1"
        // check URL with guard
        guard let myUrl = URL(string: urlString) else {
            print("помилка адреси")
            return }
        // start URL session
        URLSession.shared.dataTask(with: myUrl) { data, response, error in
            // 1st - error
            if let errorConnect = error {
                print(errorConnect)
                return
            }
            // 2nd - response, data
            if let dataMessage = data, let responseMessage = response {
                // create JSON session
                guard let session = try? JSONDecoder().decode(RickAndMorty.self, from: dataMessage) else {
                    print(responseMessage)
                    print("Sashay away")
                    return
                }
                // convert sessions name to image
                guard let adressImage = URL(string: session.image) else { return }
                // choose URL Session on configuration default
                let imageViewSession = URLSession(configuration: .default)
                // create session with image data task
                let imageTask = imageViewSession.dataTask(with: adressImage) { data, response, error in
                    guard let data = data, error == nil else { return }
                    // choose new thread
                    DispatchQueue.main.async {
                        // data - .jpg
                        self.myImageView.image = UIImage(data: data)
                        self.myImageView.layer.cornerRadius = 15
                    }

                }
                imageTask.resume()
                // choose new thread
                DispatchQueue.main.async {
                    self.myLabel.textColor = .white
                    self.myLabel.text = "This is \(session.name), he/she is a \(session.gender)"
                }
            } else { return }
            
            
        }.resume()
    
    }
    
  //MARK: Actions
    @IBAction func myAction(_ sender: Any) {
       // push function
        downloadChar()
        
    }
    
}
