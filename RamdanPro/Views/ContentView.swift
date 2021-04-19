//
//  ContentView.swift
//  RamdanPro
//
//  Created by Apple on 09/04/2021.
//

import SwiftUI


struct ContentView: View {
        
    let screenSize = UIScreen.main.bounds
    @State private var isPressed: Bool = false
        var body: some View {
            NavigationView{
                
                ZStack{
                    
                    RadialGradient(gradient: Gradient(colors: [Color("background8"), Color("background6")]), center: .center, startRadius: 2, endRadius: 650)

                    
                    VStack(){
                        Spacer()
                        
                        Text("Ramdan Pro")
                            .bold()
                            .tracking(3.2)
                            .padding().padding(20)
                            .font(.largeTitle)
                                .frame(width: 400,height: 100)
                            .foregroundColor(Color("background"))
                   
                            .font(.system(size: 200))
                           

                        Image(uiImage: UIImage(named: "mosque")!)
                            .resizable().frame(width: screenSize.width-50, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped().cornerRadius(200)
                            .padding(20)

                        
                        Spacer()
                        
                        NavigationLink(destination: mainPage(dates: "", month: "", currentDay: "")) {
                            Text("welcome")
                                .fontWeight(.medium)
                                .font(.headline)
                                .padding()
                                .background(Color("background3"))
                                .cornerRadius(40)
                                .frame(width: 300, height: 50, alignment: .center)
                                .foregroundColor(.white)
                                .padding(.horizontal,10)
                                .shadow(color: self.isPressed ? Color.white : Color.gray, radius: self.isPressed ? 4 : 8, x: 8, y: 8)
                                .shadow(color: self.isPressed ? Color.gray : Color.white, radius: self.isPressed ? 4 : 8, x: -8, y: -8)
                                .scaleEffect(self.isPressed ? 0.95 : 1.0)
                                .animation(.spring())
                               

                        
                        }
                            
                        Spacer()
                    }
                   
                        
                }.frame(width: screenSize.width, height: screenSize.height)
            
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])
                .navigationBarTitle("")
                
            }
            
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
