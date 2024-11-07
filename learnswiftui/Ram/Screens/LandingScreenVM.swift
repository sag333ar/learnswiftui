//
//  LandingScreenVM.swift
//  learnswiftui
//
//  Created by Sagar on 07/11/24.
//

import Foundation
import Moya

class MyViewModel: ObservableObject {
    private let provider = MoyaProvider<MyAPI>()
    @Published var posts: [Post] = []

    func fetchPosts() {
        provider.request(.getPosts) { result in
            switch result {
                case .success(let response):
                    debugPrint("It was success")
                    do {
                        let posts = try JSONDecoder().decode([Post].self, from: response.data)
                        DispatchQueue.main.async {
                            self.posts = posts
                        }
                    } catch {
                        print("Decoding error: \(error)")
                    }
                case .failure(let error):
                    debugPrint("It was failure - \(error.localizedDescription)")
            }
        }
    }
}

// Define a simple Post model for demonstration purposes
struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
