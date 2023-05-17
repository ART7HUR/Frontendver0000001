//
//  ContentView.swift
//  Frontend2
//
//  Created by 임승현 on 2023/05/17.
//
import SwiftUI

struct ContentView: View {
    @State private var signInTapped = false
    @State private var CreateAccountTapped = false
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
        }
        
        VStack {
           
            Text("Welcome to Postview")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                signInTapped = true
            }) {
                Text("Sign In")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .accessibilityLabel("로그인")
            .accessibilityHint("계정이 존재한다면 로그인해주세요")
            
            Button(action: {
                CreateAccountTapped = true
            }) {
                Text("Create Account")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .accessibilityLabel("회원가입")
                    .accessibilityHint("회원가입하여 새로운 계정을 만듭니다")
            }
            
            
        }
       
        .sheet(isPresented: $signInTapped) {
            SignInView()
                .edgesIgnoringSafeArea(.all)
        }
        .sheet(isPresented: $CreateAccountTapped) {
            CreateAccountView()
                .edgesIgnoringSafeArea(.all)
        }
    }
}
