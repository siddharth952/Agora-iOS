//
//  Models.swift
//  agora-ios
//
//  Created by Siddharth sen on 6/6/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import Foundation

/*

// MARK: - Definitions
struct Definitions: Codable {
    let token: Token
    let ballot: Ballot
    let response: Response
    let voter: Voter
    let electionData: ElectionDataClass
    let candidate: Candidate
    let election: DatabaseElection
    let loginInfo: LoginInfoClass
    let score: Score
    let winner: Winner
    let user: User
    let crypto: Crypto
    let question: Question
    let ballotData: BallotData
    let credentialFormat: CredentialFormat
    let password: Password
    let url: URLClass
    let signUp: SignUp

    enum CodingKeys: String, CodingKey {
        case token = "Token"
        case ballot = "Ballot"
        case response = "Response"
        case voter = "Voter"
        case electionData = "ElectionData"
        case candidate = "Candidate"
        case election = "Election"
        case loginInfo = "LoginInfo"
        case score = "Score"
        case winner = "Winner"
        case user = "User"
        case crypto = "Crypto"
        case question = "Question"
        case ballotData = "BallotData"
        case credentialFormat = "CredentialFormat"
        case password = "Password"
        case url = "URL"
        case signUp = "SignUp"
    }
}

// MARK: - Ballot
struct Ballot: Codable {
    let type: String
    let ballotRequired: [String]
    let properties: BallotProperties

    enum CodingKeys: String, CodingKey {
        case type
        case ballotRequired = "required"
        case properties
    }
}

// MARK: - BallotProperties
struct BallotProperties: Codable {
    let voteBallot, hash: Hash
}

// MARK: - Hash
struct Hash: Codable {
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case boolean = "boolean"
    case number = "number"
    case string = "string"
}

// MARK: - BallotData
struct BallotData: Codable {
    let type: String
    let ballotDataRequired: [String]
    let properties: BallotDataProperties
    let ballotDataDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case ballotDataRequired = "required"
        case properties
        case ballotDataDescription = "description"
    }
}

// MARK: - BallotDataProperties
struct BallotDataProperties: Codable {
    let ballotInput, passCode: BallotInput
}

// MARK: - BallotInput
struct BallotInput: Codable {
    let type: TypeEnum
    let ballotInputDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case ballotInputDescription = "description"
    }
}

// MARK: - Candidate
struct Candidate: Codable {
    let type: String
    let candidateRequired: [String]
    let properties: CandidateProperties

    enum CodingKeys: String, CodingKey {
        case type
        case candidateRequired = "required"
        case properties
    }
}

// MARK: - CandidateProperties
struct CandidateProperties: Codable {
    let name, id, party: Hash
}

// MARK: - CredentialFormat
struct CredentialFormat: Codable {
    let type: String
    let credentialFormatRequired: [String]
    let properties: CredentialFormatProperties

    enum CodingKeys: String, CodingKey {
        case type
        case credentialFormatRequired = "required"
        case properties
    }
}

// MARK: - CredentialFormatProperties
struct CredentialFormatProperties: Codable {
    let identifier, password, trustedDevice: BallotInput
}

// MARK: - Crypto
struct Crypto: Codable {
    let type: String
    let cryptoRequired: [String]
    let properties: CryptoProperties
    let cryptoDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case cryptoRequired = "required"
        case properties
        case cryptoDescription = "description"
    }
}

// MARK: - CryptoProperties
struct CryptoProperties: Codable {
    let crypto, otp, trustedDevice: BallotInput
}

// MARK: - Election
struct Election: Codable {
    let type: String
    let electionRequired: [String]
    let properties: ElectionProperties
    let electionDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case electionRequired = "required"
        case properties
        case electionDescription = "description"
    }
}

// MARK: - ElectionProperties
struct ElectionProperties: Codable {
    let id, name, propertiesDescription, electionType: Hash
    let creatorName, creatorEmail: Hash
    let start, end: CreatedTime
    let realtimeResult, votingAlgo: Hash
    let candidates: PurpleCandidates
    let ballotVisibility, voterListVisibility, isInvite, isCompleted: Hash
    let isStarted: Hash
    let createdTime: CreatedTime
    let adminLink, inviteCode: Hash
    let ballot, voterList, winners: VoterListClass
    let isCounted: Hash
    let noVacancies: CreatedTime
    let loginInfo: LoginInfo
    let electionData: ElectionData

    enum CodingKeys: String, CodingKey {
        case id, name
        case propertiesDescription = "description"
        case electionType, creatorName, creatorEmail, start, end, realtimeResult, votingAlgo, candidates, ballotVisibility, voterListVisibility, isInvite, isCompleted, isStarted, createdTime, adminLink, inviteCode, ballot, voterList, winners, isCounted, noVacancies, loginInfo, electionData
    }
}

// MARK: - VoterListClass
struct VoterListClass: Codable {
    let type: String
    let items: ElectionData
}

// MARK: - ElectionData
struct ElectionData: Codable {
    let ref: String

    enum CodingKeys: String, CodingKey {
        case ref = "$ref"
    }
}

// MARK: - PurpleCandidates
struct PurpleCandidates: Codable {
    let type: String
    let items: Hash
}

// MARK: - CreatedTime
struct CreatedTime: Codable {
    let type, format: String
}

// MARK: - LoginInfo
struct LoginInfo: Codable {
    let readOnly: Bool
    let ref: String

    enum CodingKeys: String, CodingKey {
        case readOnly
        case ref = "$ref"
    }
}

// MARK: - ElectionDataClass
struct ElectionDataClass: Codable {
    let type: String
    let electionDataRequired: [String]
    let properties: ElectionDataProperties
    let electionDataDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case electionDataRequired = "required"
        case properties
        case electionDataDescription = "description"
    }
}

// MARK: - ElectionDataProperties
struct ElectionDataProperties: Codable {
    let name, propertiesDescription, electionType: BallotInput
    let candidates: FluffyCandidates
    let ballotVisibility, voterListVisibility: BallotInput
    let startingDate, endingDate: EndingDate
    let isInvite, isRealTime, votingAlgo: BallotInput
    let noVacancies: EndingDate
    let ballot: PurpleBallot

    enum CodingKeys: String, CodingKey {
        case name
        case propertiesDescription = "description"
        case electionType, candidates, ballotVisibility, voterListVisibility, startingDate, endingDate, isInvite, isRealTime, votingAlgo, noVacancies, ballot
    }
}

// MARK: - PurpleBallot
struct PurpleBallot: Codable {
    let type, ballotDescription: String
    let items: ElectionData

    enum CodingKeys: String, CodingKey {
        case type
        case ballotDescription = "description"
        case items
    }
}

// MARK: - FluffyCandidates
struct FluffyCandidates: Codable {
    let type, candidatesDescription: String
    let items: Hash

    enum CodingKeys: String, CodingKey {
        case type
        case candidatesDescription = "description"
        case items
    }
}

// MARK: - EndingDate
struct EndingDate: Codable {
    let type: String
    let format: String?
    let endingDateDescription: String
    let readOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case type, format
        case endingDateDescription = "description"
        case readOnly
    }
}

// MARK: - LoginInfoClass
struct LoginInfoClass: Codable {
    let type: String
    let loginInfoRequired: [String]
    let properties: LoginInfoProperties

    enum CodingKeys: String, CodingKey {
        case type
        case loginInfoRequired = "required"
        case properties
    }
}

// MARK: - LoginInfoProperties
struct LoginInfoProperties: Codable {
    let providerID, providerKey: Hash
}

// MARK: - Password
struct Password: Codable {
    let type: String
    let passwordRequired: [String]
    let properties: PasswordProperties
    let passwordDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case passwordRequired = "required"
        case properties
        case passwordDescription = "description"
    }
}

// MARK: - PasswordProperties
struct PasswordProperties: Codable {
    let password: BallotInput
}

// MARK: - Question
struct Question: Codable {
    let type: String
    let questionRequired: [String]
    let properties: QuestionProperties
    let questionDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case questionRequired = "required"
        case properties
        case questionDescription = "description"
    }
}

// MARK: - QuestionProperties
struct QuestionProperties: Codable {
    let question, answer: Answer
}

// MARK: - Answer
struct Answer: Codable {
    let type: TypeEnum
    let example, answerDescription: String

    enum CodingKeys: String, CodingKey {
        case type, example
        case answerDescription = "description"
    }
}

// MARK: - Response
struct Response: Codable {
    let type: String
    let responseRequired: [String]
    let properties: ResponseProperties
    let responseDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case responseRequired = "required"
        case properties
        case responseDescription = "description"
    }
}

// MARK: - ResponseProperties
struct ResponseProperties: Codable {
    let message: BallotInput
}

// MARK: - Score
struct Score: Codable {
    let type: String
    let scoreRequired: [String]
    let properties: ScoreProperties
    let scoreDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case scoreRequired = "required"
        case properties
        case scoreDescription = "description"
    }
}

// MARK: - ScoreProperties
struct ScoreProperties: Codable {
    let numerator, denominator: EndingDate
}

// MARK: - SignUp
struct SignUp: Codable {
    let type: String
    let signUpRequired: [String]
    let properties: SignUpProperties
    let signUpDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case signUpRequired = "required"
        case properties
        case signUpDescription = "description"
    }
}

// MARK: - SignUpProperties
struct SignUpProperties: Codable {
    let identifier: Answer
    let password: PasswordClass
    let email, firstName, lastName: Answer
    let securityQuestion: SecurityQuestion
}

// MARK: - PasswordClass
struct PasswordClass: Codable {
    let type: TypeEnum
    let example: String
}

// MARK: - SecurityQuestion
struct SecurityQuestion: Codable {
    let securityQuestionDescription, ref: String

    enum CodingKeys: String, CodingKey {
        case securityQuestionDescription = "description"
        case ref = "$ref"
    }
}

// MARK: - Token
struct Token: Codable {
    let type: String
    let properties: TokenProperties
    let tokenDescription: String

    enum CodingKeys: String, CodingKey {
        case type, properties
        case tokenDescription = "description"
    }
}

// MARK: - TokenProperties
struct TokenProperties: Codable {
    let token, expiresOn: EndingDate
}

// MARK: - URLClass
struct URLClass: Codable {
    let type: String
    let urlRequired: [String]
    let properties: URLProperties
    let urlDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case urlRequired = "required"
        case properties
        case urlDescription = "description"
    }
}

// MARK: - URLProperties
struct URLProperties: Codable {
    let url: BallotInput
}

// MARK: - User
struct User: Codable {
    let type: String
    let userRequired: [String]
    let properties: UserProperties
    let userDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case userRequired = "required"
        case properties
        case userDescription = "description"
    }
}

// MARK: - UserProperties
struct UserProperties: Codable {
    let username, email, firstName, lastName: BallotInput
    let avatarURL, twoFactorAuthentication: BallotInput
    let token: ElectionData
    let trustedDevice: BallotInput
}

// MARK: - Voter
struct Voter: Codable {
    let type: String
    let voterRequired: [String]
    let properties: VoterProperties
    let voterDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case voterRequired = "required"
        case properties
        case voterDescription = "description"
    }
}

// MARK: - VoterProperties
struct VoterProperties: Codable {
    let name, hash: BallotInput
}

// MARK: - Winner
struct Winner: Codable {
    let type: String
    let winnerRequired: [String]
    let properties: WinnerProperties
    let winnerDescription: String

    enum CodingKeys: String, CodingKey {
        case type
        case winnerRequired = "required"
        case properties
        case winnerDescription = "description"
    }
}

// MARK: - WinnerProperties
struct WinnerProperties: Codable {
    let candidate, score: SecurityQuestion
}

// MARK: - Info
struct Info: Codable {
    let infoDescription, version, title: String
    let contact: Contact
    let license: License

    enum CodingKeys: String, CodingKey {
        case infoDescription = "description"
        case version, title, contact, license
    }
}

// MARK: - Contact
struct Contact: Codable {
    let name: String
}

// MARK: - License
struct License: Codable {
    let name: String
    let url: String
}



// MARK: - APIV1AccountActivateTokenClass
struct APIV1AccountActivateTokenClass: Codable {
    let apiV1Get: PostClass

    enum CodingKeys: String, CodingKey {
        case apiV1Get = "get"
    }
}

// MARK: - PostClass
struct PostClass: Codable {
    let tags: [String]
    let summary, getDescription, operationID: String
    let parameters: [Parameter]
    let responses: PostResponses

    enum CodingKeys: String, CodingKey {
        case tags, summary
        case getDescription = "description"
        case operationID = "operationId"
        case parameters, responses
    }
}

// MARK: - Parameter
struct Parameter: Codable {
    let name: String
    let parameterIn: In
    let parameterRequired: Bool
    let type: TypeEnum?
    let parameterDescription: String?
    let schema: Schema?

    enum CodingKeys: String, CodingKey {
        case name
        case parameterIn = "in"
        case parameterRequired = "required"
        case type
        case parameterDescription = "description"
        case schema
    }
}

enum In: String, Codable {
    case body = "body"
    case header = "header"
    case path = "path"
}

// MARK: - Schema
struct Schema: Codable {
    let ref, type: String?
    let items: ElectionData?

    enum CodingKeys: String, CodingKey {
        case ref = "$ref"
        case type, items
    }
}

// MARK: - PostResponses
struct PostResponses: Codable {
    let the200: Purple200

    enum CodingKeys: String, CodingKey {
        case the200 = "200"
    }
}

// MARK: - Purple200
struct Purple200: Codable {
    let the200_Description: Description
    let schema: ElectionData

    enum CodingKeys: String, CodingKey {
        case the200_Description = "description"
        case schema
    }
}

enum Description: String, Codable {
    case successfulOperation = "successful operation"
}

// MARK: - APIV1AuthForgotPasswordResetTokenClass
struct APIV1AuthForgotPasswordResetTokenClass: Codable {
    let post: PostClass
}

// MARK: - APIV1Election
struct APIV1Election: Codable {
    let apiV1ElectionGet: APIV1ElectionIDBallotsGet
    let post: PostClass

    enum CodingKeys: String, CodingKey {
        case apiV1ElectionGet = "get"
        case post
    }
}

// MARK: - APIV1ElectionIDBallotsGet
struct APIV1ElectionIDBallotsGet: Codable {
    let tags: [String]
    let summary, getDescription, operationID: String
    let parameters: [Parameter]
    let responses: PurpleResponses

    enum CodingKeys: String, CodingKey {
        case tags, summary
        case getDescription = "description"
        case operationID = "operationId"
        case parameters, responses
    }
}

// MARK: - PurpleResponses
struct PurpleResponses: Codable {
    let the200: Fluffy200

    enum CodingKeys: String, CodingKey {
        case the200 = "200"
    }
}

// MARK: - Fluffy200
struct Fluffy200: Codable {
    let the200_Description: Description
    let schema: VoterListClass

    enum CodingKeys: String, CodingKey {
        case the200_Description = "description"
        case schema
    }
}

// MARK: - APIV1ElectionID
struct APIV1ElectionID: Codable {
    let apiV1ElectionIDGet, post, delete: PostClass

    enum CodingKeys: String, CodingKey {
        case apiV1ElectionIDGet = "get"
        case post, delete
    }
}

// MARK: - APIV1ElectionIDBallotsClass
struct APIV1ElectionIDBallotsClass: Codable {
    let apiV1Get: APIV1ElectionIDBallotsGet

    enum CodingKeys: String, CodingKey {
        case apiV1Get = "get"
    }
}

*/
