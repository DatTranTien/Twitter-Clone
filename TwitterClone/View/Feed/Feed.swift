//
//  Feed.swift
//  TwitterClone
//
//  Created by Admin on 03/07/2023.
//

import SwiftUI


var sampleText = "Trong các tôn giáo khởi nguồn từ Abraham, thiên thần sa ngã là những thiên thần bị trục xuất khỏi thiên đàng. Thuật ngữ \"thiên thần sa ngã\" tuy không xuất hiện trong Kinh Thánh cũng như trong các thánh thư tôn giáo Abraham khác, nhưng thường được dùng để mô tả những thiên thần lầm đường lạc lối hay những thiên thần bị đuổi khỏi thiên đàng.[1] Những thiên thần như vậy thường cám dỗ con người phạm tội, chống lại Thiên Chúa."

var test = "TÍNH SƯƠNG SƯƠNG CẦN MẤT BAO NHIÊU TIỀN ĐỂ PHỦ KÍN SÂN MỸ ĐÌNH SHOW BLACKPINK. \n Sức chứa của sân là 40.000 nhưng theo sơ đồ bị khuất một bên nên sẽ chỉ có khoảng 35.000 người để phủ kín khu ngồi bên ngoài."

struct Feed: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false,content: {
            VStack(spacing:18){
                TweetCellView(tweet: test, tweetImage: "BornPink")
                ForEach(1...20, id: \.self, content: {
                    _ in
                    TweetCellView(tweet: sampleText)
                    Divider()
                })
            }.padding(.top).padding(.horizontal).zIndex(0)
        })
//        TweetCellView(tweet: sampleText)
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}


