//
//  SettingsVC.swift
//  9.hafta
//
//  Created by İSMAİL AÇIKYÜREK on 14.05.2022.
//

import UIKit
import MapKit
import CoreLocation

class SettingsVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, CLLocationManagerDelegate {
  
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblLangues: UILabel!
    @IBOutlet weak var lblLocal: UILabel!
    
    @IBOutlet weak var txtLangues: UITextField!
    
    var langues = ["İngilizce","Türkçe","Almanca"]
    var pickerView = UIPickerView()
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        imageView.layer.cornerRadius = 34
        imageView.isUserInteractionEnabled = true //tıklanabilir hale getirme
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage)) //shoseımge fonksiyonunu çağır
        imageView.addGestureRecognizer(gestureRecognizer)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtLangues.inputView = pickerView
    }
    
  
    @objc func chooseImage() {
        
    let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
      
    }
    
    @IBAction func localSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("açık")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum : CLLocation = locations[locations.count-1]
        
    }
    
    
}

extension SettingsVC : UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        langues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        langues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtLangues.text = langues[row]
        txtLangues.resignFirstResponder()
        if row == 0 {
          ingilizce()
        }
        if row == 1 {
           
            Turkce()
        }
        if row == 2 {
            Almanca()
        }
        
    }
    func Almanca() {
        lblname.text = "Vorname"
        lblLastName.text = "Nachname"
        lblLocal.text = "Standorterlaubnis"
        lblLangues.text = "Sprache"
         langues = ["Türkisch","Englisch","Deutsch"]
        txtLangues.text = "Deutsch"
    }
    func Turkce() {
        lblname.text = "Adı"
        lblLastName.text = "Soyadı"
        lblLocal.text = "Konum İzni"
        lblLangues.text = "Dil"
         langues = ["Türkçe","İngilizce","Almanca"]
        txtLangues.text = "Türkçe"
    }
    func ingilizce() {
        lblname.text = "name"
        lblLastName.text = "lastname"
        lblLocal.text = "loca permission"
        lblLangues.text = "Langues"
        langues = ["Turkish","Engilish","Germany"]
        txtLangues.text = "English"
    
}
}
