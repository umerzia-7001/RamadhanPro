//
//  prayerTimes.swift
//  RamdanPro
//
//  Created by Apple on 09/04/2021.
//

import SwiftUI

struct prayerTimes: View {
    
    @State var index: Int
    
    
    var body: some View {
        
        ScrollView {
            
            ForEach(1..<10) { index in
                
                
                ExtractedView(index: $index)
                        }
                       .frame(maxWidth: .infinity)
            
               }.font(.largeTitle)
    }
}

struct prayerTimes_Previews: PreviewProvider {
    static var previews: some View {
        prayerTimes(index: 10)
    }
}

struct ExtractedView: View {
    
    @Binding var index: Int
    
    var body: some View {
        
        Text("\(index)")
    }
}
