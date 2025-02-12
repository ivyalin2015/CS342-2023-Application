//
// This source file is part of the CS342 2023 Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

enum Member: String, Identifiable, CaseIterable {
    case paulSchmiedmayer = "Paul Schmiedmayer, Ph.D."
    
    
    static var allMembers: [Role: [Member]] {
        var allMembers: [Role: [Member]] = [:]
        
        for member in Member.allCases {
            guard allMembers[member.role] != nil else {
                allMembers[member.role] = [member]
                continue
            }
            
            allMembers[member.role]?.append(member)
        }
        
        return allMembers
    }
    
    static var allMembersArray: [(role: Role, members: [Member])] {
        let allMembersArray = allMembers.map { ($0.key, $0.value) }
        return allMembersArray.sorted { lhs, rhs in
            lhs.0.rawValue < rhs.0.rawValue
        }
    }
    
    
    var role: Role {
        switch self {
        case .paulSchmiedmayer:
            return .instructor
        }
    }
    
    var id: RawValue {
        rawValue
    }
}
