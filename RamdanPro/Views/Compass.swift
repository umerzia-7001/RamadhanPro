//
//  Compass.swift
//  RamdanPro
//
//  Created by Apple on 10/04/2021.
//

import SwiftUI

struct Compass: View {
    @ObservedObject var compassHeading = CompassHeading()
    @ObservedObject var qLocation = qiblaFinder()

    let screenSize = UIScreen.main.bounds
    var body: some View {

        ZStack {
            Color.init(UIColor(Color("background2")))
                .ignoresSafeArea(edges: .all)
           
            VStack {
                
                ZStack {
                    ForEach(Marker.markers(), id: \.self) { marker in
                        CompassMarkerView(marker: marker,
                                          compassDegress: self.compassHeading.degrees, loc: kaabaLoc(degrees: 0))
                    }
            
                }
                .frame(width: screenSize.width,
                       height: screenSize.height)
                .rotationEffect(Angle(degrees: self.compassHeading.degrees))
                .statusBar(hidden: true)
                .foregroundColor(.white)
               
            }.navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
            
        }
       

    }
}

struct Compass_Previews: PreviewProvider {
    static var previews: some View {
        Compass()
    }
}
