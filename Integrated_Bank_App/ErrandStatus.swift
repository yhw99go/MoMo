//
//  ErrandStatus.swift
//  Errands
//
//  Created by Chris Woodard on 10/16/16.
//  Copyright © 2016 ToDo. All rights reserved.
//

enum ErrandStatus : Int {
    case New = 0
    case InProgress = 1
    case Done = 2
    
    func text() -> String {
        switch self {
            case .New: return "New"
            case .InProgress: return "In Progress"
            case .Done: return "Done"
        }
    }
}

extension ErrandStatus {
    init(text:String) {
        switch text.lowercased() {
            case "new": self = .New
            case "in progress": self = .InProgress
            case "done": self = .Done
            default: self = .New
        }
    }
}
