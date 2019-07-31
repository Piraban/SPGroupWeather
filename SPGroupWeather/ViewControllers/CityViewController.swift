//
//  CityViewController.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 28/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    //MARK:- Variable Declaration
    var cityVM    : CityViewModel!
    var selectedText : String = ""
    
    //MARK:- IBOutlet
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var txtHumidity: UILabel!
    @IBOutlet weak var txtTemperature: UILabel!
    @IBOutlet weak var txtDescription: UILabel!
    
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedText)
        
        self.showSpinner(onView: self.view)
        fetchCityWeather()
    }
    
    // to be called during testing
    init(viewModel: CityViewModel) {
        self.cityVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // required when called from storyboard
    required init?(coder aDecoder: NSCoder) {
        self.cityVM = CityViewModel()
        super.init(coder: aDecoder)
    }

    
    func fetchCityWeather(){
        cityVM.fetchWeather(selectedText, 1, { (success, result, error) -> Void in
            if(success) {
                self.setupUI()
            } else {
                self.removeSpinner()
            }
        })
    }
    
    
    func setupUI(){
        DispatchQueue.main.async(execute: { () -> Void in
            self.txtHumidity.text = self.cityVM.weather.humidity
            self.txtTemperature.text = self.cityVM.weather.temp_C
            self.txtDescription.text = self.cityVM.weather.weatherDesc
        })
        
        let url = URL(string: self.cityVM.weather.weatherIconUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) 
            DispatchQueue.main.async {
                self.weatherImage.image = UIImage(data: data!)
            }
        }
        
        self.removeSpinner()
    }
}
