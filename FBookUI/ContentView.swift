//
//  ContentView.swift
//  FBookUI
//
//  Created by Ariesta Agung on 22/06/20.
//  Copyright © 2020 Devata Creative Digital. All rights reserved.
//

import SwiftUI
struct Post{
    let id : Int
    let user, post, imageName, profileImage : String
}

struct Story{
    let id : Int
    let users, image: String
}


struct ContentView: View {
    init() {
        let navbarAppearance = UINavigationBar.appearance()
        navbarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    
    let posts : [Post] = [
        .init(id: 0, user: "User 01", post: "I have taken this photo, this view is so good for stres relieving", imageName: "33Icu2TZ3-Q", profileImage: "aA1k04PswEw"),
        .init(id: 1, user: "Wulan", post: "Lorem ipsum dolor set amet, well this is an example of post that have a long text in it.", imageName: "MBJMvBxhJYo", profileImage: "aA1k04PswEw"),
        .init(id: 2, user: "Wulan", post: "I have taken this photo, this view is so good for stres relieving", imageName: "33Icu2TZ3-Q", profileImage: "aA1k04PswEw"),
        .init(id: 3, user: "Wulan", post: "I have taken this photo, this view is so good for stres relieving", imageName: "33Icu2TZ3-Q", profileImage: "aA1k04PswEw")
    ]
    let stories : [Story] = [
        .init(id: 0, users: "User 01", image: "MBJMvBxhJYo"),
        .init(id: 1, users: "User 02", image: "KIBowrtdhwc"),
        .init(id: 2, users: "User 03", image: "JWj7wd37ZoM"),
        .init(id: 3, users: "User 04", image: "UbW4o7qRhVk"),
        .init(id: 4, users: "User 05", image: "u-qo8AmIKbY"),
        .init(id: 5, users: "User 06", image: "u-qo8AmIKbY")
    ]
    
    var body: some View {
        VStack{
            if #available(iOS 14.0, *) {
                HeaderView()
            } else {
                // Fallback on earlier versions
            }
            List{
                Section{
                    //Make Status Rows
                    MakePost()
                }
                Section{
                    //Story Rows
                    VStack (alignment: .leading){
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                AddStoryView()
                                ForEach(stories, id: \.id){Story in
                                    StoryView(story: Story)
                                }
                            }
                        }
                    }
                    .frame(height:150)
                }
                //post Rows
                ForEach(posts, id: \.id){ post in
                    postRow(post: post)
                }
                //Like Comment Share Rows
                
            }
        }
    }
}

struct AddStoryView: View{
    var body: some View{
        ZStack{
            Image("J6mySj3wntg")
                .renderingMode(.original)
                .frame(width: 80, height: 140)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .overlay(AddStoryOverlay(), alignment: .bottom)
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.4))
        .frame(alignment: .bottom)
    }
}

struct AddStoryOverlay: View{
    var body: some View{
        ZStack(alignment: .center){
            Button("+"){}
            .frame(width: 20, height: 20, alignment: .center)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Circle())
            .padding(5)
            .offset(x: 0, y: -25)
            .font(.system(size: 16).weight(.medium))
            Text("Create Story")
                .font(.system(size: 12).weight(.medium))
                .padding(5)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
        }
        .frame(width: 80, height: 140/3)
        .background(Color.white)
    }
}



@available(iOS 14.0, *)
struct HeaderView: View{
    var body: some View{
        //- TODO: Create facebook current header
        
        LazyVGrid(columns: [GridItem(.fixed(100), alignment: .leading), GridItem(.flexible(minimum: 150, maximum: 200))]){
            
        }
        HStack{
        
            Text("fesbuk")
                .foregroundColor(.blue)
                .font(.headline)
                .frame(alignment: .leading)
            HStack{
                Button("p"){}
                .foregroundColor(Color.gray)
                .clipShape(Circle())
            }
            .frame(alignment: .trailing)
        }
        .frame(height: 25)
    }
}

struct AdditionalStatusView: View {
    var body: some View{
        HStack (spacing:0){
            Button(action: {}){
                HStack{
                    Image("like")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:50, height: 50)
                    Text("Like").font(.system(size: 12))
                }
            }.frame(minWidth:0, maxWidth: .infinity)
            Button(action: {}){
                HStack{
                    Image("komen")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:50, height: 50)
                    Text("Comment").font(.system(size: 12))
                }
            }.frame(minWidth:0, maxWidth: .infinity)
            Button(action: {}){
                HStack{
                    Image("share")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:50, height: 50)
                    Text("Share").font(.system(size: 12))
                }
            }.frame(minWidth:0, maxWidth: .infinity)
        }
    }
}

struct MakePost: View{
    @State var status : String = ""
    
    var body: some View{
        VStack{
            HStack{
                Image("J6mySj3wntg").renderingMode(.original)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                TextField("What‘s on your mind?", text: $status)
            }
            HStack (spacing: 0){
                Button(action: {}){
                    HStack{
                        Image("live")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Live")
                    }
                }.frame(minWidth:0, maxWidth: .infinity)
                Button(action:{}){
                    HStack{
                        Image("photos")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Photos")
                    }
                }.frame(minWidth:0, maxWidth: .infinity)
                Button(action : {}){
                    HStack{
                        Image("pin")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Check In")
                    }
                }.frame(minWidth:0, maxWidth: .infinity)
            }
        }
        .frame(height: 100)
    }
}

struct StoryView : View {
    let story : Story
    var body: some View {
        
        HStack (alignment: .center){
            Image(story.image)
                .renderingMode(.original)
                .frame(width: 80, height: 140)
                .clipped()
            //                .overlay(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).stroke(Color.blue, lineWidth: 8))
                .overlay(StoryNameOverlay(story: story), alignment: .bottomLeading)
                .overlay(StoryProfilePictureOverlay(story: story), alignment: .topLeading)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        }
    }
}

struct StoryNameOverlay: View{
    let story: Story
    var body: some View{
        ZStack{
            Text(story.users)
                .foregroundColor(.white)
                .font(.system(size: 12).weight(.semibold))
        }.padding(8)
    }
}

struct StoryProfilePictureOverlay: View{
    let story: Story
    var body: some View{
        ZStack{
            Image(story.image)
                .renderingMode(.original)
                .overlay(Circle().stroke(Color.blue, lineWidth: 8))
                .frame(width: 5, height: 5)
                .clipShape(Circle())
        }
    }
}

struct postRow : View{
    let post : Post
    var body : some View{
        VStack (alignment: .leading, spacing: 16){
            HStack{
                Image(post.profileImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .clipShape(Circle())
                VStack (alignment: .leading, spacing: 4){
                    Text(post.user).font(.headline)
                    Text("posted 8 Hours ago.").font(.subheadline)
                }
            }
            Text(post.post).lineLimit(nil)
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.leading, -16)
                .padding(.trailing, -16)
            AdditionalStatusView()
        }.padding(.bottom, 16).padding(.top, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
