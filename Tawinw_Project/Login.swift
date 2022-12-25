//
//  LogIn.swift
//  SplashScreen
//
//  Created by Nsreen Alfaifi on 27/05/1444 AH.
//

import SwiftUI

struct Login: View {
    @State var id : String = ""
    @State var Password : String = ""
    @State private var wrongInfor = 0
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color("bluee").ignoresSafeArea()
                
                Image("LOGO")
                    .resizable()
                    .frame(width: 120,height: 120)
                    .padding(.bottom, 500.0)
                
                
                
                VStack(alignment: .trailing){
                    Text("تسجيل الدخول")
                        .foregroundColor(.white)
                        .font(.title)
                        .lineLimit(nil)
                        .bold()
                        .padding()
                    
                    
                    
                    //
                    Text("    الهوية الوطنية / رقم الاقامة")
                        .foregroundColor(.white)
                    VStack(alignment: .trailing){
                        
                        TextField ( " الهوية الوطنية " , text : $id)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 350,height: 44)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.top, -12)
                        
                        
                        
                        Text("كلمة السر ")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                        
                        SecureField( "كلمة السر" , text : $Password)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 350,height: 44)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.top, -1)
                        
                        
                        NavigationLink(destination: {
                            
                            if  autheticateUser(id : id , Password : Password) {
                                opportunitiesPage()
                                
                            }else {
                                Login()
                            }
                            
                        },label: {
                            Text("تسجيل دخول")
                                .foregroundColor(.black)
                        })
                        .frame(width: 340,height: 60)
                        .font(.title2)
                        .bold()
                        .background(.yellow)
                        .cornerRadius(10)
                        .padding(.top, 30)
                        
                        
                        
                        NavigationLink(destination: {
                       
                           Signup()
                            
                        },label: {
                            HStack{
                                Text("التسجيل")
                                    .foregroundColor(.yellow)
                                Text("ليس لديك حساب ؟ ")
                                    .foregroundColor(.white)
                                    
                            }
                        })
                      
                        .font(.body)
                      
                    }
                    .padding()
                    
                    
                    
                    
                }
            }
        }
        
        
        
        .navigationBarBackButtonHidden(true)
    }
    
    func autheticateUser ( id : String , Password : String)-> Bool{
        
        if id.contains("123456789"){
            if Password.contains("123456"){
                wrongInfor = 0
            }
            return true
            
        }else{
            wrongInfor = 2
            return false
        }
    }
}
    
    struct LogIn_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }
    
