//
//  TweetCellView.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct TweetCellView: View {
    var tweet: String
    var tweetImage: String?
    
    var body: some View {
        VStack{
            
            
            
            HStack(alignment: .top, spacing: 10, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10, content: {
                    (
                        Text("Lucifer ").fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("@Fallen_Angel")
                            .foregroundColor(.gray)
                    )
                    Text(tweet).frame(maxHeight:100, alignment: .top)
                    
                    if let image = tweetImage {
                        GeometryReader{
                            proxy in
                            Image(image).resizable().aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width,
                                       height: 250)
                                .cornerRadius(15)
                        }.frame(height: 250)
                    }
                    
                    HStack(spacing: 80,content: {
                        Button(action: {}, label: {
                            Image("Love").resizable().frame(width: 25,height: 25)
                        }).foregroundColor(.gray)
                        
                        Button(action: {}, label: {
                            Image("Repost").resizable().frame(width: 25, height: 25)
                        }).foregroundColor(.gray)
                        
                        Button(action: {}, label: {
                            Image("Comment").resizable().frame(width: 25, height: 25)
                        }).foregroundColor(.gray)
                        
                        Button(action: {}, label: {
                            Image("Upload").resizable().frame(width: 25, height: 25)
                        }).foregroundColor(.gray)
                    }).padding(.top,4)
                })
                
                
                
                
            })
        }
    }
    
    struct TweetCellView_Previews: PreviewProvider {
        static var previews: some View {
            TweetCellView(tweet: sampleText)
        }
    }
}
