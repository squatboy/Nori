//
//  SwiftUIView.swift
//
//
//  Created by 이재영 on 1/26/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            StartUpView()
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct SidebarView: View {
    let categories = ["Intro", "Explore"]
    let courses = ["Yutnori", "BiseokChigi", "DDakjiChigi", "4"]
    
    var body: some View {
        List {
            ForEach(categories, id: \.self) { category in
                switch category {
                case "Intro":
                    Section(header: Text(category)) {
                        NavigationLink(destination: IntroView()) {
                            HStack {
                                Image("IntroIcon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("What is Nori")
                            }
                        }
                    }
                case "Explore":
                    Section(header: Text(category)) {
                        ForEach(courses, id: \.self) { course in
                            NavigationLink(destination: destinationView(for: course)) {
                                HStack(spacing : 10) {
                                    Image(course)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    Text(course)
                                }
                            }
                        }
                    }
                default:
                    EmptyView()
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Nori")
    }
}

struct StartUpView: View {
    var body: some View {
        Text("Select a Course")
            .font(.system(size: 60))
            .bold()
    }
}

@ViewBuilder
private func destinationView(for course: String) -> some View {
    switch course {
    case "Yutnori":
        YutnoriView()
    case "BiseokChig":
        BiseokChigiView()
//    case "3":
//        ThreeView()
//    case "4":
//        FourView()
    default:
        EmptyView()
    }
}

#Preview {
    MainView()
}
