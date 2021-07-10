//
//  ContentView.swift
//  Friends
//
//  Created by rgs on 26/6/21.
//

import SwiftUI


struct ContentView: View {
    
    
    @State var friends = [Friend(name: "Minghao",
                                 icon: "person.fill.checkmark",
                                 school: "NUS High",
                                 slothImage: "sloth3",
                                 attack: 10,
                                 defense: 5,
                                 types: [.ice, .fire]),
                          Friend(name: "Yixing",
                                 icon: "bolt.heart.fill",
                                 school: "Raffles Junior College",
                                 slothImage: "sloth2",
                                 attack: 8,
                                 defense: 10,
                                 types: [.electric, .normal]),
                          Friend(name: "Dawn",
                                 icon: "zzz",
                                 school: "Temasek Junior College",
                                 slothImage: "sloth1",
                                 attack: 9,
                                 defense: 12,
                                 types: [.grass, .normal, .fire])]
    
    @State var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    let friendIndex = friends.firstIndex(of: friend)!
                    
                    NavigationLink(destination: FriendDetailView(friend: $friends[friendIndex])) {
                        Image(systemName: friend.icon)
                        
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .bold()
                            HStack {
                                Text(friend.school)
                                
                                Spacer()
                                
                                ForEach(friend.types, id: \.rawValue) { type in
                                    Image(systemName: type.getSymbolName())
                                }
                            }
                        }
                    }
                }.onDelete { offsets in
                    friends.remove(atOffsets: offsets)
                }.onMove { source, destination in
                                   friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Friends")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                isSheetPresented = true
            }, label: {
                Image(systemName: "plus")
            }))
        }.sheet(isPresented: $isSheetPresented) {
            NewFriendView(friends: $friends)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

