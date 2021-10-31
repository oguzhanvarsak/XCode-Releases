//
//  MainViewController.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import UIKit
import Alamofire
import PKHUD
import SwiftyJSON

class MainViewController: UIViewController {
    // MARK: Outlets
    // UICollectionView
    @IBOutlet weak var releasesCollectionView: UICollectionView!
    
    // MARK: Variables
    var compilerList: [Compiler]?
    var list: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        request()
        setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "detail":
            let url = sender as! String
            let destination = segue.destination as! DetailViewController
            destination.url = url
        default:
            break
        }
    }
    
    @IBAction func informationAct(_ sender: Any) {
        performSegue(withIdentifier: "info", sender: nil)
    }
}

extension MainViewController {
    func setup() {
        releasesCollectionView.register(UINib(nibName: "ReleaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReleaseCollectionViewCell")
        
        releasesCollectionView.delegate = self
        releasesCollectionView.dataSource = self
    }
    
    func request() {
        AF.request(GeneralSettings.url.main).responseJSON { response in
            HUD.show(HUDContentType.progress)
            switch response.result {
            case .success:
               
               if let jsonData = response.data {
                   let jsonDecoder = JSONDecoder()
                   do {
                       self.compilerList = try jsonDecoder.decode([Compiler].self, from: jsonData)
                       self.releasesCollectionView.reloadData()
                   } catch let error{
                       print(String(describing: error))
                   }
               }
            case .failure(let error):
               print(error)
            }
            
            HUD.hide(afterDelay: 0.2)
       }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return compilerList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReleaseCollectionViewCell", for: indexPath) as! ReleaseCollectionViewCell
        
        cell.prepareCell(release: compilerList?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: compilerList?[indexPath.row].links?.notes?.url)
    }
}
