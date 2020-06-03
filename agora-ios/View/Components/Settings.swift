//
//  Settings.swift
//  agora-ios
//
//  Created by Siddharth sen on 3/22/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            SettingsTop()
            Text("Settings").font(.title).fontWeight(.bold).padding(.leading,20)
            Divider()
            Spacer()
            
            ZStack {
                Color.black.opacity(0.03).cornerRadius(10)
                VStack(alignment:.leading,spacing: 20){
                    Text("Manage Data").fontWeight(.bold)
                    Divider()
                    Text("Manage Account").fontWeight(.bold)
                    Divider()
                    Text("Rate Us").fontWeight(.bold)
                    Divider()
                    Text("Contact Us").fontWeight(.bold)
                }.padding()
            }
            
            Button(action: {
                       // self.showingAlert = true;

                     UserDefaults.standard.set(false, forKey: "status")
                     NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                       }) {
                           Text("Logout").padding(.leading,20)
                           }
        }
    }
}

struct SettingsTop:View{
    @State var name = ""
    @State var email = ""
    var body : some View{
        
        VStack(spacing:0){
            ZStack(){
                    Image("Mountains")
                HStack(){
                    Circle().frame(width:64,height:64).shadow(radius: 1)
                    Spacer()
                }.padding()
            }.padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        }.edgesIgnoringSafeArea(.top)
    }
}



struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
