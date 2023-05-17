//
//  SignInView.swift
//  Frontend2
//
//  Created by 임승현 on 2023/05/14.
//

import Foundation
import SwiftUI


struct SignInView: View {
    @State private var userID = ""
    @State private var password = "" //로그인을 위한 변수 선언
    
    @State private var LogInTapped = false
    @State private var KakaoTapped = false
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Sign In")
                .font(.largeTitle)
                .padding()
                
            TextField("User ID",text: $userID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("아이디")
            SecureField("Password",text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("비밀번호")
            
            Button(action: {
                //ID, 비밀번호 유효한지 확인, 계정 정보들과 관련된 정보 교환
                if(isValidLogin(username: userID,password: password)){LogInTapped = true} //여기서 isValidLogin()은 그 사람 계정 정보와 우리가 받은 ID와 비번이 일치하는지를 판단하는 함수여야 할 것.
                else {showAlert=true}//로그인이 되지 않은 경우
            }) {
                Text("Login")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(5)
                    .accessibilityLabel("로그인")
                    .accessibilityHint("포스트뷰로 떠나볼까요?")
            }
            .alert(isPresented:$showAlert){
                    Alert(
                        title: Text("경고"),
                        message: Text("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.")
                            .accessibilityLabel("아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.")
                        ,
                        dismissButton: .default(Text("OK")
                            .accessibilityLabel("확인"))
                    ) }
            
            Button(action: {
                KakaoTapped = true //카카오와 연동
            }) {
            Text("카카오톡으로 로그인")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(3)
                    .accessibilityLabel("카카오톡으로 로그인")
                    
            }
        }
        
         .sheet(isPresented: $LogInTapped) {
             MainView()
                 .edgesIgnoringSafeArea(.all)
         }
         .sheet(isPresented: $KakaoTapped) {
             KakaoConnect()
                 .edgesIgnoringSafeArea(.all)
         }
    }
}
func isValidLogin(username: String,password: String) -> Bool{
    //Requires Server Connection
    var login=1
    //로그인 정보 일치 하면 login=1
    //로그인 정보 일치 안하면 login=0 으로 하는걸로 해야해요.
    
    if(login != 0){return true}
    else {return false} 
}

