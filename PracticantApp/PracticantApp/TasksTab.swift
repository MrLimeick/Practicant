//
//  TaskTab.swift
//  PracticantApp
//
//  Created by Лайм on 25.02.2026.
//

import SwiftUI

class User: Identifiable {
    private(set) var id = UUID()

    var name: String

    init(name: String) {
        self.name = name
    }
}

class Task: Identifiable, Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id
    }

    private(set) var id = UUID()

    var title: String
    var desc: String

    var task: String

    init(title: String, description: String, task: String) {
        self.title = title
        self.desc = description
        self.task = task
    }
}

struct ReportSendView: View {
    var body: some View {
        Text("Здесь отправлется отчёт")
            .navigationTitle("Отправка отчёта")
    }
}

struct TaskDetailView: View {
    let task: Task

    var body: some View {
        VStack {
            Form {
                Section("Задание") {
                    Text(task.task)
                }
                Section {
                    NavigationLink {
                        ReportSendView()
                    } label: {
                        Text("Отправить отчёт")
                    }
                }
            }.formStyle(.grouped)
            
        }
        .navigationTitle(task.title)
    }
}

struct TaskView: View {
    let task: Task

    var body: some View {
        NavigationLink {
            TaskDetailView(task: task)
        } label: {
            VStack(alignment: .leading) {
                Text("Задание #1")
                    .textScale(.secondary)
                Text(task.title)
                    .font(.headline)
                Text(task.desc)
                    .font(.subheadline)
            }
        }
    }
}

struct TaskListView: View {
    private var tasks: [Task] = [
        Task(
            title: "Название задания",
            description: "Просто проверка",
            task: "Само задание"
        ),
        Task(
            title: "Составить отчёт",
            description: "Создание отчёта",
            task: "Само задание"
        ),
    ]

    var body: some View {
        List {
            ForEach(tasks) { task in
                TaskView(task: task)
            }.onDelete { set in
                
            }
        }
        .toolbar {
            Button("Add") {
            }
        }

    }
}

struct TasksTab: View {
    var body: some View {
        NavigationStack {
            TaskListView()
                .navigationTitle("Задания")
        }
        
    }
}

#Preview {
    TasksTab()
}
