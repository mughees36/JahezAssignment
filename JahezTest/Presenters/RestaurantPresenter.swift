//
//  QuestionPresenter.swift
//  SwiftyChallenge
//
//  Created by Mughees Mustafa on 16/02/2022.
//  Copyright © 2022 Monish Syed . All rights reserved.
//

import Foundation

class RestaurantPresenter {
    
    weak private var restaurantPresenterDelegate: RestaurantPresenterDelegate?
    var arrRestaurants = [RestaurantModel]()
    var arrRestaurantsWithOffers = [RestaurantModel]()
    
    func setViewDelegate(restaurantPresenterDelegate:RestaurantPresenterDelegate?){
        
        self.restaurantPresenterDelegate = restaurantPresenterDelegate
        
    }
    
    func getRestaurantsWithOffers(){

        arrRestaurantsWithOffers = arrRestaurants.filter { $0.hasOffer == true }
        self.restaurantPresenterDelegate?.displayRestaurants(restaurants: arrRestaurantsWithOffers)
    }
    
    
    
    func getRestaurants(){
        
        let request = ServiceRequest(url: URL(string: Api.getRestaurants.rawValue)!)
        
        
        let service = NetworkService()
        service.get(request: request) { [self] result in
            
            switch result{
                
            case .success(let data):
                
                print(data)
                do{
                    let model = try JSONDecoder().decode([RestaurantModel].self, from: data)
                    
                    print(model)
                    arrRestaurants = model
                    restaurantPresenterDelegate?.displayRestaurants(restaurants: arrRestaurants)
                } catch{
                    
                    print(error)
                    
                }
            case .failure(let error):
                
                print(error)
                
            }
            
            
            
        }
    }
    
}

protocol RestaurantPresenterDelegate: AnyObject {
    
    func displayRestaurants(restaurants: [RestaurantModel])
    
}
