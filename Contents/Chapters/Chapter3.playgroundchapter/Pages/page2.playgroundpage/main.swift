/*:
 
 # Discover your son's EYE COLOR
 
  Childs inherit their color from your parents. Although the allele that gives brown color is *dominant*, that is why blue and green eyes are more unusual.

  My parents have brown eyes and me too. You can change bellow the color of the eyes according to your parents and look at the result.
  
  The possible colours is:
 * .brown
 * .blue
 * .green
 
 Later you need press the button to run the code.
 */
//#-hidden-code
import PlaygroundSupport
import SwiftUI

enum EyeColor {
    case blue
    case green
    case brown
}

struct EyeColorPercent {
    var blue: Int
    var green: Int
    var brown: Int
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, .brown, .blue, .green)
//#-end-hidden-code
var eyeFather: EyeColor = /*#-editable-code*/.brown/*#-end-editable-code*/
var eyeMom: EyeColor = /*#-editable-code*/.brown/*#-end-editable-code*/

//#-hidden-code


//: [Next Topic](@next)

func eyeColorCalculator (eyeFather: EyeColor, eyeMom: EyeColor) -> EyeColorPercent {
    
    var percents: EyeColorPercent = EyeColorPercent(blue: 0, green: 0, brown: 0)
    
    if eyeFather == .blue && eyeMom == .blue {
        percents = EyeColorPercent(blue: 99, green: 1, brown: 0)
    }
    else if eyeFather == .green && eyeMom == .green {
        percents = EyeColorPercent(blue: 25, green: 74, brown: 1)
    }
    else if eyeFather == .brown && eyeMom == .brown {
        percents = EyeColorPercent(blue: 19, green: 7, brown: 75)
    }
    else if (eyeFather == .brown && eyeMom == .blue) || (eyeFather == .blue && eyeMom == .brown){
        percents = EyeColorPercent(blue: 50, green: 0, brown: 50)
    }
    else if (eyeFather == .brown && eyeMom == .green) || (eyeFather == .green && eyeMom == .brown){
        percents = EyeColorPercent(blue: 12, green: 38, brown: 50)
    }
    else if (eyeFather == .blue && eyeMom == .green) || (eyeFather == .green && eyeMom == .blue){
        percents = EyeColorPercent(blue: 50, green: 50, brown: 0)
    }
    
    return percents
}

var eyeColor: EyeColorPercent = eyeColorCalculator(eyeFather: eyeFather, eyeMom: eyeMom)

struct Eye: View {
    var color: EyeColor
    var text: String
    
    var body: some View{
        VStack {
            
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 150, height: 30)
                    .cornerRadius(30)
                
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "eye.jpeg"))
                    .resizable()
                    .frame(width: 160, height: 90)
                    .opacity(0.1)
                
                if color == .blue{
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 75, height: 75)
                }else if color == .green{
                    Circle()
                        .fill(Color.green)
                        .frame(width: 75, height: 75)
                }else {
                    Circle()
                        .fill(Color(UIColor.brown))
                        .frame(width: 75, height: 75)
                }
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 55, height: 55)
                    .opacity(0.15)
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
            }.padding()
            
            if color == .blue  || color == . green {
                Text("Recessive allele")
                    .font(.title2)
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                    .padding(.top, -10)
                
            }else{
                Text("Dominant allele")
                    .font(.title2)
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                    .padding(.top, -10)
                    
            }
            
        }
    }
}

struct SwiftUIView: View {
    var body: some View {
        VStack{
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "eye.jpeg"))
                    .resizable()
                    .frame(height: 550)
                    .opacity(0.1)
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 475, height: 475)
                
                HStack(spacing: 0){
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 4.6 * CGFloat(eyeColor.blue), height: 460)
                    
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 4.6 * CGFloat(eyeColor.green), height: 460)

                    Rectangle()
                        .fill(Color(UIColor.brown))
                        .frame(width: 4.6 * CGFloat(eyeColor.brown), height: 460)
                        
                }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 405, height: 405)
                    .opacity(0.15)
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 200, height: 200)
            }.padding()
            
            HStack{
                Eye(color: eyeFather, text: "Father Eye")
                    .padding(.horizontal, 50)
            
            VStack{
                
                ZStack{
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 300, height: 60)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)

                    Text("Blue eyes:    \(eyeColor.blue)%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        
                }.padding()
            
                ZStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 300, height: 60)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)

                    Text("Green eyes:    \(eyeColor.green)%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }.padding()
                ZStack{
                    Rectangle()
                        .fill(Color(UIColor.brown))
                        .frame(width: 300, height: 60)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)

                    Text("Brown eyes:    \(eyeColor.brown)%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }.padding()
            }
                        
                Eye(color: eyeMom, text: "Mom Eye")
                    .padding(.horizontal, 50)
            }
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(SwiftUIView())

//#-end-hidden-code



