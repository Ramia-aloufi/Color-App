//
//  ViewController.swift
//  Movie App
//
//  Created by R on 18/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var changImg: UIImageView!
    
    @IBOutlet weak var collectionview: UICollectionView!
    var array = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        if let flowLayout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.itemSize = CGSize(width: 200, height: 150)
        }
        getApi().ApiData { (movie) in
            for i in movie{
                self.array.append(i)
            }
            DispatchQueue.main.async {
                self.collectionview.reloadData()
            }
        }

    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(array.count)
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        let url = URL(string: array[indexPath.item].thumbnailUrl)
        let data = try? Data(contentsOf: url!)
        cell.lbl.text = array[indexPath.item].title
        cell.img.image = UIImage(data: data!)
        

                return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: array[indexPath.item].thumbnailUrl)
        let data = try? Data(contentsOf: url!)
        changImg.image = UIImage(data: data!)
        
    }
    






}

