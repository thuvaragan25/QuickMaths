import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                VStack {
                    Text("Quick Maths")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 0.1)
                        .foregroundColor(.white)
                    
                    Text("Solve 15 math questions as fast as you can!")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    NavigationLink(destination: QuestionsView()) {
                        Text("Start")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }.padding(10)
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

