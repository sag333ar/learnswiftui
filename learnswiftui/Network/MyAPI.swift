//
//  MyAPI.swift
//  learnswiftui
//
//  Created by Sagar on 07/11/24.
//

import Foundation
import Moya

// Step 1: Define your API endpoints
enum MyAPI {
    case getPosts
    case getPost(id: Int)
}

// Step 2: Extend `MyAPI` to conform to Moya's `TargetType`
extension MyAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    var path: String {
        switch self {
            case .getPosts:
                return "/posts"
            case .getPost(let id):
                return "/posts/\(id)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
