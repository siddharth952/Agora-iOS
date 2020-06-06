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
    let baseURL:String = "https://agora-rest-api.herokuapp.com/"
    var apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxLTVQb1ViS25PUlM3dGZCWVhibFMzSExydUpJcEhmRFVOZmdaT2NFTEpIMEVwOFMzaEJKNVI2N1lyYUhGYWRZZG9zam1Cak1wZTRSMWNReHA0RGd4RmlzSmpkbDQ9IiwiaXNzIjoicGxheS1zaWxob3VldHRlIiwiZXhwIjoxNTkxNDY5MTQxLCJpYXQiOjE1OTE0MjU5NDEsImp0aSI6Ijk2OTc3OWYwZGY1MDgyZGI1MDQxZDEwYjBhZDgzNzhhZTMzY2QwOTVjZWEzNzZmY2YwZWJjMjNlZTg1NDdjMjg5YzI0ZDJmY2E5Yzk5MDdjODQwNjAwODQyODk1YmQwYTY1MzkzNDNmMzUyYzhlNzY3OTc4OTNjNjJiOWUzNTM4ZDY4Nzc4ODJkZDgwMmYxMWQ1MzBkZjQ3MmM0ZDAzMDViMWMyODRjNmJkZWZkYzdkMWQ2ZGI5MTI4YzBlZGU2NjFkOGE3ZDAwYTBmZDc4ZWRmNTk0NWYyYzg1MjE5YjIzMGRiNjE1NzE3OTZkNGZlOWRlYjg2MzdlNmZjZjQ3MDYifQ.D_cPsrEMefc4yizjg0m-ymBeZjQ4HMOSsHSQwg8tdmQ"
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    public enum APIError:Error{
        case noResponse
        case jsonDecodingError(error:Error)
        case networkError(error:Error)
    }
    
    public enum EndPoint{
        // Authentication
        case authenticate
        case login
        case forgotPasswordSend
        case forgotPasswordReset
        case signup
        // Election
        case electionBallots
        case electionAddVoter
        case electionVoters
        case electionGetAll
        case electionCreate
        case electionGetWithID
        case electionEditWithID
        case electionDeleteWithID
        case electionPollVoterLink
        // Result
        case resultGetWithID
        // Two Factor
        case securityQuestionGet
        case verifyOTP
        case resendOTP
        case toggleTwoFactor
        case verifySecurityQuestion
        // Verification
        case resendActivationLink
        case activateAccount
        // Vote
        case castVote
        case verifyPrivateElectionVotersLink
        case verifyPublicElectionVotersLink
        // User
        case userGet
        case userChangePassword
        case userChangeAvatar
        case userLogout
        case userUpdate
        
    }
    
    
    init() {
       header = [
            //AUTH Key
            "X-Auth-Token": "\(apiKey)"]
    }
    
    init(userXAUTH:String) {
       header = [
            //AUTH Key
            "X-Auth-Token": "\(userXAUTH)"]
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
    
    func fetchElectionData(ID:String){
        
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
