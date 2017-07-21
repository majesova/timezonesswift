//
//  ViewController.swift
//  timezones
//
//  Created by MANUEL SOBERANIS on 20/07/17.
//  Copyright © 2017 com.majesova. All rights reserved.
//

import UIKit
import Foundation
import SwiftDate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fechaAlmacenada = "2017-07-10T11:50:00" //Dato almacenado en el wizard
        let fechaFromWS = "2017-07-10T16:50:00" //Dato que viene del WS
        let dateFormatter = DateFormatter()
        
        
        do{
        //ST-ElENA TIENE GMT 0 (Sirve de pivote para UTC)
        let regionUTC = Region(tz: TimeZoneName.atlanticStHelena, cal: .current, loc: LocaleName.englishStHelena)
        //Buenos aires GMT-3
        let regionARG = Region(tz:TimeZoneName.americaArgentinaBuenosAires, cal: .current, loc: LocaleName.spanishArgentina)
        //region current del celular, english por que viene en ese formato
        let regionCurrent = Region(tz: .current, cal: CalendarName.gregorian, loc: .english)
        
        let now = DateInRegion()
        let nowString = now.absoluteDate.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"))
        let nowUTC = now.absoluteDate
        let nowUTCString = nowUTC.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"), in: regionUTC)
            print("fechas locales")
            print("    NOW:\(now)")
            print("NOW STR:\(nowString)")
            print("    UTC:\(nowUTC)")
            print(" SERVER: \(nowUTCString)")
            
        let fecha = try DateInRegion(string: fechaAlmacenada, format: .custom("yyyy-MM-dd'T'HH:mm:ss"), fromRegion: regionCurrent)
        let fechaString = fecha.absoluteDate.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"))
        let fechaUTC = fecha.absoluteDate
        let fechaUTCString = fechaUTC.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"), in: regionUTC)
            
            
            print("Fechas almacenadas")
            print("      ALM: \(fecha)")
            print(  "ALM STR: \(fechaString)")
            print("      UTC: \(fechaUTC)")
            print("TO SERVER: \(fechaUTCString)")
            
            let fechaWSUTC = try DateInRegion(string: fechaFromWS, format: .custom("yyyy-MM-dd'T'HH:mm:ss"), fromRegion: regionUTC)
            let fechaWSUTCString = fechaWSUTC.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"))
            let fechaWSLocal = fechaWSUTC.toRegion(.Local()) //Local
            let fechaWSLocalString = fechaWSLocal.absoluteDate.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"), in: regionCurrent)
            
            
            print("Fechas WS")
            print("      ORIGINAL UTC: \(fechaFromWS)")
            print("            UTC TZ: \(fechaWSUTC)")
            print("           UTC STR: \(fechaWSUTCString)")
            print("         LOCALE TZ: \(fechaWSLocal)")
            print("      LOCALE TZ STR: \(fechaWSLocalString)")
            
        
        let arg = DateInRegion(absoluteDate: Date(), in: regionARG)
        let argString = arg.absoluteDate.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"))
        let argUTC = arg.absoluteDate
        let argUTCString = argUTC.string(format: .custom("yyyy-MM-dd'T'HH:mm:ss"), in: regionUTC)
       
            /*print("Fechas arg")
            print("\(arg)")
            print("\(argString)")
            print("\(argUTC)")
            print("\(argUTCString)")*/
            
        
            
        /*
             RESULTS:
             12 HRS
             
             fechas locales
             NOW:21/07/2017 12:43:59 a.m. GMT-5
             NOW STR:2017-07-21T12:43:59 a.m.
             UTC:2017-07-21 5:43:59 a.m. +0000
             SERVER: 2017-07-21T05:43:59
             Fechas almacenadas
             ALM: Jul 10, 2017, 11:50:00 AM CDT
             ALM STR: 2017-07-10T11:50:00 a.m.
             UTC: 2017-07-10 4:50:00 p.m. +0000
             TO SERVER: 2017-07-10T16:50:00
             Fechas WS
             ORIGINAL UTC: 2017-07-10T16:50:00
             UTC TZ: 10 Jul 2017, 16:50:00 GMT
             UTC STR: 2017-07-10T16:50:00
             LOCALE TZ: 10/07/2017 11:50:00 a.m. GMT-5
             LOCALE TZ STR: 2017-07-10T11:50:00
             
             
             
             24 HRS
             
             fechas locales
             NOW:21/07/2017 00:42:55 GMT-5
             NOW STR:2017-07-21T00:42:55
             UTC:2017-07-21 05:42:55 +0000
             SERVER: 2017-07-21T05:42:55
             Fechas almacenadas
             ALM: Jul 10, 2017, 11:50:00 AM CDT
             ALM STR: 2017-07-10T11:50:00
             UTC: 2017-07-10 16:50:00 +0000
             TO SERVER: 2017-07-10T16:50:00
             Fechas WS
             ORIGINAL UTC: 2017-07-10T16:50:00
             UTC TZ: 10 Jul 2017, 16:50:00 GMT
             UTC STR: 2017-07-10T16:50:00
             LOCALE TZ: 10/07/2017 11:50:00 GMT-5
             LOCALE TZ STR: 2017-07-10T11:50:00
             

             */
            
        
        //print(str)
        }catch {
            print(error)
        }
        
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

