//
//  CustomProgressIndicator.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit


class ActivityIndicatorView {
    var view: UIView!
    var activityIndicator: UIActivityIndicatorView!
    var title: String!
    
    init(
        title: String,
        center: CGPoint,
        width: CGFloat = 140.0,
        height: CGFloat = 80.0
    ) {
        self.title = title
        
        let x = center.x - width/2.0
        let y = center.y - height/2.0
        
        self.view = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        self.view.backgroundColor = .lightGray.withAlphaComponent(0.2)
        self.view.layer.cornerRadius = 10
        
        // Indicator
        self.activityIndicator = UIActivityIndicatorView()
        self.activityIndicator.color = .black
        self.activityIndicator.hidesWhenStopped = false
        
        // Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        
        // StackView
        let vStack = UIStackView(arrangedSubviews: [self.activityIndicator, titleLabel])
        vStack.frame = CGRect(x: 0, y: 15, width: 140, height: 50)
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.alignment = .center
        vStack.spacing = 5
        
        self.view.addSubview(vStack)
    }
    
    func getViewActivityIndicator() -> UIView {
        return self.view
    }
    
    func startAnimating() {
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopAnimating() {
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
        self.view.removeFromSuperview()
    }
}
