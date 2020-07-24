//
//  ViewController.swift
//  ZoomableImageSlider
//
//  Created by Vishwas Singh on 05/10/2020.
//  Copyright (c) 2020 Vishwas Singh. All rights reserved.
//

import UIKit
import ZoomableImageSlider

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSlideButtonTapped(_ sender: Any)
    {
        let images = ["https://www.kurzweilai.net/images/iPhone4-S.jpg", "https://s-media-cache-ak0.pinimg.com/originals/93/aa/25/93aa2535372bb8d37ed42864ad55d904.jpg",  "https://images.all-free-download.com/images/graphicthumb/monitor_the_cameras_02_hd_picture_168726.jpg"]
        
        let vc = ZoomableImageSlider(images: images, currentIndex: nil, placeHolderImage: nil)
        present(vc, animated: true, completion: nil)
    }
    
    
}

