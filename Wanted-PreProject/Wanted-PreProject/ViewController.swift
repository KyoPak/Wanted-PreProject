//
//  ViewController.swift
//  Wanted-PreProject
//
//  Created by parkhyo on 2023/03/01.
//

import UIKit

final class ViewController: UIViewController {
    private let networkService = NetworkService()
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func selectImageView(tag: Int) -> UIImageView? {
        let imageView = [firstImageView,
                         secondImageView,
                         thirdImageView,
                         fourthImageView,
                         fifthImageView]
            .filter { imageView in
                
                if tag == imageView.tag {
                    return true
                }
                return false
            }
        
        return imageView.first
    }
}

extension ViewController {
    @IBAction func loadImageButtonTapped(_ sender: UIButton) {
        guard let request = try? NetworkReqeust(rawValue: sender.tag)?.generateRequest() else {
            return
        }
        
        let imageView = selectImageView(tag: sender.tag)
        
        networkService.request(request) { data in
            DispatchQueue.main.async {
                imageView?.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func loadAllImageButtonTapped(_ sender: UIButton) {
        for tag in 0..<5 {
            guard let request = try? NetworkReqeust(rawValue: tag)?.generateRequest() else {
                return
            }
            
            let imageView = self.selectImageView(tag: tag)
            
            networkService.request(request) { data in
                DispatchQueue.main.async {
                    imageView?.image = UIImage(data: data)
                }
            }
        }
    }
}
