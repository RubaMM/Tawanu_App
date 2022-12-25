import SwiftUI

struct Profile: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        
        NavigationView{
            
            
            ZStack{
             
                Color("bluee").ignoresSafeArea()
                
                HStack{
                    Text(" محمد عبدالله خالد آل عزيز ")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: {
                        opportunitiesPage()
                        
                    }, label: {
                        Image("back")
                            .resizable()
                            .frame(width: 25,height:30)
                    })
                }.position(x: 210 , y: 31)
                
                RoundedRectangle(cornerRadius: 35)
                    .fill(.white)
                    .frame(width: 390, height: 820)
                    .position(x: 196 , y: 480)
                
                //progress bar code
                
                
                VStack{
                    Spacer()
                    ProgressBar(Progress: self.$progressValue, color:    Color("bluee"))
                        .frame(width: 120.0, height: 130.0)
                    // .padding (70.0)
                        .onAppear() {
                            self.progressValue = 0.30
                        }
                    
                    
                    Button ("+") {
                        if (progressValue) < 1.0 {
                            self.progressValue += 0.1/4
                        } else {
                            progressValue -= 1.0
                            
                            
                        }
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                //            Spacer()
                
                VStack(spacing: 18){
                    
                    Text("ساعات الانجاز")
                        .foregroundColor(Color.gray)
                    //.position(x:200 ,y:300)
                    
                    
                    VStack(alignment: .trailing ,spacing: 25 ){
                        
                        
                        Text("المعلومات الشخصية")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                        
                        
                        
                        
                        
                        //ID
                        
                        VStack(alignment: .trailing ,spacing: 18 ){
                            
                            Text("الهوية الوطنية / رقم الإقامة")
                            
                                .foregroundColor(Color.gray)
                            
                                .multilineTextAlignment(.trailing)
                            
                            
                            
                            VStack(alignment: .leading ,spacing:8 ){
                                
                                Text("113222545")
                                
                                
                                
                                Rectangle()
                                
                                    .foregroundColor(Color.gray)
                                
                                    .frame(width: 350,height: 1)
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
                        //school
                        
                        VStack(alignment: .trailing ,spacing: 18 ){
                            
                            Text(" اسم المدرسة ")
                            
                                .foregroundColor(Color.gray)
                            
                                .multilineTextAlignment(.trailing)
                            
                            
                            
                            VStack(alignment: .trailing ,spacing: 8 ){
                                
                                Text("الثانوية الثانية بالجبيل")
                                
                                
                                
                                Rectangle()
                                
                                    .foregroundColor(Color.gray)
                                
                                    .frame(width: 350,height: 1)
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        //email
                        
                        VStack(alignment: .trailing ,spacing: 18 ){
                            
                            Text("البريد الالكتروني")
                            
                                .foregroundColor(Color.gray)
                            
                                .multilineTextAlignment(.trailing)
                            
                            
                            
                            VStack(alignment: .leading ,spacing:8 ){
                                
                                Text("mohmmed012@gmail.com")
                                
                                
                                
                                Rectangle()
                                
                                    .foregroundColor(Color.gray)
                                
                                    .frame(width: 350,height: 1)
                                
                            }
                            
                            
                            
                        }
                        
                        
                    }
                }.position(x: 200, y: 460)
                
                
                
                
                
                //  .position(x: 200 ,y: 470)
                
                
                
                
                NavigationLink(destination: {
                
                 Login()
                    
                    
                },label: {
                    Text("تسجيل الخروج")
                        .foregroundColor(.white)
                })
                .frame(width: 340,height: 60)
                .font(.title2)
                .bold()
                .background(Color("bluee"))
                .cornerRadius(10)
                .padding(.top, 30)
                .position(x: 200 ,y: 700)
                
                
            }
      
        }
        
        .navigationBarBackButtonHidden(true)
    }
  
    
    
    
    
    
    struct ProgressBar : View {
        @Binding var Progress: Float
        var color: Color = Color.blue
        
        var body: some View{
            ZStack{
                Circle()
                    .stroke(lineWidth: 20)
                //.frame(width: 150 ,height: 150)
                    .opacity(0.2)
                    .foregroundColor(Color.blue)
                
                
                Circle ()
                    .trim(from: 0.0, to: CGFloat(min(self.Progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap:
                            .round, lineJoin: .round))
                
                    .foregroundColor (color)
                
                    .rotationEffect (Angle (degrees: 270))
                   // .animation (.easeInOut (duration: 1.0))
                   
            }
        }
    }
    
    
    struct profile_Previews: PreviewProvider {
        static var previews: some View {
            Profile()
        }
    }
}
