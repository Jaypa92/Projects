function getBotResponse(input){
    if (input == "rock" || input == "Rock") {
        return "Paper";
    } else if (input == "paper" || input == "Paper") {
        return "Scissors";
    } else if (input == "scissors" || input == "Scissors") {
        return "Rock";
    }

    // Simple responses
    if (input == "hello") {
        return "Hello there!";
    } else if (input == "goodbye") {
        return "Talk to you later!";
    } else {
        return "Try asking something else!";
    }
}