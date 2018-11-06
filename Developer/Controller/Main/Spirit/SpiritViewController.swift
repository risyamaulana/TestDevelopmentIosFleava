//
//  SpiritViewController.swift
//  Developer
//
//  Created by Risya Maulana on 06/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit

class SpiritViewController: ViewController {

    @IBOutlet weak var spiritTableView: UITableView!
    @IBOutlet weak var badgeFilterView: RoundUiView!
    
    
    let profile = [UIImage(named: "profile_2")!, UIImage(named: "profile"), UIImage(named: "profile_3")]
    let images = [UIImage(named: "img")!, UIImage(named: "img_2"), UIImage(named: "img_3")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initSpiritTableView()
    }
    
    // Init table data of spirit view
    func initSpiritTableView(){
        spiritTableView.delegate = self
        spiritTableView.dataSource = self
    }
    
    // hide badge in filter button
    func hideBadgeInFilterButton(){
        badgeFilterView.isHidden = true
    }
    
    // show badge in filter button
    func showBadgeInFilterButton(){
        badgeFilterView.isHidden = false
    }
}

// Table view delegate & datasource init
extension SpiritViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.red
        
        return vw
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableView.dequeueReusableCell(withIdentifier: "cells")!
        let imageViewCell = cells.viewWithTag(1) as! UIImageView
        imageViewCell.image = images[indexPath.row]
        let profileImageViewCell = cells.viewWithTag(2) as! UIImageView
        profileImageViewCell.image = profile[indexPath.row]
        
        return cells
    }
    
    
}
