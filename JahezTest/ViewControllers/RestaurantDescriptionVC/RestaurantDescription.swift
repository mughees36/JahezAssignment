//
//  RestaurantDescription.swift
//  JahezTest
//
//  Created by Mughees Mustafa on 08/03/2022.
//

import UIKit

class RestaurantDescription: UIViewController {

    var restaurant: RestaurantModel?
    
    let lblName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.text = "Click naem asdf asdf"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblHours: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblRating: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.text = "8.0"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let imgRestaurant: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewSetUp()
        self.setConstraints()
        
       
        
        
    }
    
    func viewSetUp(){
        
        view.isOpaque = false
        view.backgroundColor = .white
        
        //add views
        view.addSubview(lblName)
        view.addSubview(lblDescription)
        view.addSubview(lblHours)
        view.addSubview(lblRating)
        view.addSubview(imgRestaurant)
        
        //set data
        
        imgRestaurant.sd_setImage(with: URL(string: restaurant!.image), placeholderImage: UIImage(named: "placeholder.png"))
        lblName.text = restaurant!.name
        lblDescription.text = restaurant!.description
        lblHours.text = restaurant!.hours
        lblRating.text = "\(restaurant!.rating)"
        
        
    }
    
    func setConstraints() {
        
        //image Restaurant constraints
        
        imgRestaurant.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        imgRestaurant.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        imgRestaurant.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        imgRestaurant.heightAnchor.constraint(equalToConstant: 200).isActive = true

        //lblName constraints
        
        NSLayoutConstraint(
                    item: lblName,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: imgRestaurant,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 5).isActive = true
        lblName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5.0).isActive = true
        
        //lblDescription constraints
        
        NSLayoutConstraint(
                    item: lblDescription,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: imgRestaurant,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 5).isActive = true
        NSLayoutConstraint(
                    item: lblDescription,
                    attribute: .leading,
                    relatedBy: .equal,
                    toItem: lblName,
                    attribute: .trailing,
                    multiplier: 1,
                    constant: 8).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        lblDescription.numberOfLines = 0
        
        //lblHours constraints
        
        NSLayoutConstraint(
                    item: lblHours,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: lblDescription,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 5).isActive = true
        NSLayoutConstraint(
                    item: lblHours,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .width,
                    multiplier: 0.5,
                    constant: 0.0).isActive = true
        lblHours.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        lblHours.textAlignment = .center
        
        //lblRating constraints
        
        NSLayoutConstraint(
                    item: lblRating,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: lblDescription,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 5).isActive = true
        NSLayoutConstraint(
                    item: lblRating,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .width,
                    multiplier: 0.5,
                    constant: 0.0).isActive = true
        NSLayoutConstraint(
                    item: lblRating,
                    attribute: .leading,
                    relatedBy: .equal,
                    toItem: lblHours,
                    attribute: .trailing,
                    multiplier: 1,
                    constant: 0).isActive = true
        
    }


}

