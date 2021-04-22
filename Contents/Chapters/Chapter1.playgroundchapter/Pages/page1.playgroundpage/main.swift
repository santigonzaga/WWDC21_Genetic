/*: 
 
# Hello, world!
 
 My name is santiago. I'm a Computer Science student at UFRGS and I study at apple developer academy in Porto Alegre. I have 18 years old and I'm from Brazil.
 My father is from Spain and his named is Carlos. My mother is from Brazil and her name is Larissa.
 
 You can look my family if you touch in "Run my code".
 
 I always asked myself why do I look like this?
 
 **Does that make me half Brazilian and half Spanish?**
 
 ### Follow me to understand more about genetics!
 
*/

//#-hidden-code
import SwiftUI
import PlaygroundSupport

struct Tree: View {
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            
            Image(uiImage: #imageLiteral(resourceName: "tree.jpeg"))
                .resizable()
                .frame(width: .infinity, height: 1000)
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(Tree())
//#-end-hidden-code
