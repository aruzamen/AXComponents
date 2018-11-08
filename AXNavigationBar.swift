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
    @IBOutlet weak var containerView: UIView!
    
    let defaultSideMenuIcon = "navbar-scores-side-button"
    let eventsSideMenuIcon = "navbar-events-side-button"
    let scoresSideMenuIcon = "navbar-scores-side-button"
    let notificationsSideMenuIcon = "navbar-notifications-side-button"
    let settingsSideMenuIcon = "navbar-settings-side-button"
    
    @IBInspectable var sectionName: String! {
        get {
            return self.title.text
        }
        set {
            self.title.text = newValue
            self.setSideMenuIcon(newValue)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.setSideMenuIcon("default")
        containerView = loadViewFromNib()
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(containerView)
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    private func setSideMenuIcon(_ section: String) {
        var sectionIcon: String
        
        switch section {
        case "Events":
            sectionIcon = eventsSideMenuIcon
        case "Scores":
            sectionIcon = scoresSideMenuIcon
        case "Notifications":
            sectionIcon = notificationsSideMenuIcon
        case "Settings":
            sectionIcon = settingsSideMenuIcon
        default:
            sectionIcon = defaultSideMenuIcon
        }
        
        self.sideMenuButton.setBackgroundImage(UIImage(named: sectionIcon), for: .normal)
    }
}
