//
//  AXNavigationBar.swift
//  AXCore
//
//  Created by marze on 11/8/18.
//  Copyright © 2018 Marcelo Aruzamen. All rights reserved.
//

import UIKit

@IBDesignable
class AXNavigationBar: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var calendarViewHeight: NSLayoutConstraint!
    var calendarHeight: CGFloat = 0
    
    @IBInspectable var sectionName: String! {
        get {
            return self.title.text
        }
        set {
            self.title.text = newValue
        }
    }
    
    @IBInspectable var organization: String! {
        get {
            return self.subtitle.text
        }
        set {
            self.subtitle.text = newValue
        }
    }
    
    @IBInspectable var calendarIcon: UIImage! {
        get {
            return self.calendarButton.backgroundImage(for: .normal)
        }
        set {
            self.calendarButton.setBackgroundImage(newValue, for: .normal)
        }
    }
    
    @IBInspectable var sideMenuIcon: UIImage! {
        get {
            return self.sideMenuButton.backgroundImage(for: .normal)
        }
        set {
            self.sideMenuButton.setBackgroundImage(newValue, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        containerView = loadViewFromNib()
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(containerView)
        
        calendarView.isHidden = true
        calendarHeight = calendarViewHeight.constant
        calendarViewHeight.constant = 0
        
        closeButton.layer.masksToBounds = false
        closeButton.layer.shadowOffset = CGSize(width: 0, height: 10)
        closeButton.layer.shadowColor = UIColor.gray.cgColor
        closeButton.layer.shadowOpacity = 0.50
        closeButton.layer.shadowRadius = 10
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func calendarButtonTapped(_ sender: Any) {
        self.toggleCalendarView()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.toggleCalendarView()
    }
    
    private func toggleCalendarView() {
        calendarView.isHidden = !calendarView.isHidden
        
        if calendarView.isHidden {
            calendarViewHeight.constant = 0
        } else {
            calendarViewHeight.constant = calendarHeight
        }
    }
}
