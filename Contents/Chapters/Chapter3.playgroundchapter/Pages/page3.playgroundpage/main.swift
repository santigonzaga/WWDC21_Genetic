/*:
 
 # Discover your son's HEIGHT
 
 ### 80% of an adult height depends on genetic factors, the rest is a result of lifestyle and health.
 
 You can change bellow the father's and mother's height (cm) and the gender of baby (.boy or .girl) to find out the approximately the height of the baby.
 
 For example my father has 182cm and my mother has 163cm and I'm a boy. Therefore I would have approximately 179cm.
 */

//#-hidden-code
import SwiftUI
import PlaygroundSupport

enum Sex {
    case boy
    case girl
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, .boy, .girl)
//#-end-hidden-code
var fatherHeight: Double = /*#-editable-code*/182/*#-end-editable-code*/
var motherHeight: Double = /*#-editable-code*/163/*#-end-editable-code*/
var sexOfSon: Sex = /*#-editable-code*/.boy/*#-end-editable-code*/

//#-hidden-code

func Height (fatherHeight: Double, momHeight: Double, baby: Sex) -> Double {
    
    var height: Double = (fatherHeight + momHeight) / 2
    
    if baby == .boy {
        height += 6.5
    }else{
        height -= 6.5
    }
    
    return height
}

var sonHeight: Double = Height(fatherHeight: fatherHeight, momHeight: motherHeight, baby: sexOfSon)

struct ContentView: View {
    var body: some View {
        
        VStack {
            ZStack{
                
            Image(uiImage: #imageLiteral(resourceName: "heigth.jpeg"))
                .resizable()
                .frame(width: .infinity, height: 800)
                .opacity(0.2)
            
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "woman.png"))
                        .resizable()
                        .shadow(color: .blue, radius: 3)
                        .frame(width: 220)
                        .padding(.top, (200 - CGFloat(motherHeight)) * 4)
                    
                    if sexOfSon == .boy{
                        Image(uiImage: #imageLiteral(resourceName: "man.png"))
                            .resizable()
                            .shadow(color: .green, radius: 3)
                            .frame(width: 220)
                            .padding(.horizontal, 50)
                            .padding(.top, (200 - CGFloat(sonHeight)) * 4)
                    }else{
                        Image(uiImage: #imageLiteral(resourceName: "woman.png"))
                            .resizable()
                            .shadow(color: .green, radius: 3)
                            .frame(width: 220)
                            .padding(.horizontal, 50)
                            .padding(.top, (200 - CGFloat(sonHeight)) * 4)
                    }

                    Image(uiImage: #imageLiteral(resourceName: "man.png"))
                        .resizable()
                        .shadow(color: .blue, radius: 3)
                        .foregroundColor(.blue)
                        .frame(width: 220)
                        .padding(.top, (200 - CGFloat(fatherHeight)) * 4)
                }
                .frame(height: 800)
            }
            
            Rectangle()
                .frame(width: .infinity, height: 20)
                .foregroundColor(.black)
                .padding(.top, -10)
            
            HStack(alignment: .center){
                ZStack{
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 230, height: 50)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
                    
                    Text("Mother - \(Int(motherHeight))cm")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 230, height: 50)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
                    
                    Text("Son - \(Int(sonHeight))cm")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal, 80)
                
                ZStack{
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 230, height: 50)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
                    
                    Text("Father - \(Int(fatherHeight))cm")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
            }.padding(.top, 30)
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(ContentView())

//#-end-hidden-code


