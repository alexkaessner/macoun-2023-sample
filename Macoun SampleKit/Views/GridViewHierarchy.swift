//
//  GridViewHierarchy.swift
//  Macoun SampleKit
//
//  Created by Alexander Käßner on 21.09.23.
//

import SwiftUI

struct GridViewHierarchy: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], alignment: .center, spacing: 16) {
                    ForEach(0..<11) {
                        // Bad Example
                        //ShadowCardViewBad(number: $0)
                        
                        // Good Example
                        ShadowCardView(number: $0)
                    }
                }
                .padding()
            }
            .navigationTitle("Kontrast")
            .background {
                #if os(iOS)
                Color(uiColor: .systemGroupedBackground).ignoresSafeArea()
                #elseif os(macOS)
                Color(nsColor: .windowBackgroundColor).ignoresSafeArea()
                #endif
            }
        }
    }
}


// MARK: - Good Example
struct ShadowCardView: View {
    var number: Int
    
    var body: some View {
        VStack {
            Text("Überschrift")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("Item \(number)")
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            #if os(iOS)
            RoundedRectangle(cornerRadius: 16)
                .fill(.background)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
            #elseif os(macOS)
            MacCardBackground()
            #endif
        }
    }
}


// MARK: - Bad Example
struct ShadowCardViewBad: View {
    var number: Int
    
    var body: some View {
        VStack {
            Text("Überschrift")
                .font(.headline)
            
            Text("Item \(number)")
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .border(.black.opacity(0.5), width: 2)
    }
}



#Preview {
    GridViewHierarchy()
}
