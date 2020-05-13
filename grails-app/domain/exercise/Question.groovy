package exercise

class Question {

    static constraints = {
    }

    String question;
    Map answersForQuestion = new HashMap<String,Boolean>();
    Map stats = new HashMap<String, Integer>();

    String getQuestion() {
        return question
    }

    void setQuestion(String question) {
        this.question = question
    }

    void setAnswersForQuestion(String str, boolean bool) {
        this.answersForQuestion.put(str,bool);
    }

    Map getAnswersForQuestion() {
       return this.answersForQuestion;
    }




}
