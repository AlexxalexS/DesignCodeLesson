//
//  TabBar.swift
//  DesignCode
//
//  Created by Mac on 18.05.2021.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().environmentObject(UserStore())
                .tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            
            CourseList().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
