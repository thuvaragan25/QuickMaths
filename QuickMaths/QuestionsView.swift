import SwiftUI

struct QuestionsView: View {
    @State private var correctAnswer = 0
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var score = 0
    @State private var questionCounter = 0
    @State private var operation = 0
    @State private var question = ""
    @State private var answerAsInteger = 0
    @State private var answer = ""
    @State var timeSpent = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if questionCounter < 16 {
                Text("Time: \(timeSpent) seconds")
                    .onReceive(timer){_ in
                        timeSpent += 1
                    }
                Text(question)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                TextField("Answer", text: $answer)
                    .padding(.horizontal)
                
                Button("Submit"){
                    answerAsInteger = Int(answer) ?? 0
                    answerIsCorrect(answer: answerAsInteger)
                    generateQuestions()
                    
                }
                .padding(10)
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 4)
                )
            }else{
                Text("Score: \(score)/15")
                    .font(.headline)
                    .bold()
                Text("Time: \(timeSpent) seconds")
            }

        }.onAppear(perform: generateQuestions)
                
    }
    
    func answerIsCorrect(answer: Int){
        if answer == correctAnswer {
            self.score += 1
        }
    }
    
    
    func generateQuestions(){
        questionCounter += 1
        firstNumber = Int.random(in: 0...20)
        secondNumber = Int.random(in: 0...20)
        operation = Int.random(in: 0..<3)
        
        switch operation {
            case 0:
                question = "\(firstNumber) + \(secondNumber)"
                correctAnswer = firstNumber + secondNumber
            case 1:
                question = "\(firstNumber) - \(secondNumber)"
                correctAnswer = firstNumber - secondNumber
            case 2:
                question = "\(firstNumber) * \(secondNumber)"
                correctAnswer = firstNumber * secondNumber
            
        default:
            question = "\(firstNumber) + \(secondNumber)"
            correctAnswer = firstNumber + secondNumber
        }
    }
}



struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}

