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
    
    
    
    var body: some View {
        NavigationView {
            List (0..<friends.count) { index in
                NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                    
                    Image(systemName: friends[index].icon)
                    
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .bold()
                        HStack {
                            Text(friends[index].school)
                            
                            Spacer()
                            
                            ForEach(friends[index].types, id: \rawValue) { type in
                                Image(systemName: type.getSymbolName())
                                
                                }
                            }
                        }
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

