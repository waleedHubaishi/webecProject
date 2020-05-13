package exercise

class Correction {

    static constraints = {
    }

    Map<String, String> correctAnswersMap = new HashMap<String, String>();
    Map<String, String> studentAnswersMap = new HashMap<String, String>();

    public Map<String, String> createCorrectAnswersMap(ArrayList<Question> questionsList){
        //go through all the questions submitted by the teacher to construct a new hashmap
        // with question and the correct answers only
        for (int i = 0; i < questionsList.size(); i++) {
            for (Object o in questionsList.get(i).answersForQuestion.keySet()) {
                if (questionsList.get(i).answersForQuestion.get(o) == true) {
                    correctAnswersMap.put(questionsList.get(i).question, o.toString())
                    //stop if you find the first correct answer, assuming there is only one correct answer
                    // for each question
                    break;
                }
            }
        }
        return correctAnswersMap
    }

    public void setCorrectAnswersMap(String key,String value){
        this.correctAnswersMap.put(key,value);
    }

    public Map<String, String> getCorrectAnswersMap(){
        return this.correctAnswersMap;
    }

    public void setStudentAnswersMap(String key,String value){
        this.studentAnswersMap.put(key,value);
    }

    public Map<String, String> getStudentAnswersMap(){
        return this.studentAnswersMap;
    }
}
