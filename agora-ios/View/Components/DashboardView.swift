//
//  DashboardView.swift
//  agora-ios
//
//  Created by Siddharth sen on 3/19/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import RealmSwift

struct DashboardView: View {
    
    @State var activeLink:Int = 0
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        
        
        return NavigationView {
            VStack {
                Top_Dashboard(tabBar: $tabBar)
                Spacer(minLength: 10)
                Mid_Dashboard()
            }.edgesIgnoringSafeArea(.top)
        }.background(TabBarAccessor { tabbar in
    
            DispatchQueue.main.async {
                self.tabBar = tabbar
            }

            }).currentDeviceNavigationViewStyle()
        
    }
}

// MARK: Top:-
struct Top_Dashboard: View {
    
    @ObservedObject var userResults = BindableResults(results: try! Realm(configuration: Realm.Configuration(schemaVersion : 4)).objects(DatabaseUser.self))
    @State var showCreateElection:Bool = false
    @Binding var tabBar:UITabBar!
    
    var body : some View{
        
        VStack(spacing:0){
            HStack(){
                Text("     Hello,\n" + self.userResults.results[0].username).fontWeight(.medium)
                    .opacity(0.8)
                    .font(.largeTitle)
                    .padding(.top,10)
                    .padding(.bottom,30)
                    .offset(x:UIScreen.main.bounds.width / 3 )
                
                Spacer()
                
                NavigationLink(destination: CreateElection(showCreateElectionView: self.$showCreateElection)
                    .onAppear { self.tabBar.isHidden = true }
                    .onDisappear { self.tabBar.isHidden = false}
                ,isActive: $showCreateElection) {
                    Button(action: {self.showCreateElection.toggle()}, label: { Image(systemName: "plus").resizable().frame(width: 32, height: 32,alignment: .topTrailing).foregroundColor(.white).offset(x:-20,y:-20)})
                    }.navigationBarTitle("").navigationBarHidden(true).navigationBarBackButtonHidden(true)
                
            }.padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing).clipShape(RoundedRectangle(cornerRadius: 30, style: .circular)).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5)
                    Image("Mountains").resizable().offset(y:-15)
                }.edgesIgnoringSafeArea(.top))
        }
        
    }
}



// MARK: Mid:-
struct Mid_Dashboard: View{
    @State var inputSearch:String = ""
    @EnvironmentObject var electionCountManager:ElectionCountManager
    @State var showShimmer:Bool = true
    
    //Realm
    let config = Realm.Configuration(schemaVersion : 4)
    @ObservedObject var electionsResults = BindableResults(results: try! Realm(configuration: Realm.Configuration(schemaVersion : 4)).objects(DatabaseElection.self))
   
    
    var body: some View {
        VStack(spacing:0) {
            SearchBar(text:$inputSearch).frame(width:UIScreen.main.bounds.width - 60).padding(.top,20)
            Rectangle().frame(width: 350, height: 5, alignment: .center).foregroundColor(Color(.gray)).opacity(0.7)
            ScrollView.init(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    if showShimmer{
                        ForEach(0 ..< 4) { number in
                            CardShimmer(height: UIScreen.main.bounds.height / 6 - 10)
                        }
                    }else{
                        StaticCard(headerText: "Total Elections", numberElections:electionCountManager.electionCountModel.electionTotalCountValue , cardColor: "_Purple").transition(.move(edge: .leading))
                        StaticCard(headerText: "Active Elections", numberElections: electionCountManager.electionCountModel.electionActiveCountValue,cardColor: "Blue").transition(.move(edge: .trailing))
                        StaticCard(headerText: "Finished Elections", numberElections: electionCountManager.electionCountModel.electionFinishedCountValue,cardColor: "Pink").transition(.move(edge: .leading))
                        StaticCard(headerText: "Pending Elections", numberElections:electionCountManager.electionCountModel.electionPendingCountValue,cardColor: "Red").transition(.move(edge: .trailing))
                    }
                }
                

            }
            
        }.onAppear(){
            self.electionCountManager.loadElectionData(){
                
                // Default Shimmer time
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(900)) {
                    self.showShimmer = false
                }
            }
        }
        
    }

}


class ElectionCountManager: ObservableObject {
    
    //Realm
    let config = Realm.Configuration(schemaVersion : 4)
    @ObservedObject var electionsResults = BindableResults(results: try! Realm(configuration: Realm.Configuration(schemaVersion : 4)).objects(DatabaseElection.self))
    
    // If change update views
    @Published var electionCountModel = ElectionCountModel()
    

    // request updated value from the server
    public func loadElectionData(completion:()->Void){
        
        
         //  Update UI with User Data
          do{
              let realm = try Realm(configuration: self.config)
              let  result = realm.objects(DatabaseUser.self)
              
              // Update Credentials
              Credentials.username = result[0].username
              Credentials.email = result[0].email
              Credentials.firstName = result[0].firstName
              Credentials.lastName = result[0].lastName
              Credentials.avatarURL = result[0].avatarURL
              Credentials.twoFactorAuthentication = result[0].twoFactorAuthentication
              Credentials.token = result[0].token
              Credentials.trustedDevice = result[0].trustedDevice
              
              print("Credentials Updated")
              
              
          }catch{
              print(error.localizedDescription)
          }
          
          
          DatabaseElectionManager.getAllElections {
              do{
                  let realm = try Realm(configuration: self.config)
                  let  results = realm.objects(DatabaseElection.self)
                
                electionCountModel.electionSetCountToZero()
                  // Update Total Elections StaticCard
                  electionCountModel.electionTotalCountValue = results.count
                  
                  
                  let nowDate = Date()
                  for result in results{
                      //Update Pending Elections StaticCard
                      if nowDate < result.start{
                          electionCountModel.electionPendingCountValue += 1
                      }
                      // Update Finished Elections StaticCard
                      if nowDate > result.end{
                          electionCountModel.electionFinishedCountValue += 1
                      }
                      else{
                          //Update Active Elections StaticCard
                          electionCountModel.electionActiveCountValue += 1
                      }
                  }

                  print("REALM: Total Records \(electionCountModel.electionTotalCountValue)")
                  
                  
                  print(results)

                 completion()
                  
                  
              }catch{
                  print(error.localizedDescription)
              }
          }

        
    }
    

}

struct ElectionCountModel {
    var electionTotalCountValue = 0
    var electionActiveCountValue = 0
    var electionPendingCountValue = 0
    var electionFinishedCountValue = 0
    
    public mutating func electionSetCountToZero(){
        electionTotalCountValue = 0
        electionActiveCountValue = 0
        electionPendingCountValue = 0
        electionFinishedCountValue = 0
    }
}

struct StaticCard: View {
    @State var headerText:String = "Total Elections"
    @State var numberElections:Int
    @State var cardColor:String = "Blue"
    var body:some View{
        HStack {
            HStack{
                Text(headerText)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top,10)
                    .padding(.bottom,10)
                Spacer()
                
                Text("\(numberElections)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    .opacity(0.8)
                
                
            }.padding()
                .padding(.top, 15)
                .frame(width:UIScreen.main.bounds.width - 20,height:120)
                .background(Color(cardColor))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 6, x: 0, y: 2)
                .animation(.spring())
            
            
        }.padding(.top,20)
    }
}

// Set navigationViewStyle based on device
extension View {
    public func currentDeviceNavigationViewStyle() -> AnyView {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            DashboardView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
