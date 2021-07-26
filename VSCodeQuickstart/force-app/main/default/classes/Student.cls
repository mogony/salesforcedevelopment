public virtual with sharing class Student {
    protected String name, status;
    protected Integer age;
    /*String Array with lessons they are taking (English, Dutch, Mathematics, etc.) */
    public String[] lessons;
    /*Numbers Array of numbers they have for each of these lessons*/
    public Integer[] numbers;
    /*String Arraylist with notes of bad behavior that have been made about this student if, for example, they are late.*/
    public List<String> notes;
    /*Methods to Modify Above Arrays @Line 42 and onwards
    */

    public Student() {
        lessons = new String[]{'English', 'Dutch', 'Mathematics'};
        numbers = new Integer[]{8,9,6};
        notes = new List<String>();
    }

    public Student(String name, String status, Integer age) {
        this();
        this.name = name;
        this.status = status;
        this.age = age;
    }

    public virtual String passYear() {
        return 'Student ' + name + ' is passing this year';
    }

    public String failYear() {
        return 'Student ' + name + ' is failing this year';
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    } 

    public void newCourse(String course, Integer index) {
        lessons[index] = course;
    }

    public void changeGrade(Integer grade, Integer index) {
        numbers[index] = grade;
    }

    public void addNote(String note) {
        notes.add(note);
    }

    public virtual void print() {}

    public virtual class FirstYear extends Student {
        public FirstYear(String name, String status, Integer age) {
            super(name, status, age);
        }

        public override String passYear() {
            return 'Student ' + name + ' is passing their first year';
        }

        public override virtual void print() {

        }
    }

    public class FirstYearHonor extends FirstYear {
        /*Give every new class an implementation of the next methods:
        ● removeFromProgram();
        ● checkForNotes();
        
        ● Every Honor Student must have a way to check whether they still meet the
        requirements of the school. For example, if the school has the condition that an
        Honor Student does not report bad behavior more than once a month. Every Honor
        Student should be able to check this with the method checkForNotes ();
        */

        public FirstYearHonor(String name, String status, Integer age) {
            super(name, status, age);
        }

        public override void print() {
            System.debug('hi');
        }

        /*● Every Honor Student must have a way to convert to a normal student - so every
        Honor Student must implement a removeFromProgram () method.*/
        public Student removeFromProgram() {
            Student stud = new Student(this.name, this.status, this.age);
            return stud;
        }
    }

    public class SecondYear extends Student {
        public SecondYear(String name, String status, Integer age) {
            super(name, status, age);
        }

        public override String passYear() {
            return 'Student ' + name + ' is passing their Second year';
        }

        public override virtual void print() {

        }
    }

    /*public class SecondYearHonor extends SecondYear {
        public SecondYearHonor(String name, String status, Integer age) {
            super(name, status, age);
        }

        public override void print() {
            System.debug('hi');
        }
    }*/

    public class ThirdYear extends Student {
        public ThirdYear(String name, String status, Integer age) {
            super(name, status, age);
        }

        public override String passYear() {
            return 'Student ' + name + ' is passing their Third year';
        }

        public override virtual void print() {

        }
    }

    // public class ThirdYearHonor extends ThirdYear {
    //     public ThirdYearHonor(String name, String status, Integer age) {
    //         super(name, status, age);
    //     }

    //     public override void print() {
    //         System.debug('hi');
    //     }
    // }

    public class FourthYear extends Student {
        public FourthYear(String name, String status, Integer age) {
            super(name, status, age);
        }

        public override String passYear() {
            return 'Student ' + name + ' is passing their Fourth year';
        }

        public override virtual void print() {

        }
    }

    // public class FourthYearHonor extends FourthYear {
    //     public FourthYearHonor(String name, String status, Integer age) {
    //         super(name, status, age);
    //     }

    //     public override void print() {
    //         System.debug('hi');
    //     }
    // } 
}