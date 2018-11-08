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
    @IBOutlet weak var containerView: UIView!
    
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
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}
