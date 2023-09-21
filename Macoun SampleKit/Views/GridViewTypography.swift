//
//  GridViewTypography.swift
//  Macoun SampleKit
//
//  Created by Alexander Käßner on 18.09.23.
//

import SwiftUI

struct GridViewTypography: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], alignment: .center, spacing: 16) {
                    ForEach(0..<10) {
                        // Bad Example
                        //TypoCardViewBad(number: $0)
                        
                        // Good Example
                        //TypoCardViewGood(number: $0)
                        
                        // Best Example
                        TypoCardViewBest(number: $0)
                    }
                }
                .padding()
            }
            .navigationTitle("Typografie")
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


// MARK: - Best Example
struct TypoCardViewBest: View {
    var number: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Card Title")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("Item \(number)")
                .foregroundStyle(.secondary)
            
            Text("Lorem Ipsum")
                .font(.caption)
                .foregroundStyle(.tertiary)
            
            Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                .font(.caption2)
                .foregroundStyle(.tint)
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background {
                    RoundedRectangle(cornerRadius: 3)
                        //.fill(.quaternary)
                        .fill(.tint.opacity(0.3))
                }
                .padding(.top, 4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
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


// MARK: - Good Example
struct TypoCardViewGood: View {
    var number: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.tertiary)
                .padding(.bottom, 4)
            
            Text("Card Title")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("Item \(number)")
                .foregroundStyle(.secondary)
            
            Text("Lorem Ipsum")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.background)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
        }
    }
}


// MARK: - Bad Example
struct TypoCardViewBad: View {
    var number: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Card Title")
                .font(.title)
                .fontWeight(.heavy)
            
            Text("Item \(number)")
                .font(.title2)
            
            Text("Lorem Ipsum")
                .font(.subheadline)
            
            Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                .font(.caption2)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.background)
        }
    }
}

#Preview {
    GridViewTypography()
}
