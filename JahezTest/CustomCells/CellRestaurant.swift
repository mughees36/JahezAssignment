//
//  CellRestaurant.swift
//  JahezTest
//
//  Created by Mughees Mustafa on 08/03/2022.
//

import UIKit
import SDWebImage

class CellRestaurant: UICollectionViewCell {
    
    let lblName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    let lblDistance: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
       
    let imgRestaurant: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           addViews()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){

        addSubview(lblName)
        addSubview(lblDistance)
        addSubview(imgRestaurant)
        
        imgRestaurant.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        imgRestaurant.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        imgRestaurant.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgRestaurant.widthAnchor.constraint(equalToConstant: 100).isActive = true
        

        lblName.leftAnchor.constraint(equalTo: imgRestaurant.rightAnchor, constant: 5).isActive = true
        lblName.centerYAnchor.constraint(equalTo: imgRestaurant.centerYAnchor, constant: -8).isActive = true

        lblDistance.leftAnchor.constraint(equalTo: imgRestaurant.rightAnchor, constant: 5).isActive = true
        lblDistance.centerYAnchor.constraint(equalTo: imgRestaurant.centerYAnchor, constant: 8).isActive = true

        
    }
    
    func setValues(restaurant:RestaurantModel){
        
        
        lblName.text = restaurant.name
        lblDistance.text = ("\(restaurant.distance)")
        imgRestaurant.sd_setImage(with: URL(string: restaurant.image), placeholderImage: UIImage(named: "placeholder.png"))

        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
            let attrs = super.preferredLayoutAttributesFitting(layoutAttributes)
            attrs.bounds.size.height = 120
            return attrs
        }
}
