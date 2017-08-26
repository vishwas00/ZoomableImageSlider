//
//  ViewController.swift
//  ZoomableImageSlider
//
//  Created by vishwas00 on 08/26/2017.
//  Copyright (c) 2017 vishwas00. All rights reserved.
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

    @IBAction func showSliderButtonTapped(_ sender: Any)
    {
        let images = ["http://www.kurzweilai.net/images/iPhone4-S.jpg", "https://s-media-cache-ak0.pinimg.com/originals/93/aa/25/93aa2535372bb8d37ed42864ad55d904.jpg", "http://images.efulfilment.de/get_image/?t=29A598C0F35F861AECC5DF972434840B", "http://images.all-free-download.com/images/graphicthumb/monitor_the_cameras_02_hd_picture_168726.jpg"]
        
        let vc = ZoomableImageSlider(images: images, currentIndex: nil)
        present(vc, animated: true, completion: nil)
    }
    
    
}

