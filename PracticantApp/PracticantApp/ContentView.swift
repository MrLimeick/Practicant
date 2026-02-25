//
//  ContentView.swift
//  PracticantApp
//
//  Created by Лайм on 25.02.2026.
//

import SwiftUI

struct Material: Identifiable {
    let id = UUID()

    var title: String
    var content: String
}

struct MaterialTheme: Identifiable {
    let id = UUID()

    var name: String
    var materials: [Material]
}

struct MaterialDetailView: View {
    let material: Material

    var body: some View {
        VStack {
            Text(material.content)
        }
        .navigationTitle(material.title)
    }
}

struct MaterialView: View {
    let material: Material

    var body: some View {
        NavigationLink {
            MaterialDetailView(material: material)
        } label: {
            Text(material.title)
        }
    }
}

struct MaterialThemeDetailView: View {
    var theme: MaterialTheme

    var body: some View {
        List {
            ForEach(theme.materials) { material in
                MaterialView(material: material)
            }
        }
        .navigationTitle(theme.name)
    }
}

struct MaterialThemeView: View {
    var theme: MaterialTheme

    var body: some View {
        NavigationLink {
            MaterialThemeDetailView(theme: theme)
        } label: {
            Text(theme.name)
        }
    }
}

struct ThemeListView: View {
    var themes = [
        MaterialTheme(
            name: "C#",
            materials: [
                Material(
                    title: "Properties",
                    content: "Что-то про свойства"
                ),
                Material(
                    title: "GC",
                    content: "Что то про GC"
                ),
            ]
        ),
        MaterialTheme(
            name: "Swift",
            materials: [
                Material(
                    title: "guard",
                    content: "Что-то про защиту"
                ),
                Material(
                    title: "functions",
                    content: "Что-то про функции"
                ),
            ]
        ),
    ]

    var body: some View {
        List {
            ForEach(themes) { theme in
                MaterialThemeView(theme: theme)
            }
        }
    }
}

struct MaterialsTab: View {
    var body: some View {
        NavigationStack {
            ThemeListView()
                .navigationTitle("Темы")
        }
        
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Материалы", systemImage: "book") {
                MaterialsTab()
            }
            Tab("Задания", systemImage: "checkmark") {
                TasksTab()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
}
