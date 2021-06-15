//
//  MenuView.swift
//  DesignCode
//
//  Created by Mac on 19.04.2021.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var user: UserStore
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 16) {
                Text("Meng -28% completed")
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3.0)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3.0)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
                    .onTapGesture {
                        UserDefaults.standard.set(false, forKey: "isLogged")
                        self.user.isLogged = false
                        self.showProfile = false
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
//            .background(LinearGradient(gradient: Gradient(colors: [Color("background3"), Color("background3").opacity(0.6)]), startPoint: .top, endPoint: .bottom))
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showProfile: .constant(true)).environmentObject(UserStore())
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))

            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)

        }
    }
}
