//
//  LoginView.swift
//  agora-ios
//
//  Created by Siddharth sen on 3/22/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//
import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        
        
        return VStack{
            if status == true{
                
                Navigation()
            }
            else{
                
                NavigationView{
                    VStack(spacing:0) {
                        
                        VStack {
                            ZStack {
                                TopCircleShape()
                                
                                GeometryReader { geo in
                                    
                                    Image("boy_ship")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geo.size.width * 0.90, height: geo.size.height, alignment: .center)
                                }
                                
                            }
                        }
                        Spacer()
                        
                        FirstPage()
                    }.edgesIgnoringSafeArea(.top)
                }
            }
        }.onAppear{
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                
                self.status = status
            }
        }
        
        
        
    }
}


struct FirstPage: View{
    
    
    @State var showSecond :Bool = false
    @State var showAuth :Bool = false
    @State var msg = ""
    @State var alert :Bool = false
    var body: some View{
        
        
        VStack(spacing:20){
            
            Text("Don't just be there,\nbe present").font(.largeTitle).fontWeight(.medium)
            
            NavigationLink(destination: SignUpView(showSecond: self.$showSecond), isActive: $showSecond){
                Button(action: {
                    //                            self.ID = ID
                    self.showSecond.toggle()
                }
                    
                ){
                    Text("GET STARTED").foregroundColor(.black).frame(width: UIScreen.main.bounds.width * 0.70,height: 50)
                }.foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(20)
                
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            NavigationLink(destination: AuthenticateView(showAuth: self.$showAuth), isActive: $showAuth){
                Button(action: {
                    //                            self.ID = ID
                    self.showAuth.toggle()
                }
                    
                ){
                    Text("Login").foregroundColor(.black).frame(width: UIScreen.main.bounds.width * 0.70,height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.yellow, lineWidth: 4)
                    )
                }
                
            }
            
            
        }.padding(.bottom)
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
                
                
                
        }
        
    }
}



struct SignUpView: View{
    @Binding var showSecond:Bool
    var body: some View{
        ZStack(alignment:.topLeading){
            GeometryReader{_ in
                
                VStack(spacing:20){
                    
                    
                    Text("Sign up Here").font(.largeTitle).fontWeight(.heavy)
                    
                }
                
            }
            
            Button(action: {
                self.showSecond.toggle()
            }
            ){
                
                Image(systemName: "chevron.left").font(.title)
                
            }.foregroundColor(.orange)
            
        }
        .padding()
    }
}

struct AuthenticateView:View {
    
    @Binding var showAuth:Bool
    
    
    @State var email:String = ""
    @State var pass:String = ""
    @State var remember:Bool = false

    @State var alert:Bool = false
    @State var msg:String = ""
    
    var body: some View{
        
        ZStack(alignment:.topLeading){
            GeometryReader{geo in
                VStack(spacing:5){
                    
                    Image("login_tree").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.60, height: geo.size.height/3, alignment: .center)
                    
                    
                    
                //MARK: Login
                    VStack(alignment: .leading){
                        Text("Login")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Username")
                            .fontWeight(.bold)
                            .padding(.top,20)
                        VStack{
                            TextField("",text: self.$email)
                            Rectangle().fill(self.email == "" ? Color.black.opacity(0.08):Color.yellow)
                                .frame(height:3)
                        }
                        Text("Password")
                            .fontWeight(.bold)
                            .padding(.top,20)
                        VStack{
                            SecureField("",text: self.$pass)
                            Rectangle().fill(self.pass == "" ? Color.black.opacity(0.08):Color.yellow)
                            .frame(height:3)
                        }
                    }
                    Button(action: {
                        
                    }){
                    HStack(spacing:10){
                        ZStack{
                            Rectangle()
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), startPoint: .top, endPoint: .bottom))
                                .frame(width:20,height:20)
                            if self.remember{
                                Rectangle()
                                .fill(Color("Color2"))
                            }
                        }
                        Text("Remember me")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    }
                    }
                    
                    // AppleID
                    Button (action: {}) {
                        AppleIdButton().background(Color.primary).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)).padding(7).frame(width: geo.size.width * 0.80, height: geo.size.height * 0.10)
                    }
                    
                    
                    
                    
                    //button
                    Button(action: {
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }){
                        Text("Login").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                        
                    }.foregroundColor(.black)
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            }
            
            Button(action: {
                self.showAuth.toggle()
            }
            ){
                Image(systemName: "chevron.left").font(.title)
                
            }.foregroundColor(.orange)
            
        }
        .padding()
        .alert(isPresented: $alert) {
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
            
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            AuthenticateView(showAuth: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
        }
    }
}

