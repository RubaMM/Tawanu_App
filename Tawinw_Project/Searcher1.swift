import SwiftUI

struct Searchbar1: View {
    let city = ["الرياض", "الدمام", "جدة" , " مكة" ]
    @State var searchText : String = ""
    @State var isSearching : Bool = false
    @State var CopyOinfo : [Oinfo] = [Oinfo.ex1,Oinfo.ex2,Oinfo.ex3,Oinfo.ex4]
    var body: some View {

        searchbrdesign(searchText: $searchText)

 
        }//end body

} // end struct Searchbar



struct Searchbar1_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar1()
    }
}

struct searchbrdesign : View {
    let city = ["الرياض", "الدمام", "جدة" , " مكة" ]
    @Binding var searchText : String

    var body: some View {
        HStack{

            TextField("بحث عن المدن", text : $searchText )
                .multilineTextAlignment(.trailing)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:-20)
                        .foregroundColor(Color("bluee"))
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .leading
                )
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("bluee"))
        }// end Hstack
        .font(.body)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.white).opacity(0.7))
                .frame(width: 352 , height: 37)
        )
        // design search bar
        .padding()
    }
}
