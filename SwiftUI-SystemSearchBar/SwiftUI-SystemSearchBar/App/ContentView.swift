//
//  ContentView.swift
//  SwiftUI-SystemSearchBar
//
//  Created by 김민준 on 10/7/26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    private let items = (1...50).map { "Item \($0)" }

    private var filteredItems: [String] {
        if searchText.isEmpty { return items }
        return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List(filteredItems, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("Search")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ContentView()
}
