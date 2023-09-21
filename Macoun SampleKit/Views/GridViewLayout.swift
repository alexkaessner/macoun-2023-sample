//
//  GridViewLayout.swift
//  Macoun SampleKit
//
//  Created by Alexander Käßner on 21.09.23.
//

import SwiftUI

struct GridViewLayout: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], alignment: .center, spacing: 16) {
                    ForEach(0..<10) {
                        // Bad Example
                        //CardViewSmallBad(number: $0)
                        
                        // Good Example
                        CardViewSmall(number: $0)
                    }
                }
                .padding()
            }
            .navigationTitle("Abstände")
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
struct CardViewSmall: View {
    var number: Int
    
    var body: some View {
        HStack {
            Image(systemName: "lizard.circle.fill")
                .font(.title)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading) {
                Text("Überschrift")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Item \(number)")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            #if os(iOS)
            RoundedRectangle(cornerRadius: 8)
                .fill(.background)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
            #elseif os(macOS)
            MacCardBackground()
            #endif
        }
    }
}


// MARK: - Bad Example
struct CardViewSmallBad: View {
    var number: Int
    
    var body: some View {
        HStack {
            Image(systemName: "lizard.circle.fill")
            
            Spacer()
            
            VStack(alignment: .center, spacing: 0.0) {
                Text("Card Title")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Item \(number)")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.background)
        }
    }
}

#Preview {
    GridViewLayout()
}
