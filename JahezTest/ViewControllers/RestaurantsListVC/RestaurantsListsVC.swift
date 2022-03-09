//
//  RestaurantsListsVC.swift
//  JahezTest
//
//  Created by Mughees Mustafa on 08/03/2022.
//

import UIKit

class RestaurantsListsVC: UIViewController {

    var collectionView: UICollectionView!
    var cellId = "Cell"
    var arrRestaurants = [RestaurantModel]()
    
    let presnter = RestaurantPresenter()

    let lblOffer: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.text = "Click to see the the restaurants with offers only"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnOffer: UIButton = {
        
        let button = UIButton()
        button.setTitle("Offers", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(btnOfferClicked), for: .touchUpInside)
        return button
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewSetUp()
        self.setConstraints()

        
        
      
        
       
        

           
    }
    
    func viewSetUp(){
        
        self.title = "Restaurant Lists"
        // Create list layout
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        presnter.setViewDelegate(restaurantPresenterDelegate: self)
        presnter.getRestaurants()
        
      
        
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        
        // Create collection view with list layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.delegate = self
        collectionView.dataSource = self

        view.addSubview(lblOffer)
        view.addSubview(btnOffer)
        view.addSubview(collectionView)
        
        collectionView.register(CellRestaurant.self, forCellWithReuseIdentifier: cellId)

        
    }
    
    func setConstraints(){
        
        //lblOffer constraints
        lblOffer.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5).isActive = true
        lblOffer.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        
        //btnOffer constraints
        NSLayoutConstraint(
                    item: btnOffer,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: lblOffer,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 5).isActive = true
        btnOffer.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        btnOffer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnOffer.widthAnchor.constraint(equalToConstant: 60).isActive = true

        //collectionView constraints
        
        // Make collection view take up the entire view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
        ])
        
    }
    
    @objc func btnOfferClicked() {
        
        presnter.getRestaurantsWithOffers()
    }

}

extension RestaurantsListsVC: UICollectionViewDelegate, UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrRestaurants.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! CellRestaurant
        
        cell.setValues(restaurant: arrRestaurants[indexPath.row])
        
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        
        let restaurant = arrRestaurants[indexPath.row]
        
        let vc = RestaurantDescription()
        vc.restaurant = restaurant
        self.present(vc, animated: true, completion: nil)
        
       
    }
}

extension RestaurantsListsVC: RestaurantPresenterDelegate{
    func displayRestaurants(restaurants: [RestaurantModel]) {
        
        DispatchQueue.main.async { [self] in
            
            arrRestaurants = restaurants
            self.collectionView.reloadData()
        }
    }
    
    
    
    
}
