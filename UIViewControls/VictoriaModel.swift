//
//  Running.swift
//  CodeCamp02
//
//  Created by Dũng Bé O on 11/16/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import Foundation
import UIKit

class VictoriaModel {
    var name : String
    var likeNumber : Int
    var portrait, image1 , image2 , image3 , image4 , image5 : UIImage
    
    init(name : String , likeNumber : Int , portraitPath : String , image1Path : String , image2Path : String , image3Path : String , image4Path : String , image5Path : String){
        self.name = name
        self.likeNumber = likeNumber
        self.portrait = UIImage(named: portraitPath)!
        self.image1 = UIImage(named: image1Path)!
        self.image2 = UIImage(named: image2Path)!
        self.image3 = UIImage(named: image3Path)!
        self.image4 = UIImage(named: image4Path)!
        self.image5 = UIImage(named: image5Path)!
    }
}