package exercise

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class StudentSpec extends Specification implements DomainUnitTest<Student> {

    Student student;
    Correction correction;

    Question question;
    Question question1;
    Question question2;
    Student student1;

    ArrayList<Question> questionsArrayList;
    ArrayList<String> corectlyAnsweredQuestionsFromStudent;
    HashMap<Question, String> correctOrWronMap;


    def setup() {

        student = new Student();
        correction = new Correction();

        student.id = 0;

        //set by the teacher
        question = new Question();
        question1 = new Question();
        question2 = new Question();

        questionsArrayList = new ArrayList<>();
        corectlyAnsweredQuestionsFromStudent = new ArrayList<>();
        correctOrWronMap = new HashMap<Question, String>();

        //student for second method test
        student1 = new Student();

    }

    def cleanup() {

        correction.correctAnswersMap.clear()
        correction.studentAnswersMap.clear()

        student.correctlyAnsweredQuestions.clear()

        student1.studentAnsweredQuestions.clear()
        student1.correctlyAnsweredQuestions.clear()

    }


    void "test that the student submitted only one correct answer"() {
        when:

        //only one question should be added, which is "my name is","waleed"
        correction.setCorrectAnswersMap("my name is", "waleed")
        correction.setCorrectAnswersMap("i am studying at", "fhnw")

        correction.setStudentAnswersMap("my name is", "waleed")
        correction.setStudentAnswersMap("i am studying at", "zhaw")

        student.createCorrectlyAnsweredQuestions(correction);

        then:
        //check if there is really one question
        1 == student.correctlyAnsweredQuestions.size();
    }

    void "test that the student submitted no correct answer"() {
        when:

        //no question should be added
        correction.setCorrectAnswersMap("my name is", "julien")
        correction.setCorrectAnswersMap("i am studying at", "fhnw")

        correction.setStudentAnswersMap("my name is", "waleed")
        correction.setStudentAnswersMap("i am studying at", "zhaw")

        student.createCorrectlyAnsweredQuestions(correction);

        then:
        //check if there is really no question
        0 == student.correctlyAnsweredQuestions.size();
    }

    void "test that the student submitted only two correct answer"() {
        when:

        //two question should be added
        correction.setCorrectAnswersMap("my name is", "julien")
        correction.setCorrectAnswersMap("i am studying at", "fhnw")

        correction.setStudentAnswersMap("my name is", "julien")
        correction.setStudentAnswersMap("i am studying at", "fhnw")

        student.createCorrectlyAnsweredQuestions(correction);

        then:
        //check if there is really two question
        2 == student.correctlyAnsweredQuestions.size();
    }

    //submit one question as the only correct answer found in students answer, now check the map of answered questions by student to see
    //if it is registered as a Corect question as it should be, or Wrong which is not right
    void "test that the correct answer submitted from one arrayList is saved as key in a hashmap with Correct as its value "() {
        when:

        question.question = "what is 2*2";
        question1.question = "what is 4*4";
        question2.question = "what is 6*6";

        //the teachers choose, we don't need this here actually, it was just added to simulate the reality
        // and complete the Question object
        question.setAnswersForQuestion("1", false)
        question.setAnswersForQuestion("2", false)
        question.setAnswersForQuestion("3", false)
        question.setAnswersForQuestion("4", true)

        question1.setAnswersForQuestion("10", false)
        question1.setAnswersForQuestion("11", false)
        question1.setAnswersForQuestion("16", true)
        question1.setAnswersForQuestion("20", false)

        question2.setAnswersForQuestion("36", true)
        question2.setAnswersForQuestion("2", false)
        question2.setAnswersForQuestion("30", false)
        question2.setAnswersForQuestion("4", false)

        //add the created Question to the ArrayList to be sent to the function
        questionsArrayList.add(question);
        questionsArrayList.add(question1);
        questionsArrayList.add(question2);

        //the only correct answer that was submitted by the student
        String onlyCorrectQuestion = "what is 4*4";

        corectlyAnsweredQuestionsFromStudent.add(onlyCorrectQuestion);

        student1.setCorrectlyAnsweredQuestions(corectlyAnsweredQuestionsFromStudent)
        correctOrWronMap = student1.createStudentAnsweredQuestions(questionsArrayList)

        String correctFoundAnswerInMap = "";

        for (Object q in correctOrWronMap.keySet()) {
            if (correctOrWronMap.get(q) == "Correct") {
                correctFoundAnswerInMap = q.toString();
            }
        }

        then:
        //The only Question found in the map with a Correct as a value should be the one that we submitted
        correctFoundAnswerInMap == onlyCorrectQuestion;
    }
}
