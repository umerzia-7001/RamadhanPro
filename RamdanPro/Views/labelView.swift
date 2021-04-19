//
//  labelView.swift
//  RamdanPro
//
//  Created by Apple on 09/04/2021.
//

import SwiftUI

struct labelView: View {
    
    let size = UIScreen.main.bounds
        
    var title = "Prayer timings"
    var color = Color("background8")
    var shadowColor = Color("backgroundShadow3")

    
    var body: some View {
        
        
        ZStack {
            
            
            VStack(alignment: .center) {
              
            HStack(spacing:10){
                prayerLabel()
                qiblaLabel()
            }
            HStack(spacing:10){
                QuranLabel()
                calendarLabel()
            }
            
            
           }
           .background(color)
           .cornerRadius(30)
           .frame(width: size.width, height: size.height/2, alignment: .center)
            .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
        }
    }
}

struct labelView_Previews: PreviewProvider {
    static var previews: some View {
        labelView()
    }
}


struct prayerLabel: View {
    
    let size = UIScreen.main.bounds
        
    var title = "Prayer timings"
    var color = Color("background8")
    var shadowColor = Color("backgroundShadow3")

    
    var body: some View {
        
       return VStack(alignment: .center) {
          
        Image("mosque-100")
           .resizable()
           .renderingMode(.original)
           .aspectRatio(contentMode: .fit)
           .frame(width: 100, height: 100)
           .padding(.all, 10)
          .clipped()

          Spacer()
          
        NavigationLink(
            destination: adhanView(sunrize: "", fajr: "", dhuhr: "", asr: "", maghrib: "", isha: ""),
            label: {
                Text(title)
                   .font(.title)
                   .fontWeight(.light)
                   .foregroundColor(.white)
                   .padding(10)
                   .lineLimit(2)
                    .scaledToFill()
                
            })
        
            
       }
       
    }
}

struct qiblaLabel: View {
    
    let size = UIScreen.main.bounds
        
    var title = "Qibla"
    var color = Color("background8")
    var shadowColor = Color("backgroundShadow3")

    
    var body: some View {
        
       return VStack(alignment: .center) {
          
        Image("Kaaba")
           .resizable()
           .renderingMode(.original)
           .aspectRatio(contentMode: .fit)
           .frame(width: 90, height: 90)
            .padding(.bottom,0)
            .padding(.horizontal,10)
            .padding(.vertical,15)
          .clipped()

          Spacer()
        NavigationLink(
            destination: Compass(),
            label: {
                Text(title)
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .font(.title)
                   .padding(20)
                   .lineLimit(2)
            })
            
        
        
       }
       
    }
}

struct QuranLabel: View {
    
    let size = UIScreen.main.bounds
        
    var title = "Quran"
    var color = Color("background8")
    var shadowColor = Color("backgroundShadow3")

    
    var body: some View {
        
       return VStack(alignment: .center) {
          
        Image("ramadan-100")
           .resizable()
           .renderingMode(.original)
           .aspectRatio(contentMode: .fit)
           .frame(width: 100, height: 100)
           .padding(.all, 20)
          .clipped()

          Spacer()
          
        Text(title)
            .font(.title)
            .fontWeight(.light)
            .foregroundColor(.white)
            .font(.title)
           .padding(20)
           .lineLimit(2)
       }
       
    }
}

struct calendarLabel: View {
    
    let size = UIScreen.main.bounds
        
    var title = "Calendar"
    var color = Color("background8")
    var shadowColor = Color("backgroundShadow3")

    
    var body: some View {
        
       return VStack(alignment: .center) {
          
        Image("calendar-1")
           
           .resizable()
            .renderingMode(.original)
           .aspectRatio(contentMode: .fit)
           .frame(width: 100, height: 100)
           .padding(.all, 20)
            .foregroundColor(.white)


          Spacer()
          NavigationLink(
            destination: calendarView(),
            label: {
                Text(title)
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .font(.title)
                   .padding(20)
                   .lineLimit(2)
            })
        
       }
      
    }
}
