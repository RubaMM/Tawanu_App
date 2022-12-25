
import SwiftUI
import CloudKit

struct Signup: View {
    @State var aa = " "
    @State var bb = " "
    @State var cc = " "
    @State var dd = " "
    @State var ee = " "
    
    var body: some View {
        NavigationView{
            
            ZStack{
        
                Color("bluee").ignoresSafeArea()
       
                RoundedRectangle(cornerRadius: 35)
                    .fill(.white)
                    .frame(width: 390, height: 820)
                    .position(x: 196 , y: 540)
                
                
                Image("LOGO")
                    .resizable()
                    .frame(width: 80,height: 80)
                    .position(x:200 , y:70)
                //  .padding(.top,-370)
                
                VStack(alignment: .trailing , spacing: 8){
                    
                    
                    Text("التسجيل")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .padding(.top, 140)
                    
                    
                    
                    
                    
                    
                    TextFieldView(text: "الاسم كامل", textfield: " ")
                    TextFieldView (text: "الهوية الوطنية/ رقم الاقامة", textfield: " ")
                    TextFieldView (text: "اسم المدرسة", textfield: " ")
                    TextFieldView (text: "البريد الالكتروني", textfield: " ")
                    TextFieldView (text: "كلمة المرور", textfield: " ")
                    TextFieldView (text: "تأكيد كلمة المرور", textfield: " ")
                    
                    
                    VStack(alignment: .trailing){
                        NavigationLink(destination: {
                            
                            opportunitiesPage()
                            
                        },label: {
                            Text("الــتـسجيل")
                                .font(.title)
                                .frame(width: 350,height: 50)
                                .foregroundColor(.white)
                                .background(Color("bluee"))
                                .cornerRadius(10).onSubmit {

                                }
                            
                        }).padding(.top,30)

                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: {
                            
                            Login()
                            
                        },label: {
                            HStack{
                                Text("تسجيل الدخول")
                                    .foregroundColor(Color.yellow)
                                Text(" لديك حساب ؟ ")
                                    .foregroundColor(.black)
                                
                            }
                        })
                        
                        .font(.body)
                        
                        
                        
                    }
                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpPreviews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}


struct TextFieldView : View{
    
    @State  var Email : String = ""
    
    var text : String
    var textfield :  String
    
    var body: some View{
        
        Text(text)
            .font(.system(size: 16, weight: .medium, design: .default ))
        
            .padding(.leading,170)
        
        TextField(textfield, text: $Email)
            .foregroundColor(.black)
            .multilineTextAlignment(.trailing)
            .frame(width: 350 , height: 40)
            .background(Color.gray)
            .opacity(0.2)
            .cornerRadius(10)
           
        
        
    }
}
