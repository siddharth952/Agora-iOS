//
//  ElectionResultView.swift
//  agora-ios
//
//  Created by Siddharth sen on 7/21/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

struct ElectionDetailsView: View {
    @ObservedObject var calendarManager:CalendarManager
    
    
    var body: some View {
        
        return ZStack{
            Color.white
            VStack() {
            ZStack {
                HStack(spacing:10) {
                    
                    Button(action: { self.calendarManager.eventUpdateOverlayShow.toggle() }
                    ){
                        Image(systemName: "multiply.circle.fill").font(.title)
                    }.foregroundColor(.white)
                    Spacer()
                }.background(LinearGradient(gradient: Gradient(colors: [Color("Color2_2"), Color("Color2")]), startPoint: .bottom, endPoint: .top).frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 6 , alignment: .center).edgesIgnoringSafeArea(.top))
                Text(calendarManager.election[0].name)
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .font(.title)
            }.padding()
            
            HStack {
                Spacer()
                Button(action: {}){
                    Text("Show Election Results").frame(width: UIScreen.main.bounds.width / 1.4 ,height: 50).foregroundColor(.white)
                    
                }.customButton(width: UIScreen.main.bounds.width / 1.4)
                
                Spacer()
            }.padding(.top,20).padding(.bottom,5)
            
            HStack {
                Spacer()
                Button(action: {print(self.calendarManager.election[0])}){
                    Text("Remind Me").frame(width: UIScreen.main.bounds.width / 1.4 ,height: 50).foregroundColor(.white)
                    
                }.customButton(width: UIScreen.main.bounds.width / 1.4)
                
                Spacer()
            }
            
            Divider()
            
            ScrollView() {
                
                    Text("Election Name: " + calendarManager.election[0].name)
                    .fontWeight(.medium)
                        .font(.footnote)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    Text("Election description: " + calendarManager.election[0].description)
                    .fontWeight(.medium)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    Text("Algorithm: " + calendarManager.election[0].votingAlgo)
                    .fontWeight(.medium)
                    .font(.footnote)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    Text("Start : " + calendarManager.election[0].startingDate + "\nEnd : "+calendarManager.election[0].endingDate)
                    .fontWeight(.medium)
                    .font(.footnote)
                    .padding(.top,10)
                    .padding(.bottom,10)
                Text("Election Type: " + "\(calendarManager.election[0].electionType)")
                    .fontWeight(.medium)
                    .font(.footnote)
                    .padding(.top,10)
                    .padding(.bottom,10)
                List(calendarManager.election[0].candidates,id: \.self){ candidate in
                    Text(candidate)
                    }.frame(width: UIScreen.main.bounds.width * 0.9, height: 400, alignment: .center).cornerRadius(10)
                   
            }.padding(.top, 10)
            .padding(.leading,10)
            .frame(width:UIScreen.main.bounds.width - 20)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .animation(.spring())
            
            Spacer()
            
            }}
    }
}

struct ElectionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ElectionDetailsView(calendarManager: CalendarManager())
    }
}
