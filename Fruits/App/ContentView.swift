//
//  ContentView.swift
//  Fruits
//
//  Created by Harshvardhan Basava on 18/05/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    var fruits: [Fruit] = fruitsData
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()){ item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)){
                            FruitRowView(fruit: item)
                                .padding(.vertical, 4)
                        }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }
            
            ).sheet(isPresented: $isShowingSettings, content: {
                SettingsView()
            }))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData).previewDevice("iPhone 12 Pro Max")
    }
}
