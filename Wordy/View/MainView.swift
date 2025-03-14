//
//  MainView.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wordGroups: [WordGroup]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(wordGroups) { wordGroup in
                    NavigationLink {
                        Text("This is \(wordGroup.name)")
                    } label: {
                        Text(wordGroup.name)
                    }
                }
                .onDelete(perform: deleteWordGroup)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addWordGroup) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addWordGroup() {
        withAnimation {
            let newWordGroup = WordGroup(name: "new word group")
            modelContext.insert(newWordGroup)
        }
    }

    private func deleteWordGroup(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(wordGroups[index])
            }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: WordGroup.self, inMemory: true)
}
