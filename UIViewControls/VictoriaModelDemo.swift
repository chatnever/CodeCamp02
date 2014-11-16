//
//  Running.swift
//  CodeCamp02
//
//  Created by Dũng Bé O on 11/16/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class VictoriaModelDemo: UITableViewController {
    let cellID = "#"
    var data = Array<VictoriaModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "CustomCell", bundle: nil)
        self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        initData()
    }
    func initData() {
        data.append(VictoriaModel(name: "Candice Swanepoel", likeNumber: 10, portraitPath: "Candice Swanepoel01.jpg", image1Path: "Candice Swanepoel01.jpg", image2Path: "Candice Swanepoel02.jpg", image3Path: "Candice Swanepoel03.jpg", image4Path: "Candice Swanepoel04.jpg", image5Path: "Candice Swanepoel05.jpg"))
        data.append(VictoriaModel(name: "Lily Aldridge", likeNumber: 20, portraitPath: "Lily Aldridge02.jpg", image1Path: "Lily Aldridge01.jpg", image2Path: "Lily Aldridge02.jpg", image3Path: "Lily Aldridge03.jpg", image4Path: "Lily Aldridge04.jpg", image5Path: "Lily Aldridge05.jpg"))
        data.append(VictoriaModel(name: "Lindsay Ellingson", likeNumber: 30, portraitPath: "Lindsay Ellingson01.jpg", image1Path: "Lindsay Ellingson01.jpg", image2Path: "Lindsay Ellingson02.jpg", image3Path: "Lindsay Ellingson03.jpg", image4Path: "Lindsay Ellingson04.jpg", image5Path: "Lindsay Ellingson05.jpg"))
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as UITableViewCell
        var cell: CustomCell!
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as? CustomCell {
            cell = dequeCell
        }
        let victoriaModel = data[indexPath.row]
        cell.modelName.text = victoriaModel.name
        cell.modelName.textColor = UIColor.whiteColor()
        cell.likeNumber.text = String(victoriaModel.likeNumber)
        cell.likeNumber.textColor = UIColor.whiteColor()
        cell.portraitImage.image = victoriaModel.portrait
        cell.portraitImage.layer.masksToBounds = true
        
        cell.portraitImage.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).CGColor
        var imageSize = 50 as CGFloat
        cell.portraitImage.layer.cornerRadius = imageSize / 2
        cell.portraitImage.layer.borderWidth = 4
        
        
        for  i in 0..<5 {
            if (i == 0){
                var imageOne : UIImageView = UIImageView(image: victoriaModel.image1)
                imageOne.frame = CGRect(x: 100 * i + 2, y: 0, width: 100, height: 150)
                cell.albumImage.addSubview(imageOne)
            }
            else if (i == 1){
                var imageTwo : UIImageView = UIImageView(image: victoriaModel.image2)
                imageTwo.frame = CGRect(x: 100 * i + 2, y: 0, width: 100, height: 150)
                cell.albumImage.addSubview(imageTwo)
            }
            else if (i == 2){
                var imageThree : UIImageView = UIImageView(image: victoriaModel.image3)
                imageThree.frame = CGRect(x: 100 * i + 2, y: 0, width: 100, height: 150)
                cell.albumImage.addSubview(imageThree)
            }
            else if (i == 3){
                var imageFour : UIImageView = UIImageView(image: victoriaModel.image4)
                imageFour.frame = CGRect(x: 100 * i + 2, y: 0, width: 100, height: 150)
                cell.albumImage.addSubview(imageFour)
            }else {
                var imageFive : UIImageView = UIImageView(image: victoriaModel.image5)
                imageFive.frame = CGRect(x: 100 * i + 2, y: 0, width: 100, height: 150)
                cell.albumImage.addSubview(imageFive)
            }
            cell.albumImage.contentSize = CGSizeMake(510, 150)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 210
    }

    

}
