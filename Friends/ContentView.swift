//
//  ContentView.swift
//  Friends
//
//  Created by rgs on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    
    var friends = [Friend(name: "Minghao",
                          icon: "person.fill.checkmark",
                          school: "Hwa Chong",
                          slothImage: "sloth3"),
                   Friend(name: "Yixing",
                          icon: "bolt.heart.fill",
                          school: "Raffles Junior College",
                          slothImage: "sloth2"),
                   Friend(name: "Dawn",
                          icon: "zzz",
                          school: "Temasek Junior College",
                          slothImage: "sloth1")]
    
    var body: some View {
        NavigationView {
            List(friends) { friend in
                NavigationLink(destination: FriendDetailView(friend: friend)) {
                    Image(systemName: friend.icon)
                    
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .bold()
                        Text(friend.school)
                    }
                }
                .navigationTitle("Friends")
            }
        }
    }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        
    }

