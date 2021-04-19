//
//  nextPrayerView.swift
//  RamdanPro
//
//  Created by Apple on 12/04/2021.
//

import SwiftUI
import Adhan

struct nextPrayerView: View {
    
    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
    let coordinates = Coordinates(latitude: 33.3723, longitude: 73.63)
    @ObservedObject var direction = qiblaFinder()
    
    func countdown()->Void{
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        var params = CalculationMethod.moonsightingCommittee.params
        params.madhab = .hanafi
        
        if let prayerTimes = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params){
            let current = prayerTimes.currentPrayer()
            let next = prayerTimes.nextPrayer()
            let countdown = prayerTimes.time(for: next!)
            print(current!)
            print(next!)
            print(countdown)
        }
    }
        var body: some View {
            
            ZStack{
                VStack{
                    
                    Button(action: {countdown()}, label: {
                        Text("countdown")
                    })
                    
                }
            }
           
            
            
            
        }
}

struct nextPrayerView_Previews: PreviewProvider {
    static var previews: some View {
        nextPrayerView()
    }
}
