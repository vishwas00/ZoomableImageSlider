//
//  ZoomedPhotoViewController.swift
//
//  Created by Vishwas Singh on 21/07/17.
//  Copyright © 2017 Vishwas Singh. All rights reserved.
//

import UIKit
import Kingfisher

let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

class ZoomedPhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    weak var pageVC: ZoomableImageSlider!
    var photoIndex: Int!
    private var imageUrl = ""
    private var totalImageCount = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        initUI()
    }
    
    convenience init(pageViewController: ZoomableImageSlider, index: Int, imageUrl: String, totalImageCount: Int) {
        self.init()
        
        pageVC = pageViewController
        self.photoIndex = index
        self.imageUrl = imageUrl
        self.totalImageCount = totalImageCount
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        scrollView.setZoomScale(1, animated: false)
    }
    
    
    func initUI()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        tapGesture.numberOfTapsRequired = 2
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownGestureAction))
        swipeGesture.direction = .down
        
        scrollView = UIScrollView(frame: frame)
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
        scrollView.delegate = self
        scrollView.addGestureRecognizer(tapGesture)
       
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swipeGesture)
        
        
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        addConstraints()
    }
    
    
    func addConstraints()
    {
        guard let scrollView = self.scrollView else { return }
        guard let imageView = self.imageView else { return }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let leadingConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let bottomConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        let topConstraint1 = NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        
        
        
        let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailing, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 0)
        
        
        let centerX = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.view.addConstraints([trailingConstraint1, leadingConstraint1, bottomConstraint1, bottomConstraint1, topConstraint1, trailingConstraint, leadingConstraint, bottomConstraint, bottomConstraint, topConstraint, centerX, centerY])
    }
    
    
    private func setData()
    {
        let url = URL(string: imageUrl)

        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: pageVC.placeHolderImage,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        pageVC.imageIndexLabel.text = "\(photoIndex! + 1)/\(totalImageCount)"
    }
    
    
    @objc func handleDoubleTap(gestureRecognizer: UIGestureRecognizer)
    {
        if(self.scrollView.zoomScale > self.scrollView.minimumZoomScale)
        {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }
        else
        {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
    
    @objc func swipeDownGestureAction()
    {
        pageVC?.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
