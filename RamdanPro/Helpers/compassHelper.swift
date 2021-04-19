//
//  compassHelper.swift
//  RamdanPro
//
//  Created by Apple on 10/04/2021.
//

import Foundation
import SwiftUI

struct Marker: Hashable {
    let degrees: Double
    let label: String

    init(degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }

    func degreeText() -> String {
        return String(format: "%.0f", self.degrees)
    }

    static func markers() -> [Marker] {
        return [
            Marker(degrees: 0, label: "N"),
            Marker(degrees: 30),
            Marker(degrees: 60),
            Marker(degrees: 90, label: "E"),
            Marker(degrees: 120),
            Marker(degrees: 150),
            Marker(degrees: 180, label: "S"),
            Marker(degrees: 210),
            Marker(degrees: 240),
            Marker(degrees: 270, label: "W"),
            Marker(degrees: 300),
            Marker(degrees: 330)
        ]
    }
}
struct kaabaLoc: Hashable {
    let degrees: Double
    let label: String

    init(degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }

    func showImage()->UIImage{
        
        let img = UIImage(named: "Kaaba")
        return img!
    }
    func degreeText() -> String {
        return String(format: "%.0f", self.degrees)
    }

    static func markers() -> [kaabaLoc] {
        return [
            kaabaLoc(degrees: 0, label: "Kaaba"),
            
        ]
    }
}

struct CompassMarkerView: View {
    
    let marker: Marker
    let compassDegress: Double
    let loc : kaabaLoc

    let screenSize = UIScreen.main.bounds
    var body: some View {
        
        ZStack{
            
            VStack {
                
                Text(self.marker.degrees == 0 ? "Qibla" : "")
                    .fontWeight(.thin)
                    .rotationEffect(self.textAngle())
                Image(uiImage: loc.showImage())
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .rotationEffect(Angle(degrees:0))
        
                Capsule()
                    .frame(width: self.capsuleWidth(),
                           height: self.capsuleHeight())
                    .foregroundColor(self.capsuleColor())
               
                
                Text(marker.label)
                    .fontWeight(.bold)
                    .rotationEffect(self.textAngle())
                    .padding(.bottom, 180)

            }.rotationEffect(Angle(degrees: marker.degrees))
            .frame(width: screenSize.width, height: screenSize.height)


        }
        
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.degrees == 0 ? 7 : 3
    }

    private func capsuleHeight() -> CGFloat {
        return self.marker.degrees == 0 ? 45 : 30
    }

    private func capsuleColor() -> Color {
        return self.marker.degrees == 0 ? .red : .gray
    }

    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.degrees)
    }
}
struct CompassMarkerViewPreviews: PreviewProvider {
    static var previews: some View {
        CompassMarkerView(marker: Marker(degrees: 0.0), compassDegress: 0.0, loc: kaabaLoc(degrees: 0))
    }
}
