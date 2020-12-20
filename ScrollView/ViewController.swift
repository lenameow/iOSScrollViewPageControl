//
//  ViewController.swift
//  ScrollView
//
//  Created by Lena on 19/12/20.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private func setupSlides() {
        // set up customized slide views
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(changePage(sender:)), for: UIControl.Event.valueChanged)
    }
    
    private func configureScrollView() {
        scrollView.delegate = self
        setupSlides()
        // make scroll view stops at multiples of the scroll view's bounds
        scrollView.isPagingEnabled = true
        // manually prohibit scrolling up & down
        // not sure why, but putting page control on top of scroll view would cause top & bottom anchor from content to the scroll view frame to fail. User can scroll up & down
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        configureScrollView()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}

