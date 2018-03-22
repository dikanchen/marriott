//
//  Hotelinfo.swift
//  Marriott
//
//  Created by User on 3/19/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import Foundation

class Hotelinfo{
    var fbhotelname: String?
    var fbaddress: String?
    var fbchildref: String?
    var fbdailyprice: String?
    var fbdates: String?
    var fbnights: String?
    var fbrates: String?
    var fbrooms: String?
    var fbtypes: String?
    var fbtax: String?
    var fbtotalprice: String?
    var fbdays: String?
    
    init(fbhotelname: String?, fbaddress: String?, fbchildref: String?, fbdailyprice: String?, fbdates: String?, fbnights: String?, fbrates: String?, fbrooms: String?, fbtypes: String?, fbtax: String?, fbtotalprice: String?, fbdays: String?){
        self.fbhotelname = fbhotelname
        self.fbaddress = fbaddress
        self.fbchildref = fbchildref
        self.fbdailyprice = fbdailyprice
        self.fbdates = fbdates
        self.fbnights = fbnights
        self.fbrates = fbrates
        self.fbrooms = fbrooms
        self.fbtypes = fbtypes
        self.fbtax = fbtax
        self.fbtotalprice = fbtotalprice
        self.fbdays = fbdays
    }
}
