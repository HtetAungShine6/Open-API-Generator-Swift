//
//  TestView.swift
//  OpenAIClient
//
//  Created by Akito Daiki on 27/06/2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

#Preview {
    TestView()
}


struct TestView: View {
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Get Users") {
                Task{
                    do {
                        try await getAllUsers()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
//        .onAppear{
//            Task {
//                try? await getAllUsers()
//            }
//        }
    }
    
    let client: Client
    
    init() {
        self.client = Client(
            serverURL: try! Servers.server1(), 
            transport: URLSessionTransport()
        )
    }
    
    func getAllUsers() async throws {
        let response = try await client.getUsers(Operations.getUsers.Input())
        switch response {
        case .ok(let response):
            print(response)
        default:
            throw "Error"
        }
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { self }
}
