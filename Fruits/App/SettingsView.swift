//
//  SettingsView.swift
//  Fruits
//
//  Created by Harshvardhan Basava on 19/05/21.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    
                    GroupBox(label:SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")){
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 15){
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80, alignment: .center)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and claories. None have cholestrol. Fruits are sources of many essential nutrients, including Potassium, Dietary fiber, Vitamins, and much more.")
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")){
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the app using this toggle. This will restart with the onboarding process all over again and clear local storage.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        //Toggles the appstorage value to true when toggled on
                        Toggle(isOn: $isOnboarding, label: {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.red)
                            }
                        })
                        .padding()
                        .background(Color(UIColor.tertiarySystemBackground).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                        
                    }
                    
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")){
                        SettingsRow(name: "Developer", content: "Harshvardhan")
                        SettingsRow(name: "Designer", content: "Harshvardhan Basava")
                        SettingsRow(name: "Compatibility", content: "iOS 14 and above")
                        SettingsRow(name: "Github", linkLabel: "For the code", linkDestination: "github.com/harshbsv")
                        SettingsRow(name: "Twitter", linkLabel: "@HarshSolo", linkDestination: "twitter.com/harshsolo")
                        SettingsRow(name: "SwiftUI", content: "2.0")
                        SettingsRow(name: "Version", content: "1.0.0")
                    }
                    
                }
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
