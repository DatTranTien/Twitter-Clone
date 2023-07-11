//
//  UserProfile.swift
//  TwitterClone
//
//  Created by Admin on 05/07/2023.
//

import SwiftUI

struct UserProfile: View {
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var currentTab = "Tweets"
    @Namespace var animation
    @State var tabBarOffset: CGFloat = 0
    var body: some View {
       
            VStack(spacing: 15){
                ScrollView{
                    GeometryReader{
                        proxy -> AnyView in
                        let minY = proxy.frame(in: .global).midY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        return AnyView(
                            ZStack{
                                Image("logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0  ?180+minY:0, alignment: .center)
                                    .cornerRadius(0)
                                BlurView().opacity(0.8)
                                
                                VStack(spacing: 5, content: {
                                    Text("Dat Tran")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("150 tweets").foregroundColor(.white)
                                })
                                .offset(y: 120)
                                .offset(y: titleOffset > 100 ? 0 : -getTitleOffset())
                                .opacity(titleOffset < 100 ? 1 : 0)
                            }
                                .clipped()
                                .frame(height: minY > 0 ? 90 + minY : nil)
                                .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                        )
                    }
                    .frame(height: 180).zIndex(1)
                    
                    VStack{
                        HStack{
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Color.white)
                                .offset(y: offset < 0 ? getOffset() - 20  : -20)
                                .scaleEffect(getScale())
                            
                            Spacer()
                            Button(action: {}, label: {
                                Text("Edit Profile")
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.blue, lineWidth: 1.5))
                            })
                        }
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Cem")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("@Cem_salta")
                                .foregroundColor(.gray)
                            
                            Text("Được dịch từ tiếng Anh-Trong xuất bản và thiết kế đồ họa, Lorem ipsum là một văn bản giữ chỗ thường được sử dụng để thể hiện hình thức trực quan của tài liệu hoặc kiểu chữ mà không dựa vào nội dung có ý nghĩa. Lorem ipsum có thể được sử dụng làm trình giữ chỗ trước khi có bản sao cuối cùng.")
                            
                            HStack(spacing: 5, content: {
                                Text("12").foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                
                                Text("680")
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                    .padding(.leading,10)
                                
                                Text("Following").foregroundColor(.gray)
                            })
                        })
                        VStack(spacing: 0, content: {
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack(spacing: 0, content: {
                                    TabButton(title: "Tweets", currentTab: $currentTab, animation: animation)
                                    TabButton(title: "Tweets & Likes", currentTab: $currentTab, animation: animation)
                                    TabButton(title: "Media", currentTab: $currentTab, animation: animation)
                                    TabButton(title: "Likes", currentTab: $currentTab, animation: animation)
                                })
                            })
                            Divider()
                        })
                        .padding(.top,30)
                        .background(Color.white)
                        .offset(y: tabBarOffset < 90 ? -tabBarOffset+90 : 0)
                        .overlay(
                            GeometryReader {proxy -> Color in
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.tabBarOffset = minY
                                }
                                return Color.clear
                            }.frame(width: 0, height: 0)
                            , alignment: .top
                        ).zIndex(1)
                    
                        VStack(spacing:18, content: {
                            TweetCellView(tweet: "Hey Dat",tweetImage: "logo")
                            
                            Divider()
                            ForEach(0..<20, id: \.self){
                                _ in
                                TweetCellView(tweet: sampleText)
                                Divider()
                            }
                        })
                        .padding(.top)
                        .zIndex(0)
                    }
                    .padding(.horizontal)
                    .zIndex(-offset > 80 ? 0: 1)
//                    .padding(.top, -25)
//                        .padding(.bottom, -10)
                    
                    
//                .overlay(content: <#T##() -> View#>)
//                .overlay(
//                    GeometryReader {proxy -> Color in
//                        let minY = proxy.frame(in: .global).minY
//                        DispatchQueue.main.async {
//                            self.titleOffset = minY
//                        }
//                        return Color.clear
//                    }
//                    )
//                .frame(width: 0, height: 0,alignment: .top)
                    
                    
            }
        }
            .ignoresSafeArea(.all,edges: .top)
    }
    func bluViewOpacity() -> Double {
        let progress = -(offset + 80)/150
        return Double(-offset > 80 ? progress : 0)
    }
    
    func getTitleOffset() -> CGFloat {
        let progress = 20/titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    func getOffset() -> CGFloat {
        let progress = (-offset/80)*20
        return progress <= 20 ? progress : 20
    }
    func getScale() -> CGFloat {
        let progress = -offset/80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
