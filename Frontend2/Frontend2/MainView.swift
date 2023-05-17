//
//  MainView.swift
//  Frontend2
//
//  Created by 임승현 on 2023/05/17.
//

import Foundation
import SwiftUI

struct MainView: View{
    @State private var ShopTapped = false
    
    var body: some View{
        VStack{
            Image("your_image_name")//로고 사진 박아야됨.
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("Mainpage")
                .font(.largeTitle)
                .padding()
            Button(action: {
                ShopTapped = true //카카오와 연동
            }) {
                Text("Shop")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(3)
                    .accessibilityLabel("쇼핑 시작하기")
                    .accessibilityHint("포스트뷰와 함께 쇼핑을 시작해요. 새로운 경험을 선사합니다.")
            }
        }
        .sheet(isPresented: $ShopTapped) {
            ShopMainView()
                .edgesIgnoringSafeArea(.all)
        }
    }
}
struct ShopMainView: View{
    var body: some View{
        Text("Shop Main View")
    }
}
