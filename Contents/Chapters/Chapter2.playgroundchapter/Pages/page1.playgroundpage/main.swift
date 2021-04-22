/*:
 
 # What is genetic?
 
 Genetic is the study of heredity. It's that the programming from behind of all forms of life.
 
 * CELL is the principal structure of living being, inside of cell has the nucleo that contain the chromosome
 * CHROMOSOME is a organized struct that contains the genetics info. It's formed only during in cell division and from a single DNA molecule. We received 23 from our father and 23 from our mother and so we inherited the characteristics.
 * DNA (deoxyribonucleic acid) is a type of nucleic acid that stands out for storing the genetic information of the vast majority of living beings.
 * GENE is the basic physical and functional unit of heredity. Genes are DNA sequence that encodes and determines the characteristics.
 
 You can touch *run my code* and see the structures. You must click in the glass microscope glasses and touch in the circle inside the microscope to view and to return touch in the image.
 
 This are basic concepts to encourage you to study more!!! Curiosity should always be present in a us.
 
*/

//#-hidden-code
import SwiftUI
import PlaygroundSupport

struct Glass: View{
    var text: String
    var image: UIImage
    
    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .saturation(100)
                    .opacity(0.3)
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .blur(radius: 4)
                    .frame(width: 200, height: 100)
            }
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(Color.white)
        }.padding()
    }
}

struct SwiftUIView: View {
    @State var show = false
    @State var nameImage: UIImage = UIImage(named: "cell.jpg") ?? UIImage()
    
    var body: some View {

        ZStack {
            Rectangle()
                .foregroundColor(.black)
            
            VStack {
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "micro.png"))
                        .resizable()
                        .frame(width: 800, height: 900)

                        Button(action: {
                            withAnimation{
                                self.show.toggle()
                            }
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(show ? 0.9 : 0)
                                Image(uiImage: nameImage)
                                    .resizable()
                                    .clipShape(Circle())
                                    .blur(radius: show ? 0 : 8)
                                    .frame(width: show ? 550 : 150, height: show ? 550 : 150)
                                    .padding(.top, show ? 0 : 280)
                                    .padding(.leading, show ? 0 : 120)
                            }
                        }
                }.padding(.top, 200)
                .padding(.bottom, -200)
                ZStack {
                    
                    VStack {
                        Text("Glass Microscope Slides")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        HStack{
                            Button(action: {
                                nameImage = UIImage(named: "cell.jpg") ?? UIImage()
                            }, label: {
                                Glass(text: "Cell's", image: UIImage(named: "cell.jpg") ?? UIImage())
                            })
                            Button(action: {
                                nameImage = UIImage(named: "chromosome.jpg") ?? UIImage()
                            }, label: {
                                Glass(text: "Chromosomes", image: UIImage(named: "chromosome.jpg") ?? UIImage())
                            })
                        
                            Button(action: {
                                nameImage = UIImage(named: "dna.jpg") ?? UIImage()
                            }, label: {
                                Glass(text: "DNA", image: UIImage(named: "dna.jpg") ?? UIImage())
                            })
                            Button(action: {
                                nameImage = UIImage(named: "gene.jpg") ?? UIImage()
                            }, label: {
                                Glass(text: "Genes", image: UIImage(named: "gene.jpg") ?? UIImage())
                            })
                        }
                    }
                    
                    Rectangle()
                        .padding(.top, 150)
                        .foregroundColor(.black)
                        .opacity(show ? 0.9 : 0)
                }
            }
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(SwiftUIView())
//#-end-hidden-code
