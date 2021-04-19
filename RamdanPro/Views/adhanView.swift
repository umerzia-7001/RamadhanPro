//
//  adhanView.swift
//  RamdanPro
//
//  Created by Apple on 10/04/2021.
//

import SwiftUI
import Adhan

struct adhanView: View {
    
    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
    let coordinates = Coordinates(latitude: 33.3723, longitude: 73.63)
    let size = UIScreen.main.bounds
    
    @State var sunrize : String
    @State var fajr : String
    @State var dhuhr : String
    @State var asr : String
    @State var maghrib : String
    @State var isha : String


    func calculateTime()->Void{
        
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        
        var params = CalculationMethod.moonsightingCommittee.params
        params.madhab = .hanafi
        if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.timeZone = TimeZone(identifier: "Asia/Karachi")!

            self.sunrize = formatter.string(from: prayers.sunrise)
            self.fajr = formatter.string(from: prayers.fajr)
            self.dhuhr = formatter.string(from: prayers.dhuhr)
            self.asr = formatter.string(from: prayers.asr)
            self.maghrib = formatter.string(from: prayers.maghrib)
            self.isha = formatter.string(from: prayers.isha)
            
    }

       
    }
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color("background5"), Color("background6")]), startPoint: .top, endPoint: .bottom)
 
            VStack(alignment:.center){
            
            Spacer()
            HStack(spacing:10){
                
                Image(systemName: "sunrise")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(20)
                    .cornerRadius(10)
            
                
                Text(fajr)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding(10)
   
                
            }

            HStack(spacing:10){
                
                Image(systemName: "sun.max")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(20)
                    .cornerRadius(10)
                
                Text(dhuhr)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding(10)
                
                
            }

            HStack(spacing:10){
                
                Image(systemName: "sun.min")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(20)
                    .cornerRadius(10)
                
                Text(asr)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding(10)
                
                
            }

            HStack(spacing:10){
                
                Image(systemName: "sunset")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(20)
                    .cornerRadius(10)
                
                Text(maghrib)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding(10)
                
                
            }
    
            HStack(spacing:10){
                Image(systemName: "moon")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(20)
                    .cornerRadius(10)
                
                Text(isha)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding(10)
                    
                
                
            }
            Spacer()
            
        }
        .background(Color("background6"))
        .cornerRadius(30)
        .frame(width: size.width, height: size.height/2, alignment: .center)
         .shadow(color: Color("background5"), radius: 20, x: 0, y: 20)
            
        }
        
        .onAppear(perform: {
            calculateTime()
        })
        
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
   
    
}
struct adhanView_Previews: PreviewProvider {
    static var previews: some View {
        adhanView(sunrize: "1", fajr: "0", dhuhr: "0", asr: "0", maghrib: "0", isha: "0")
    }
}

// for next prayer timings
/*
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
    }*/
