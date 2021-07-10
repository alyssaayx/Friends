//
//  FriendsApp.swift
//  Friends
//
//  Created by rgs on 26/6/21.
//

import SwiftUI

@main
struct FriendsApp: App {
    
    @ObservedObject var friendsData = FriendsData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(friends: $friendsData.friends)
                .onAppear {
                    friendsData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                                            friendsData.save()
                               }
        }
    }
}
}
