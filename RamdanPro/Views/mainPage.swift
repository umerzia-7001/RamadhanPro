//
//  mainPage.swift
//  RamdanPro
//
//  Created by Apple on 09/04/2021.
//

import SwiftUI

struct mainPage: View {
    
    let screenSize = UIScreen.main.bounds
    @State var dates : String
    @State var month : String
    @State var timetext = Date()
    
    @State var currentDay : String
    func getIslamicDate(){
        
        let dateFor = DateFormatter()

         let hijriCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
         dateFor.locale = Locale.init(identifier: "en")
         dateFor.calendar = hijriCalendar
    
         dateFor.dateFormat = "dd"
        
         //dateFor.dateFormat = "LLLL"
         let islamic_date = dateFor.string(from: Date())

         self.dates = islamic_date
        }
    func getMonth(){
        
        let dateFor = DateFormatter()
         let hijriCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
         dateFor.locale = Locale.init(identifier: "en")
         dateFor.calendar = hijriCalendar
    
         dateFor.dateFormat = "dd//mm/yyyy"
         dateFor.dateFormat = "LLLL"
         let nameOfMonth = dateFor.string(from: Date())
        
        self.month = nameOfMonth
    
        }
    func getDate(){
        
        let dateFor = DateFormatter()
        let hijriCalendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
         dateFor.locale = Locale.init(identifier: "en")
         dateFor.calendar = hijriCalendar
    
         dateFor.dateFormat = "EEEE, MMMM dd"
         let nameOfMonth = dateFor.string(from: Date())
        
        self.currentDay = nameOfMonth
    
        }
   
    var body: some View {
        
        
       NavigationView {
            
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color("background6"), Color("background7")]), startPoint: .top, endPoint: .bottom)
                
                VStack(alignment:.center){
                    
                    Spacer(minLength: 20)
                    Text(timetext, style: .time)
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .hoverEffect(.lift)
                        .frame(width: 300, height: 40, alignment: .center)
                        .padding(5)
                    
                
                    Text("\(currentDay)")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(3)
                        .onAppear {
                            self.getDate()
                    }
                    HStack(spacing:10) {
                        Text("\(dates)")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .onAppear {
                            self.getIslamicDate()
                            }
                        Text("\(month)")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)

                            .onAppear {
                            self.getMonth()
                        }
                        
                    }
                    
                    Spacer(minLength: 20)
                    
                    HStack(spacing:20){
                        
                        labelView()
                            .shadow(color: Color("background8"), radius: 15, x: 0, y: 0)
                        
                    }.padding(.all,10)
                    
                    .frame(width: screenSize.width, height: screenSize.height/2, alignment: .center)
 
                   Spacer()
                    
            
                
            }
                
                .frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
                
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
       }
}
}
struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            mainPage(dates: "" ,  month:"", currentDay: "")
            
        }
    }

}
