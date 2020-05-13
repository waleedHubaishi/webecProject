package exercise

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class CorrectionSpec extends Specification implements DomainUnitTest<Correction> {

    Correction correction;

    Question question;
    Question question1;
    Question question2;

    ArrayList<Question> questionsArrayList;
    HashMap<String, String> questionAndCorrectAnswerMap;


    def setup() {
        correction = new Correction();

        //set by the teacher
        question = new Question();
        question1 = new Question();
        question2 = new Question();

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

        questionsArrayList = new ArrayList<>();

        //add the created Question to the ArrayList to be sent to the function
        questionsArrayList.add(question);
        questionsArrayList.add(question1);
        questionsArrayList.add(question2);
    }

    def cleanup() {
    }

    void "test if the created Hashmap will contain only the Question as a key and the correct answer as its value"() {

        when:
        questionAndCorrectAnswerMap = correction.createCorrectAnswersMap(questionsArrayList);

        List<String> possibleAnswers = new ArrayList<String>(Arrays.asList("4", "16", "36"));
        boolean hasFalseValue = false;
        for (String question in questionAndCorrectAnswerMap.keySet()) {
            if (possibleAnswers.contains(questionAndCorrectAnswerMap.get(question)) == false) {
                hasFalseValue = true;
                break
            }
        }

        then:
        false == hasFalseValue
    }
}
