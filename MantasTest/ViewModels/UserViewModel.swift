//
//  UserViewModel.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var usersInfo: UsersInfo? = nil
    private var cancellables = Set<AnyCancellable>()
    
    func getUsers() {
        let userPublishers = Publishers.Zip3(
            getUserPublisher(for: UserInfo.self, url: Endpoints.user),
            getUserPublisher(for: UserInfo.self, url: Endpoints.user),
            getUserPublisher(for: UserInfo.self, url: Endpoints.user)
        )
        
        userPublishers.map { (user1, user2, user3) in
            UsersInfo(users: [user1, user2, user3])
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { (completion) in
            if case let .failure(error) = completion {
                print("Error -> \(error.localizedDescription)")
            }
        }, receiveValue: { [weak self] users in
            self?.usersInfo = users
        })
        .store(in: &cancellables)
    }
    
    func getUserPublisher<T: Decodable>(for type: T.Type, url: String) -> Future<T, Error> {
        RequestManager.shared.getData(url: url, type: T.self)
    }
}
