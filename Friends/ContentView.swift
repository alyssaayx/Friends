//
//  ContentView.swift
//  Friends
//
//  Created by rgs on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var friends: [Friend]
    
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
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
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
        ContentView(friends: .constant([Friend(name: "Minghao",
                                              icon: "person.fill.checkmark",
                                              school: "NUS High",
                                              slothImage: "sloth3",
                                              attack: 10,
                                              defense: 5,
                                              types: [.ice, .water]),
                                       Friend(name: "Yixing",
                                              icon: "bolt.heart.fill",
                                              school: "Raffles Instituition",
                                              slothImage: "sloth2",
                                              attack: 15,
                                              defense: 15,
                                              types: [.electric, .grass]),
                                       Friend(name: "Dawn",
                                              icon: "nose.fill",
                                              school: "Temasek Junior College",
                                              slothImage: "sloth1",
                                              attack: 6,
                                              defense: 3,
                                              types: [.normal, .grass, .ice])]))
    }
}
