//
//  DatabaseElectionManager.swift
//  agora-ios
//
//  Created by Siddharth sen on 6/11/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift


class DatabaseElectionManager:ObservableObject{
    
    static var apiService = APIService(userXAUTH: Credentials.token)
    
    
   // MARK: API
    static func getAllElections(complete: () -> Void) -> Void {
        DatabaseElectionManager.apiService.getElection(endpoint: .electionGetAll, ID: ""){}
        complete()
    }
    
    //MARK: Database
    static func deleteAllElectionsfromdb(complete: ()->Void){
        //Delete all elections
        let config = Realm.Configuration(schemaVersion : 4)
        do{
            let realm = try Realm(configuration: config)
            let result = realm.objects(DatabaseElection.self)
            
            for i in result{
                
                try! realm.write {
                    realm.delete(i)
                }
            }
        }catch{
            print(error.localizedDescription)
        }
        complete()
    }
}
