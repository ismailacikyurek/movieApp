//
//  ViewController.swift
//  9.hafta
//
//  Created by İSMAİL AÇIKYÜREK on 14.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var movieListe = [Movie]()
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.collectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: genislik/80, left: genislik/80, bottom: genislik/80, right: genislik/80)
        tasarim.itemSize = CGSize(width: (genislik-65)/2, height: (genislik-20)/1)
        tasarim.minimumLineSpacing = 5
        tasarim.minimumInteritemSpacing = 1
        collectionView.collectionViewLayout = tasarim
        
        allPopulerMovieCall()
       
    }

    func allPopulerMovieCall() {
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=e1f05eb6d6888cc4a751a49802070b48", method: .get).responseJSON { [self] response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(BaseTheMovie.self, from: data)
                    if let gelenFilmListesi = cevap.results {
                        self.movieListe = gelenFilmListesi
                       
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
}
   
  
       
        
    
    

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let film = movieListe[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviewCollectionViewCell
        cell.imageView.image = UIImage(named: "\(film.originalTitle)")
        cell.movieNameLbl.text = film.title
        cell.layer.borderWidth = 1
        return cell
        
    }
    
    
}
