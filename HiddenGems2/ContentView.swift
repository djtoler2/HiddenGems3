//
//  ContentView.swift
//  HiddenGems2
//
//  Created by Dwayne Toler on 1/24/24.
//

import SwiftUI

struct ContentView: View {

   //******************************************************************************
    //Create a variables and set to a empty strings as a placeholders to display
    //the questions, answers and feedback on the screen
    @State private var question = ""
    @State private var answer = ""
    @State private var feedback = ""
   //******************************************************************************

   //******************************************************************************
    //Bring in Questions & Answers from QAPair file
    let game1QuestionsAnswers = QAPairs.game1QuestionsAnswers
    let game2QuestionsAnswers = QAPairs.game2QuestionsAnswers
    let game3QuestionsAnswers = QAPairs.game3QuestionsAnswers
   //******************************************************************************
    
    var body: some View {

       //******************************************************************************
        //Create a variable to store the name of the current game being played

        var currentGameQuestions = game1QuestionsAnswers

       //******************************************************************************
            
        VStack {
            
           //******************************************************************************
            //Create a button that selects a random question from the questions array for the current game
           
            Button("Play Game") {
                if let randomQuestion = QAPairs.game1QuestionsAnswers.keys.randomElement() {
                    question = randomQuestion
                }
            }

           //******************************************************************************
            
           //******************************************************************************
            //Create a button that selects a random question from the questions array for the current game
           
            Text(question)
                .padding()

           //******************************************************************************
            
           //******************************************************************************
            //Create a variable to store the answer a user will submit

            TextField("Enter your answer", text: $answer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

           //******************************************************************************
           
           //******************************************************************************
            //Create a button for handling user answer submissionst

            Button("Submit") {
                if question.isEmpty {
                    feedback = "Choose a question before you give an answer"
                }
                else {
                    if let correctAnswer = QAPairs.game1QuestionsAnswers[question] {
                        feedback = answer == correctAnswer ? "Correct" : "Wrong"
                    }
                    else {
                        feedback = "Invalid question"
                    }
                }
                answer = ""
            }

           //******************************************************************************
        }
         // Text view to display feedback
            Text(feedback)
                .padding()
            .padding()
    }
}

#Preview {
    ContentView()
}






