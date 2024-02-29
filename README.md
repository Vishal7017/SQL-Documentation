# SQL-Documentation

Creating easy to learn and SQL queries and functions for anyone to use.
Hope you can contribute to this repo and help this tried and tested technology grow.
//
//  ViewController.swift
//  MyQuizApp
//
//  Created by Martin Mozmar on 03/02/24.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
            VStack {
                Text("Total Counts: \(viewModel.totalRounds)")
                    .font(.title)
                    .padding(.bottom, 20)

                HeaderView()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)

                ExpressionView(expression: viewModel.expressionText, solution: viewModel.solutionText)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)

                Button(action: viewModel.play) {
                    Text(viewModel.playButtonTitle)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(20)
                    
                Spacer()
            }
            .padding()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Expression").font(.headline)
            Spacer()
            Text("Solution").font(.headline)
        }
    }
}

struct ExpressionView: View {
    let expression: String
    let solution: String

    var body: some View {
        HStack {
            if expression != "Expression" && solution != "Solution" {
                Text(expression)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                Spacer()
                Text(solution)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            }
        }
    }
}
class QuizViewModel: ObservableObject {
    @Published var totalRounds = 0
    @Published var firstNumber: Int?
    @Published var secondNumber: Int?

    var expressionText: String {
        guard let firstNumber = firstNumber, let secondNumber = secondNumber else {
            return "Expression"
        }
        return "\(firstNumber) + \(secondNumber)"
    }

    var solutionText: String {
        guard let firstNumber = firstNumber, let secondNumber = secondNumber else {
            return "Solution"
        }
        return "\(firstNumber + secondNumber)"
    }

    var playButtonTitle: String {
        return totalRounds == 0 ? "Play" : "Play Again"
    }

    func play() {
        firstNumber = Int.random(in: 0...100)
        secondNumber = Int.random(in: 0...100)
        totalRounds += 1
    }
}


