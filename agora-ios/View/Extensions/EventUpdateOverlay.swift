//
//  EventUpdateOverlay.swift
//  agora-ios
//
//  Created by Siddharth sen on 7/15/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

struct EventUpdateOverlay: View {
    let fade =  Gradient(colors: [Color.clear, Color.black])
    
    var body: some View {
        return ZStack{
            Color.black.opacity(0.08).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack {
                    Badge().frame(width: UIScreen.main.bounds.width / 8, height:UIScreen.main.bounds.height / 21, alignment: .leading).overlay(Image(systemName: "checkmark").resizable().foregroundColor(.white).padding(14))
                    Text("New Event added to your elections\nsuccessfully.").foregroundColor(Color("Color2")).fontWeight(.semibold)
                    Spacer()
                }.padding(30).background(Color.white)
                }
        }
    }
}

struct EventUpdateOverlay_Previews: PreviewProvider {
    static var previews: some View {
        EventUpdateOverlay()
    }
}
