//
//  ContentView.swift
//  CoreDataTut
//
//  Created by Neil Marcellini on 2/20/20.
//  Copyright © 2020 Neil Marcellini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TodoItem.getAllTodoItems()) var todoItems:FetchedResults<TodoItem>
    @State private var newTodoItem = ""
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's Next")){
                    HStack {
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action: {
                            let todoItem = TodoItem(context: self.managedObjectContext)
                            todoItem.title = self.newTodoItem
                            todoItem.createdAt = Date()
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            // clean variable
                            self.newTodoItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(Font.headline)
                Section(header: Text("To Do's")) {
                    ForEach(self.todoItems) { todoItem in
                        TodoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete { indexSet in
                        let deleteItem = self.todoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
