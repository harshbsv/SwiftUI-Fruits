//
//  SettingsRow.swift
//  Fruits
//
//  Created by Harshvardhan Basava on 19/05/21.
//

import SwiftUI

struct SettingsRow: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack{
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                }else if (linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(name: "Developer", content: "Harshvardhan")
            .previewLayout(.sizeThatFits)
            .padding()
        SettingsRow(name: "Github", linkLabel: "Github", linkDestination: "https://gitub.com.harshbsv")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
