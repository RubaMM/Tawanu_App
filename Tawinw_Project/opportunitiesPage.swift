import SwiftUI
import CloudKit

struct opportunitiesPage: View {
    @State private var search = "  بحث "
    @State var CopyOinfo : [Oinfo] = [Oinfo.ex1,Oinfo.ex2,Oinfo.ex3,Oinfo.ex4]
    @State var showsheet :Bool = false
    @State var selectedOrg: Oinfo = Oinfo.ex1
    var body: some View {
        
        NavigationView{
            ZStack{
                
                Color("bluee").ignoresSafeArea()
                
                HStack{
                    Text("مرحبا بك ")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: {
                        
                      
                            Profile()
                   
                    }, label: {
                        Image("profile")
                            .resizable()
                            .frame(width: 45,height:45)
                    })
                }.position(x: 276 , y: 31)
                
                RoundedRectangle(cornerRadius: 35)
                    .fill(.white)
                    .frame(width: 390, height: 690)
                    .position(x: 196 , y: 480)
                
                VStack(spacing: 60){
                    
                   Searchbar1()
                        .offset(x: 0 , y: 60)
                    
                    ScrollView {
                        
                        VStack(){
                            HStack{
                                Spacer()
                                Text("الفرص التطوعية")
                                    .padding(.trailing)
                                    .padding(.bottom,-5)
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                
                            }
                            VStack(){
                                
                                ForEach(CopyOinfo){ organization in
                                    //  CardView()
                                    HStack(spacing: 1){
                                        
                                        Image("\(organization.img)")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height:60 )
                                            .padding(.leading,65)
                                        // .clipShape(Rectangle())
                                            .padding(.bottom,50)
                                        //    .padding(.horizontal)
                                        
                                        VStack(alignment: .trailing, spacing:8){
                                            Button{
                                                selectedOrg = organization
                                                
                                                showsheet.toggle()
                                            } label: {
                                                Text("\(organization.Organiz)")
                                                    .font(.title2)
                                                    .fontWeight(.semibold)
                                                    .padding()
                                                    .padding(.top,-15)
                                                    .foregroundColor(.black)
                                            }
                                            HStack{
                                                Text("\(organization.Loc)")
                                                // .position(x:230,y:15)
                                                    .font(.callout)
                                                    .foregroundColor(.secondary)
                                                    .padding(.bottom,8)
                                                    .padding(.trailing,-15)
                                                
                                                Image("LO")
                                                    .resizable()
                                                    .frame(width: 20, height:20 )
                                                    .padding(.bottom,8)
                                                    .padding(.leading)
                                                    .padding(.trailing,20)
                                                
                                            }
                                            
                                            Text("\(organization.Des) ")
                                                .multilineTextAlignment(.trailing)
                                                .position(x:105,y:25)
                                                .font(.callout)
                                                .foregroundColor(.secondary)
                                        
                                            
                                        }.padding()
                                    }
                                    .sheet(isPresented:$showsheet){
                                        MyShe(CopyO: selectedOrg)
                                            .presentationDetents([.height(600)])
                                    }
                                    .background{
                                        Rectangle()
                                            .fill(.white)
                                            .frame(width: 350, height: 180)
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                            .padding(.top,180)
                                            .position(x: 196 , y:0)
                                    }.padding(.top,25)
                                }
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct homepage_Previews: PreviewProvider {
    static var previews: some View {
        opportunitiesPage()
    }
}

struct Oinfo:Identifiable{
    
    var id: String
    var Organiz : String
    var Loc : String
    var Des : String
    var dat : String
    var img : String
    
    static let ex1 : Oinfo =  Oinfo(id:"1",Organiz: "هيئة الترفية ", Loc: "الرياض", Des: "فرصة تطوعية للمشاركة في الفعاليات و المعارض التي تنظمها..... ",dat: "11/12/2022",img: "M3")
    static let ex2 : Oinfo = Oinfo(id:"2",Organiz: "وزاره الثقافة ", Loc: "مكة المكرمة", Des: "فرصة تطوعية للمشاركة في تنظيم معرض اطفال الثقافة ",dat: "21/11/2022",img:"M1")
    static let ex3 : Oinfo = Oinfo(id:"3",Organiz: "وزاره الصحة ", Loc: "مكة المكرمة", Des: "فرصة تطوعية للمشاركة في رعاية ذوي الاحتياجات الخاصة… ",dat: "1/11/2022",img: "M2")
    static let ex4 : Oinfo = Oinfo(id:"4",Organiz: "وزاره التعليم ", Loc: "الشرقية ", Des: "فرصة تطوعية للمشاركة في تنظيم احتفال يوم التأسيس …",dat: "12/11/2022",img: "M4")
}

struct MyShe : View {
    
    var CopyO : Oinfo
    var body: some View{
        
        NavigationView{
            
            
            VStack{
                
                HStack{
                    Image("\(CopyO.img)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .padding(20)
                    
                    VStack{
                        Text("\(CopyO.Organiz)")
                            .font(.title)
                            .padding()
                        Text("\(CopyO.Loc)")
                            .font(.subheadline)
                    }
                }
                Text("\(CopyO.Des) ")
                    .frame(width: 315,height: 100)
                    .multilineTextAlignment(.trailing)
                HStack{
                    
                    Text("ذكر / أنثى")
                    
                    Image(systemName: "figure.stand")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25,height: 25)
                    
                    VStack{
                        
                        Text("16-09-2023")
                        Text("23-09-2023")
                        
                    }.padding(.leading,70)
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25,height: 25)
                        .foregroundColor(.black)
   
                }.padding(.bottom,55)
                Button{
                    print("Button was taped")
                }label: {
                    Text("الــتـقديـم")
                        .font(.title)
                        .frame(width: 340,height: 70)
                        .foregroundColor(.white)
                        .background(Color("bluee"))
                        .cornerRadius(10)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("ــــــــــــــ") {
                            // showSheet.toggle()
                        } .padding(300)
                        
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
