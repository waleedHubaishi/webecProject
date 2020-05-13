package exercise

class Student {

    static constraints = {
    }

    String id;

    ArrayList<String> correctlyAnsweredQuestions = new ArrayList<String>();
    HashMap<String,String> studentAnsweredQuestions = new HashMap<String,String>();


    public ArrayList createCorrectlyAnsweredQuestions(Correction correction){
        for (Object key in correction.studentAnswersMap.keySet()) {
            for (Object innerKey in correction.correctAnswersMap.keySet()) {
                if (key == innerKey) {
                    //if the students answer is the correct answer
                    if (correction.correctAnswersMap.get(key) == correction.studentAnswersMap.get(innerKey)) {
                        correctlyAnsweredQuestions.add(key)
                        break;
                    }
                }
            }
        }

        return correctlyAnsweredQuestions
    }

    public HashMap<String,String> createStudentAnsweredQuestions(ArrayList<Question> questionsList){
        for(int i=0;i<questionsList.size();i++){
            if(correctlyAnsweredQuestions.contains(questionsList.get(i).question) == true){
                studentAnsweredQuestions.put(questionsList.get(i).question,"Correct")
            }
            else if(correctlyAnsweredQuestions.contains(questionsList.get(i).question) == false){
                studentAnsweredQuestions.put(questionsList.get(i).question,"Wrong")
            }
        }
        return studentAnsweredQuestions;
    }


}
