//
//  APIService.swift
//  agora-ios
//
//  Created by Siddharth sen on 3/29/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

 
import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

public struct APIService{
    var header:HTTPHeaders
    let baseURL = URL(string:"https://agora-rest-api.herokuapp.com")
    var apiKey:String?
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
 
    
    init(userXAUTH:String) {
        header = [
            //AUTH Key
            "X-Auth-Token": "\(userXAUTH)"]
    }
    
    public enum APIError:Error{
        case noResponse
        case jsonDecodingError(error:Error)
        case networkError(error:Error)
    }
    
    public enum EndPoint{
        // Authentication
        case authenticate(provider:String)
        case login
        case forgotPasswordSend(userName:String)
        case forgotPasswordReset(token:String)
        case signup
        // Election
        case electionBallots(id:String)
        case electionAddVoter(id:String)
        case electionVoters(id:String)
        case electionAddListOfVoters(id:String)
        case electionGetAll
        case electionCreate
        case electionGetDataWithID(id:String)
        case electionEditWithID(id:String)
        case electionDeleteWithID(id:String)
        case electionPollVoterLink(id:String)
        // Result
        case resultGetWithID(id:String)
        // Two Factor
        case securityQuestionGet(crypto:String)
        case verifyOTP
        case resendOTP(userName:String)
        case toggleTwoFactor
        case verifySecurityQuestion
        // Verification
        case resendActivationLink(userName:String)
        case activateAccount(token:String)
        // Vote
        case castVote(id:String)
        case verifyPrivateElectionVotersLink(id:String,pass:String)
        case verifyPublicElectionVotersLink(id:String)
        // User
        case userUpdate
        case userGet
        case userChangePassword
        case userChangeAvatar
        case userLogout

        
        
        func path() -> String {
            switch self {
            case .login:
               return "/api/v1/auth/login"
            case let .authenticate(provider):
                return "/api/v1/auth/authenticate/\(provider))"
            case .forgotPasswordSend(userName: let userName):
                return "/api/v1/auth/forgotPassword/send/\(userName)"
            case .forgotPasswordReset(token: let token):
                return "/api/v1/auth/forgotPassword/reset/\(token)"
            case .signup:
                return "/api/v1/auth/signup"
            case .electionBallots(id: let id):
                return "/api/v1/election/\(id)/ballots"
            case .electionAddVoter(id: let id):
                return "/api/v1/election/\(id)/voter"
            case .electionVoters(id: let id):
                return "/api/v1/election/\(id)/voters"
            case .electionAddListOfVoters(id: let id):
                return "/api/v1/election/\(id)/voters"
            case .electionGetAll:
                return "/api/v1/election"
            case .electionCreate:
                return "/api/v1/election"
            case .electionGetDataWithID(id: let id):
                return "/api/v1/election/\(id)"
            case .electionEditWithID(id: let id):
                return "/api/v1/election/\(id)"
            case .electionDeleteWithID(id: let id):
                return "/api/v1/election/\(id)"
            case .electionPollVoterLink(id: let id):
                return "/api/v1/election/\(id)/pollVoterLink"
            case .resultGetWithID(id: let id):
                return "/api/v1/result/\(id)"
            case .securityQuestionGet(crypto: let crypto):
                return "/api/v1/securityQuestion/\(crypto)"
            case .verifyOTP:
                return "/api/v1/verifyOtp"
            case .resendOTP(userName: let userName):
                return "/api/v1/resendOtp/\(userName)"
            case .toggleTwoFactor:
                return "/api/v1/toggleTwoFactorAuth"
            case .verifySecurityQuestion:
                return "/api/v1/verifySecurityQuestion"
            case .resendActivationLink(userName: let userName):
                return "/api/v1/account/email/\(userName)"
            case .activateAccount(token: let token):
                return "/api/v1/account/activate/\(token)"
            case .castVote(id: let id):
                return "/api/v1/vote/\(id)"
            case .verifyPrivateElectionVotersLink(id:let id,pass: let pass):
                return "/api/v1/voter/verify/\(id)/\(pass)"
            case .verifyPublicElectionVotersLink(id: let id):
                return "/api/v1/voter/verifyPoll/\(id)"
            case .userUpdate:
                return "/api/v1/user/update"
            case .userGet:
                return "/api/v1/user"
            case .userChangePassword:
                return "api/v1/user/changePassword"
            case .userChangeAvatar:
                return "/api/v1/user/changeAvatar"
            case .userLogout:
                return "/api/v1/user/logout"
            
            }
        }

    }
    
    
    
    public func getElection(endpoint: EndPoint,ID:String) -> Void{
        let queryURL = baseURL!.appendingPathComponent(endpoint.path())
        AF.request(queryURL,
        method: .get,
        headers: header).responseData { response in
            guard let data = response.data else { return }
            let json = try? JSON(data:data)
                
            //print(json!["elections"][0])
            for i in json!["elections"]{
                print("Got data for Election: \(i.1["_id"])")
                
                // Put in db
                let config = Realm.Configuration(schemaVersion : 2)
                do{
                    let realm = try Realm(configuration: config)
                    let newData = DatabaseElection()
                    newData.title = i.1["name"].stringValue
                    
                    newData.place = i.1["description"].stringValue
                    newData.eleColor = "Blue"
                    newData.candidates = i.1["candidates"].stringValue
                    
                    try realm.write({
                        realm.add(newData)
                        print("Election details added successfully")
                    })
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
                
                
                
                
            }
            
            
        }
        
    }
    //MARK:- Authentication
    
    func userLogin(){
        
    }
    
    func userSignup(){
        
    }
    
    func userResetSend(){
        
    }
    func userResetValidate(){
        
    }
    
    
    //MARK:- Election
    func storeElection(){
        
    }
    
    func printDatabase(){
        
    }
    
    func getAllElectionsOfUser() -> Void {
        // Fetch all elections of the user and refresh db
    }
    
    func fetchElectionData(ID:String) -> Void{
        // Fetch election with ID and store it in db
        
        AF.request("\(baseURL))api/v1/election/\(ID)",
            method: .get,
            headers: header).responseJSON { response in
                if (response.error == nil){
                    print("Got data for Election\(ID)")
                    if let electionDataResponse = response.value{
                        let electionJSON: JSON = JSON(electionDataResponse)
                        
                        let config = Realm.Configuration(schemaVersion : 2)
                        do{
                            let realm = try Realm(configuration: config)
                            let newdata = DatabaseElection()
                            newdata.title = electionJSON["name"].stringValue
                            newdata.place = electionJSON["description"].stringValue
//                            newdata.isAllDay = electionJSON["electionType"].stringValue
//
//                            newdata.start = toDate(electionJSON["start"].stringValue)
//                            newdata.end = toDate(electionJSON["end"].stringValue)
//                            newdata.timeZone = extractTimeZone(electionJSON["createdTime"].stringValue)
//                            newdata.votingAlgo = electionJSON["votingAlgo"].stringValue

                            newdata.eleColor = "Blue"
                            newdata.electionDescription = electionJSON["description"].stringValue
                            newdata.candidates = electionJSON["candidates"].stringValue
                            try realm.write({
                                realm.add(newdata)
                                print("Election details added successfully")
                            })
                            
                            
                        }catch{
                            print(error.localizedDescription)
                        }
                    }
                }else{
                    print(response.error ?? "network error")
                }
        }
    }
}
