//
//  ContentView.swift
//  Macoun SampleKit
//
//  Created by Alexander Käßner on 18.09.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var selectedView: Int?
    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        if horizontalSizeClass == .compact {
            // iPhone & iPad Split View (Small)
            TabView {
                GridViewHierarchy()
                    .tabItem { Label("Kontrast", systemImage: "rectangle.grid.2x2") }
                
                GridViewLayout()
                    .tabItem { Label("Abstände", systemImage: "arrow.left.and.right.square") }
                
                GridViewTypography()
                    .tabItem { Label("Typografie", systemImage: "textformat") }
            }
        } else {
            // iPad
            NavigationSplitView(columnVisibility: $columnVisibility) {
                // Sidebar
                List(selection: $selectedView) {
                    NavigationLink(value: 1) {
                        Label("Hierarchie & Kontrast", systemImage: "rectangle.grid.2x2")
                    }
                    
                    NavigationLink(value: 2) {
                        Label("Ausrichtung & Abstände", systemImage: "arrow.left.and.right.square")
                    }
                    
                    NavigationLink(value: 3) {
                        Label("Typografie", systemImage: "textformat")
                    }
                }
                .navigationTitle("SampleKit")
            } detail: {
                // Content
                switch selectedView {
                case 1:
                    GridViewHierarchy()
                case 2:
                    GridViewLayout()
                case 3:
                    GridViewTypography()
                case .none, .some(_):
                    EmptyView()
                }
            }
            .navigationSplitViewStyle(.balanced)
            .onAppear {
                // Preselect Standard View
                selectedView = 1
            }
        }
    }
}

#Preview {
    ContentView()
}
