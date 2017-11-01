//
//  File.swift
//  TablePullToStickHeader
//
//  Created by Rupesh Kumar on 11/10/17.
//

import Foundation
import UIKit

class CustomHeaderView: UIView
{
    var userImage:UIImageView!
    var colorView:UIView!
    var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
    var titleLabel = UILabel()
    var headerIcon:UIImageView!
    
    init(frame:CGRect,title: String) {
        self.titleLabel.text = title.uppercased()
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView()
    {
        self.backgroundColor = UIColor.white
        userImage = UIImageView()
        userImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userImage)
        
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        let constraints:[NSLayoutConstraint] = [
            userImage.topAnchor.constraint(equalTo: self.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            userImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        // configure
        userImage.image = UIImage(named: "IMG_0347")
        userImage.contentMode = .scaleAspectFill
        
        colorView.backgroundColor = bgColor
        colorView.alpha = 0.6
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        let titlesConstraints:[NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
            ]
        NSLayoutConstraint.activate(titlesConstraints)
        
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        
        headerIcon = UIImageView()
        headerIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(headerIcon)
        
        let imageConstraints:[NSLayoutConstraint] = [
            headerIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 6),
            headerIcon.widthAnchor.constraint(equalToConstant: 40),
            headerIcon.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        
        headerIcon.image = UIImage(named: "crown")

        
    }
    
    func decrementColorAlpha(_ offset: CGFloat)
    {
        if self.colorView.alpha <= 1
        {
            let alphaOffset = (offset/500)/85
            self.colorView.alpha += alphaOffset
        }
    }
    
    
    func decrementStatusAlpha(_ offset: CGFloat)
    {
        if self.headerIcon.alpha >= 0
        {
            let alphaOffset = max((offset - 65)/85.0, 0)
            self.headerIcon.alpha = alphaOffset
        }
    }
    
    func incrementColorAlpha(_ offset: CGFloat)
    {
        if self.colorView.alpha >= 0.6
        {
            let alphaOffset = (offset/200)/85
            self.colorView.alpha -= alphaOffset
        }
    }
    
    func incrementStatusAlpha(_ offset: CGFloat)
    {
        if self.headerIcon.alpha <= 1
        {
            let alphaOffset = max((offset - 65)/85, 0)
            self.headerIcon.alpha = alphaOffset
        }
    }
}
