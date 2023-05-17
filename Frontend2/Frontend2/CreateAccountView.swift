//
//  CreateAccountView.swift
//  Frontend2
//
//  Created by 임승현 on 2023/05/16.
//

import Foundation
import SwiftUI

struct CreateAccountView: View {
    @State private var userID = ""
    @State private var password = ""
    @State private var re_password = ""
    @State private var name = ""
    @State private var personinfo = ""
    @State private var address = ""
    @State private var detail_address = ""
    @State private var phonenumber = ""
    
    @State private var password_confirmalert=false
    @State private var paymentmethodTapped = false
    @State private var createTapped = false
    
    var body: some View{
        VStack{
            Text("Create Account")
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
            SecureField("Confirm Password",text: $re_password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("비밀번호 재확인")
            TextField("Name",text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("이름")
            TextField("생년월일",text: $personinfo)//시바 이거 생년월일 이렇게 받으면 안되는데
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("생년월일")
            TextField("주소",text: $address)//이것도 이렇게 받으면 안되는데
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("주소")
            /*TextField("상세 주소",text: $detail_address) //이것도 시발
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("상세 주소") */
            TextField("전화번호",text: $phonenumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .accessibilityLabel("전화번호")
            
            Button(action: {
                paymentmethodTapped = true //카드사 연동(?)
            }) {
                Text("결제수단 등록")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(3)
                    .accessibilityLabel("결제수단 등록")
            }
            Button(action: {
                if(password != re_password) {password_confirmalert=true}
                else {createTapped=true}
            }){
             Text("Create Account")
             .font(.title)
             .foregroundColor(.black)
             .padding()
             .background(Color.blue)
             .cornerRadius(3)
             .accessibilityLabel("계정 만들기")
     }
             .alert(isPresented:$password_confirmalert){
                     Alert(
                         title: Text("경고"),
                         message: Text("비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
                             .accessibilityLabel("비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
                         ,
                         dismissButton: .default(Text("OK")
                             .accessibilityLabel("확인"))
                     ) }
        }
        .sheet(isPresented: $paymentmethodTapped ) {
            paymentregisterView()
                .edgesIgnoringSafeArea(.all)
        }
        .sheet(isPresented: $createTapped) {
            MainView()//자동 로그인 되는걸로 가야하나 아니면 로그인 화면으로 가야하나.. 자동으로 해주는게 낫겠지?
                .edgesIgnoringSafeArea(.all)
        }
    }
}

