//
//  BlogView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

// Use FirebaseFirestore and FirebaseFirestoreSwift

import SwiftUI

struct BlogView: View {
    @State private var text: String = ""
    @State private var textEditor: String = ""
    @State private var isPresented: Bool = false
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(BlogItem.blogs) { blog in
                        NavigationLink(destination: Text(blog.description)) {
                            BlogPost(blog: blog)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .swipeActions {
                            Button {
                                
                            } label: {
                                Image(systemName: "bookmark")
                            }
                            .tint(.orange)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                
                            } label: {
                                Image(systemName: "heart")
                            }
                            .tint(.pink)
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "message")
                            }
                            .tint(.leaf)
                        }
                    }
                }
                .listStyle(.plain)
                .background(Color.clover.opacity(0.4).ignoresSafeArea())
                .sheet(isPresented: $isPresented, onDismiss: nil, content: {
                    Form {
                        Section {
                            TextEditor(text: $textEditor)
                        } header: {
                            Text("Description")
                        }
                        
                        Section {
                            ZStack {
                                Button {
                                    showingImagePicker = true
                                } label: {
                                    Text("Choose an image")
                                }
                                .foregroundColor(showingImagePicker ? .clear : .leaf)
                                .sheet(isPresented: $showingImagePicker) {
                                    ImagePicker(image: $inputImage)
                                }
                                
                                image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                                    .padding()
                            }
                        } header: {
                            Text("Image")
                        }
                        
                        Button(action: {
                            textEditor = ""
                            image = nil
                            isPresented = false
                        }) {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                        }
                        .tint(.leaf)
                    }
                    .onAppear(perform: {
                        UITableView.appearance().backgroundColor = UIColor(.clover.opacity(0.25))
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                    })
                })
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(7)
                            .foregroundColor(.white)
                            .background(Color.leaf, in: Circle())
                    }
                }
            }
            .navigationTitle("Blogs")
            .onChange(of: inputImage) { _ in loadImage() }
        }
        .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
