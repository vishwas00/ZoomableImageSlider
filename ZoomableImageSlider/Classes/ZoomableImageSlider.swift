//
//  PageViewController.swift
//
//  Created by Vishwas Singh on 21/07/17.
//  Copyright © 2017 Vishwas Singh. All rights reserved.//

import UIKit

public class ZoomableImageSlider: UIPageViewController {
    
    var placeHolderImage: UIImage?
    var images = [String]()
    fileprivate var currentIndex: Int?
    let imageIndexLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
    let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required public init?(coder: NSCoder) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        basicSetUp()
    }
    
    
    public convenience init(images: [String], currentIndex: Int?, placeHolderImage: UIImage?) {
        self.init()
        
        self.images = images
        if let _ = currentIndex {
            self.currentIndex = currentIndex!
        }
        basicSetUp()
    }
    
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    
    func basicSetUp() {
        dataSource = self
        self.view.backgroundColor = UIColor.white
        
        
        // 1
        if let viewController = getZoomedPhotoViewController(currentIndex ?? 0) {
            let viewControllers = [viewController]
            // 2
            setViewControllers(viewControllers,
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
        
        setUpUI()
    }
    
    func setUpUI()
    {
        closeButton.setBackgroundImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(imageIndexLabel)
        self.view.addSubview(closeButton)
        self.view.bringSubview(toFront: imageIndexLabel)
        self.view.bringSubview(toFront: closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        imageIndexLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelTrailingConstraint = NSLayoutConstraint(item: imageIndexLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -8)
        let labelBottomConstraint = NSLayoutConstraint(item: imageIndexLabel, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -8)
        
        let closeButtonLeadingConstraint = NSLayoutConstraint(item: closeButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 8)
        let closeButtonTopConstraint = NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 8)
        let closeButtonWidthConstraint = NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 40)
        let closeButtonHeightConstraint = NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40)
        
        
        
        self.view.addConstraints([labelTrailingConstraint, labelBottomConstraint, closeButtonLeadingConstraint, closeButtonTopConstraint, closeButtonWidthConstraint, closeButtonHeightConstraint])
    }
    
    
    func getZoomedPhotoViewController(_ index: Int) -> ZoomedPhotoViewController?
    {
        let page = ZoomedPhotoViewController(pageViewController: self, index: index, imageUrl: images[index], totalImageCount: images.count)
        return page
    }
    
    
    
    func closeButtonTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: implementation of UIPageViewControllerDataSource
extension ZoomableImageSlider: UIPageViewControllerDataSource {
    // 1
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? ZoomedPhotoViewController,
            let index = viewController.photoIndex,
            index > 0 {
            return getZoomedPhotoViewController(index - 1)
        }
        
        return nil
    }
    
    // 2
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? ZoomedPhotoViewController,
            let index = viewController.photoIndex,
            (index + 1) < images.count {
            return getZoomedPhotoViewController(index + 1)
        }
        
        return nil
    }
    
    // MARK: UIPageControl
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex ?? 0
    }
}





